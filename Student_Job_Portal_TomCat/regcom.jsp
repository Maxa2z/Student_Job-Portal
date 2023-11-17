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

    String username = request.getParameter("username");
    String fullname = request.getParameter("fullname");
    String location = request.getParameter("location");
    String email = request.getParameter("email");
    String phonenum = request.getParameter("phonenum");
    String mobilenum = request.getParameter("mobilenum");
        try
        {
           Class.forName("com.mysql.cj.jdbc.Driver");
           connection = DriverManager.getConnection(jdbcUrl, sqlusername, sqlpassword);
           statement = connection.createStatement();
           String sqlQuery = "insert into fullreg(email,username,fullname,location,phonenum,mobilenum)values('"+email+"','"+username+"','"+fullname+"','"+location+"','"+phonenum+"','"+mobilenum+"');";
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
            response.sendRedirect("login.html");

        }
 %>
</body>
</html>