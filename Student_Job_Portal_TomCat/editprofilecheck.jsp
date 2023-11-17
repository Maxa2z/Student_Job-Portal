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
    String email = request.getParameter("email");
    String location = request.getParameter("location");
    String phonenum = request.getParameter("phonenum");
    String mobilenum = request.getParameter("mobilenum");
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
           connection = DriverManager.getConnection(jdbcUrl, sqlusername, sqlpassword);
           statement = connection.createStatement();
            String query = "UPDATE fullreg SET username=?, fullname=?, location=?, phonenum=?, mobilenum=?  WHERE email=?;";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, fullname);
            pst.setString(3, location);
            pst.setString(4, phonenum);
            pst.setString(5, mobilenum);
            pst.setString(6, email);
            pst.executeUpdate();
            pst.close();
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
            
            response.sendRedirect("EditProfile.jsp");

        }
 %>
</body>
</html>