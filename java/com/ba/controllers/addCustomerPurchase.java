package com.ba.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.Arrays;

import com.ba.dao.connectDB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addCustomerPurchase")
public class addCustomerPurchase extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            // Retrieve Customer Details
            String uName = req.getParameter("name");
            String uNumber = req.getParameter("number");

            // Handle Null for Date
            LocalDate uDate = parseDate(req.getParameter("date"), LocalDate.now());

            // Handle Null for Paid Amount
            double uPaid = parseDouble(req.getParameter("paid"), 0.0);

            // Retrieve multiple items from request
            String[] itemNames = req.getParameterValues("itemName[]");
            String[] quantities = req.getParameterValues("quantity[]");
            String[] weights = req.getParameterValues("weight[]");
            String[] prices = req.getParameterValues("price[]");

            if (itemNames == null || quantities == null || weights == null || prices == null) {
                System.out.println("No items found in request.");
                resp.sendRedirect("addCustomerPurchase.jsp?error=NoItems");
                return;
            }

            // Calculate total amount
            double totalAmount = 0;
            for (int i = 0; i < itemNames.length; i++) {
                double itemTotal = parseInteger(quantities[i], 0) * parseDouble(prices[i], 0.0);
                totalAmount += itemTotal;
            }
            double dueAmount = totalAmount - uPaid;

            // Database Connection
            Connection CONN = connectDB.getConnection();
            CONN.setAutoCommit(false); // Start transaction

            // Insert Customer Purchase
            PreparedStatement ps = CONN.prepareStatement(
                    "INSERT INTO customer_purchase (customer_name, contact_number, total_amount, purchase_date, amount_paid, due_amount) VALUES (?, ?, ?, ?, ?, ?)",
                    PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setString(1, uName);
            ps.setString(2, uNumber);
            ps.setDouble(3, totalAmount);
            ps.setDate(4, java.sql.Date.valueOf(uDate)); // Convert LocalDate to SQL Date
            ps.setDouble(5, uPaid);
            ps.setDouble(6, dueAmount);

            int count = ps.executeUpdate();
            int generatedPurchaseId = -1;

            // Get generated purchase_id
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedPurchaseId = rs.getInt(1);
            }
            rs.close();
            ps.close();

            // Insert Purchased Items
            if (count > 0 && generatedPurchaseId != -1) {
                PreparedStatement psItem = CONN.prepareStatement(
                        "INSERT INTO purchased_items (purchase_id, item_name, quantity, weight, price_per_unit) VALUES (?, ?, ?, ?, ?)");

                for (int i = 0; i < itemNames.length; i++) {
                    psItem.setInt(1, generatedPurchaseId);
                    psItem.setString(2, itemNames[i]);
                    psItem.setInt(3, parseInteger(quantities[i], 0));
                    psItem.setFloat(4, parseFloat(weights[i], 0.0f));
                    psItem.setDouble(5, parseDouble(prices[i], 0.0));
                    psItem.addBatch();
                }

                int[] itemCount = psItem.executeBatch();
                psItem.close();

                if (Arrays.stream(itemCount).allMatch(val -> val > 0)) {
                    CONN.commit(); // Commit transaction if all inserts were successful
                    System.out.println("Purchase Successful");
                    RequestDispatcher rd = req.getRequestDispatcher("addCustomerPurchase.jsp?success=1");
                    rd.forward(req, resp);
                } else {
                    CONN.rollback(); // Rollback transaction on failure
                    System.out.println("Customer Purchase Insert Failed");
                    resp.sendRedirect("addCustomerPurchase.jsp?error=InsertFailed");
                }
            } else {
                System.out.println("Purchase Unsuccessful");
                resp.sendRedirect("addCustomerPurchase.jsp?error=PurchaseFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Helper Methods for Safe Parsing
    private Integer parseInteger(String value, Integer defaultValue) {
        try {
            return (value != null && !value.isEmpty()) ? Integer.parseInt(value.trim()) : defaultValue;
        } catch (NumberFormatException e) {
            System.out.println("Invalid Integer: " + value);
            return defaultValue;
        }
    }

    private Float parseFloat(String value, Float defaultValue) {
        try {
            return (value != null && !value.isEmpty()) ? Float.parseFloat(value.trim()) : defaultValue;
        } catch (NumberFormatException e) {
            System.out.println("Invalid Float: " + value);
            return defaultValue;
        }
    }

    private Double parseDouble(String value, Double defaultValue) {
        try {
            return (value != null && !value.isEmpty()) ? Double.parseDouble(value.trim()) : defaultValue;
        } catch (NumberFormatException e) {
            System.out.println("Invalid Double: " + value);
            return defaultValue;
        }
    }

    private LocalDate parseDate(String value, LocalDate defaultValue) {
        try {
            return (value != null && !value.isEmpty()) ? LocalDate.parse(value.trim()) : defaultValue;
        } catch (Exception e) {
            System.out.println("Invalid Date: " + value);
            return defaultValue;
        }
    }
}
