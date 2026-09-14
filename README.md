# Jewellery Shop Billing Application

A Java-based web application for managing common day-to-day operations in a jewellery shop. It brings customer records, purchases, billing, invoices, income and expenses, and loan information into one place.

I built this project to get hands-on experience with Java web development, JDBC, MySQL, JSP and servlet-based applications while working around a practical business workflow rather than a basic CRUD example.

## What the application does

- Admin login and registration
- Add, view, edit and delete customer records
- Record jewellery purchases and customer purchase details
- Generate and view invoice information
- Maintain income and expense records
- Manage loan-related information
- View recent purchases and customer information
- Access the main modules from a web-based dashboard

## Tech Stack

- **Language:** Java
- **Backend:** Java Servlets, JDBC
- **Frontend:** JSP, HTML, CSS, JavaScript, Bootstrap
- **Database:** MySQL
- **Server:** Apache Tomcat
- **IDE:** Eclipse or IntelliJ IDEA

## Project Structure

```text
Jewellery-Shop-Billing-Application/
├── java/
│   └── com/ba/
│       ├── controllers/
│       ├── dao/
│       └── model/
├── webapp/
│   ├── WEB-INF/
│   ├── META-INF/
│   └── *.jsp
├── LICENSE
└── README.md
```

The `controllers` package contains the application/request-handling code, `dao` contains database access code, and `model` contains the data classes used by the application.

## Requirements

Install the following before running the project:

1. **JDK 8 or later**
2. **MySQL Server**
3. **Apache Tomcat 9** or another compatible Tomcat version
4. **Eclipse IDE for Enterprise Java and Web Developers** or **IntelliJ IDEA**

## Database Setup

The application uses MySQL to store customer, purchase, income/expense and loan data.

1. Start the MySQL service.
2. Create a database for the application.
3. Create the tables required by the project.
4. Open:

```text
java/com/ba/dao/connectDB.java
```

5. Update the database URL, username and password with your local MySQL credentials.

For example:

```java
DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/your_database",
    "root",
    "your_password"
);
```

Do not commit real passwords or production database credentials to the repository.

## How to Run

### Eclipse

1. Clone the repository:

```bash
git clone https://github.com/Priyanshu0403/Jewellery-Shop-Billing-Application.git
```

2. Open the project in Eclipse.
3. Import it as a Dynamic Web Project if Eclipse does not detect the project automatically.
4. Configure Apache Tomcat as the server.
5. Make sure the MySQL Connector/J library is available to the project.
6. Update the database credentials in `connectDB.java`.
7. Right-click the project and select **Run As → Run on Server**.
8. Open the application at the localhost URL provided by Tomcat. A typical URL is:

```text
http://localhost:8080/Jewellery-Shop-Billing-Application/
```

The context path can be different depending on the server configuration.

### IntelliJ IDEA

1. Clone and open the repository.
2. Configure a local Tomcat server.
3. Configure the project as a Java web application.
4. Make sure the MySQL Connector/J dependency is available.
5. Update the database credentials in `connectDB.java`.
6. Start the Tomcat configuration and open the generated localhost URL.

## Main Modules

### Customer Management

Users can add customer details, view existing customers, edit records and remove outdated information.

### Purchase & Billing

Purchase details can be recorded and reviewed, with pages for invoice and billing information.

### Income & Expenses

The application keeps business income and expense records so financial activity can be reviewed from the system.

### Loan Management

Loan-related information can be recorded and viewed through the loan management pages.

### Dashboard

The dashboard provides access to the application's main features after login.

## Troubleshooting

If the application does not start or cannot connect to MySQL, check these first:

- MySQL is running
- The database name is correct
- The username and password are correct
- MySQL is using the expected port (normally `3306`)
- MySQL Connector/J is available on the project classpath
- Tomcat is configured correctly
- The application's context path matches the URL being opened

## Future Improvements

Some areas that could be improved in a production version include:

- Password hashing and stronger authentication
- Moving database credentials to environment variables
- Better server-side validation and error handling
- Improved transaction handling for billing and purchases
- PDF invoice generation
- Sales and expense reports
- More responsive UI for mobile devices
- Automated unit and integration tests

## Project Status

This project was developed as a practical Java web application and can be extended further with additional security, reporting and deployment features.

## License

See the `LICENSE` file included in this repository.
