<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
  if(session.getAttribute("email")==null)
  {
    response.sendRedirect("Home.html");
  }
  else
  {
    String username=(String)session.getAttribute("email");
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body><%
    String jdbcUrl = "jdbc:mysql://localhost:3306/job";
            String sqlusername = "root";
            String sqlpassword = "root";

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

    String Current_password = request.getParameter("Current_password");
    String newpassword = request.getParameter("password");
    String conform_password = request.getParameter("conform_password");
    String email = (String)session.getAttribute("email");
    if(newpassword.equals(conform_password)){
        try
        {
            
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcUrl, sqlusername, sqlpassword);
                    statement = connection.createStatement();
                    String sqlQuery = "SELECT * FROM register";
                    resultSet = statement.executeQuery(sqlQuery);
                    int c=0;
                    //String em;
                        while(resultSet.next()) {
                            if(Current_password.equals(resultSet.getString("userpassword")) ){
                                c=1;
                               // em = resultSet.getString("email");
                            }
                        }
                    try { resultSet.close(); } catch (Exception e) { }
                    try { statement.close(); } catch (Exception e) { }
                    try { connection.close(); } catch (Exception e) { }
                            if(c != 0){
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                connection = DriverManager.getConnection(jdbcUrl, sqlusername, sqlpassword);
                                statement = connection.createStatement();
                                String query = "UPDATE register SET userpassword=?  WHERE email=?;";
                                PreparedStatement pst = connection.prepareStatement(query);
                                pst.setString(1, newpassword);
                                pst.setString(2, email);
                                pst.executeUpdate();
                                pst.close();
                            }
                            else{
                                out.println("Current password is wrong");
                            }
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
            
            response.sendRedirect("changepass.html");
        }
    }
    else{
        out.println("new password and conform password are not same");
    }
 %>
    
</body>
</html>