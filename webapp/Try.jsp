<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String message = "";

    if (username != null && password != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "root", "your_password");

            // Check if username and password match
            String loginQuery = "SELECT * FROM users WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(loginQuery);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Login successful - Fetch purchase data
                message = "Login successful!";
                String purchaseQuery = "SELECT * FROM purchases WHERE student_id = ?";
                pstmt = conn.prepareStatement(purchaseQuery);
                pstmt.setInt(1, rs.getInt("id"));  // Assuming student ID is in the users table
                ResultSet purchaseRs = pstmt.executeQuery();

                // Store purchase data in an ArrayList
                ArrayList<String> purchases = new ArrayList<>();
                while (purchaseRs.next()) {
                    String item = purchaseRs.getString("item_name") + " - ₹" + purchaseRs.getDouble("price");
                    purchases.add(item);
                }

                // Pass purchase data to the dashboard
                request.setAttribute("purchases", purchases);
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            } else {
                message = "Invalid username or password.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error occurred: " + e.getMessage();
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Login</h2>
        <form method="post" action="login.jsp">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <p class="text-danger mt-3"><%= message %></p>
    </div>
</body>
</html>
