<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>
<body>
    <%
    String jdbcUrl = "jdbc:mysql://localhost:3306/job";
            String sqlusername = "root";
            String sqlpassword = "root";

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

    String name = request.getParameter("name_reg");
    String email = request.getParameter("email_reg");
    String password = request.getParameter("Password_reg");
    String conform_password = request.getParameter("conform_password_reg");
    if(password.equals(conform_password)){
        try
        {
           Class.forName("com.mysql.cj.jdbc.Driver");
           connection = DriverManager.getConnection(jdbcUrl, sqlusername, sqlpassword);
           statement = connection.createStatement();
           String sqlQuery = "insert into register(email,username,userpassword)values('"+email+"','"+name+"','"+password+"');";
           statement.executeUpdate(sqlQuery);
           
        }
    catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
        finally
        {
            try { resultSet.close(); } catch (Exception e) { }
            try { statement.close(); } catch (Exception e) { }
            try { connection.close(); } catch (Exception e) { }
            response.sendRedirect("regprofile.jsp");

        }
    }
    else{
        out.println("<h1>password not matched</h1>");
    }
 %>
</body>
</html>