<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Database Interaction</title>
</head>
<body>
    <h1>Data from Database</h1>
    <ul>
        <% 
            // JDBC URL, username, and password
            String jdbcUrl = "jdbc:mysql://localhost:3306/job";
            String username = "root";
            String password = "root";
            
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            
            try {
                // Connect to the database
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcUrl, username, password);
                
                // Create a SQL statement
                statement = connection.createStatement();
                String sqlQuery = "SELECT * FROM register";
                
                // Execute the query
                resultSet = statement.executeQuery(sqlQuery);
                
                // Display the data
                while (resultSet.next()) {
                    String data = resultSet.getString("email");
                    String name = resultSet.getString("userpassword");
                    <li><%= data +" "+name %></li>
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close the resources
                try { resultSet.close(); } catch (Exception e) { }
                try { statement.close(); } catch (Exception e) { }
                try { connection.close(); } catch (Exception e) { }
            }
        %>
    </ul>
</body>
</html>
