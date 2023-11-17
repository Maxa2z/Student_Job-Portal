<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    
</head>
<body>
    <%
    String jdbcUrl = "jdbc:mysql://localhost:3306/job";
            String sqlusername = "root";
            String sqlpassword = "root";

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String company = request.getParameter("company");
    String experience = request.getParameter("experience");
        try
        {
           Class.forName("com.mysql.cj.jdbc.Driver");
           connection = DriverManager.getConnection(jdbcUrl, sqlusername, sqlpassword);
           statement = connection.createStatement();
           String sqlQuery = "insert into jobreg(email,username,company,experience)values('"+email+"','"+name+"','"+company+"','"+experience+"');";
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
            response.sendRedirect("login_home.jsp");

        }
 %>
</body>
</html>