<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <%
    String jdbcUrl = "jdbc:mysql://localhost:3306/job";
            String sqlusername = "root";
            String sqlpassword = "root";

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            session = request.getSession();

            String email = request.getParameter("email_log");
            String password = request.getParameter("Password_log");
        try
        {
           Class.forName("com.mysql.cj.jdbc.Driver");
           connection = DriverManager.getConnection(jdbcUrl, sqlusername, sqlpassword);
           statement = connection.createStatement();
           String sqlQuery = "SELECT * FROM register";

           resultSet = statement.executeQuery(sqlQuery);
           int c=0;
           while(resultSet.next()) {
            if(password.equals(resultSet.getString("userpassword")) ){
                if(email.equals(resultSet.getString("email"))){
                    c=1;
                }
            }
         }
         if(c != 0){
            session.setAttribute("email",email);
            response.sendRedirect("login_home.jsp");
       }
       else{
          request.setAttribute("status", "failed"); 
        %>
        <%
           response.sendRedirect("login.html");
       }

           
        }
    catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
</body>
</html>