
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
  if(session.getAttribute("email")==null)
  {
    response.sendRedirect("Home.html");
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile.</title>
    <link rel="stylesheet" href="profile.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    
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
            String proname;
            String fullname;
            String loc;
            String phone;
            String mobile;
            //string username = session.getAttribute("email");
        try
        {
           Class.forName("com.mysql.cj.jdbc.Driver");
           connection = DriverManager.getConnection(jdbcUrl, sqlusername, sqlpassword);
           statement = connection.createStatement();
           String sqlQuery = "SELECT * FROM fullreg";

           resultSet = statement.executeQuery(sqlQuery);
           int c=0;
           while(resultSet.next()) {
            if(session.getAttribute("email").equals(resultSet.getString("email")) ){
              %>
              <div>
                <div class="start_nav">
                  <nav class="navbar navbar-dark bg-dark" aria-label="Dark offcanvas navbar">
                      <div class="container-fluid">
                        <a class="navbar-brand" href="#">Magicloc.in</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbarDark" aria-controls="offcanvasNavbarDark" aria-label="Toggle navigation">
                          <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbarDark" aria-labelledby="offcanvasNavbarDarkLabel">
                          <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasNavbarDarkLabel">Magicloc.in</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                          </div>
                          <div class="offcanvas-body">
                            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                              <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="login_home.jsp">Home</a>
                              </li>
                              <li><a class="dropdown-item" href="Profile.jsp">Profile</a></li>
                              <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                  More
                                </a>
                                <ul class="dropdown-menu">
                                  <li><a class="dropdown-item" href="EditProfile.jsp">EditProfile</a></li>
                                  <li><a class="dropdown-item" href="settings.html">Settings</a></li>
                                  <li>
                                    <hr class="dropdown-divider">
                                  </li>
                                  <li><a class="dropdown-item" href="logout.jsp">log out</a></li>
                                </ul>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </nav>
              </div>
                <div>
                    <!--Profile page-->
                    <div class="container mt-5">
                        <div class="main-body">
                              <div class="row gutters-sm">
                                <div class="col-md-4 mb-3">
                                  <div class="card">
                                    <div class="card-body">
                                      <div class="d-flex flex-column align-items-center text-center">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
                                        <div class="mt-3">
                                          <h4><%= resultSet.getString("username") %></h4>
                                          <p class="text-secondary mb-1">Student</p>
                                          <p class="text-muted font-size-sm">Vignan</p>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-8">
                                  <div class="card mb-3">
                                    <div class="card-body">
                                      <div class="row">
                                        <div class="col-sm-3">
                                          <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                          <%= resultSet.getString("fullname") %>
                                        </div>
                                      </div>
                                      <hr>
                                      <div class="row">
                                        <div class="col-sm-3">
                                          <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                          <%= resultSet.getString("email") %>
                                        </div>
                                      </div>
                                      <hr>
                                      <div class="row">
                                        <div class="col-sm-3">
                                          <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                        <%= resultSet.getString("phonenum") %>
                                        </div>
                                      </div>
                                      <hr>
                                      <div class="row">
                                        <div class="col-sm-3">
                                          <h6 class="mb-0">Mobile</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                          <%= resultSet.getString("mobilenum") %>
                                        </div>
                                      </div>
                                      <hr>
                                      <div class="row">
                                        <div class="col-sm-3">
                                          <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                          <%= resultSet.getString("location") %>
                                        </div>
                                      </div>
                                      <hr>
                                      <div class="row">
                                        <div class="col-sm-12">
                                          <a class="btn btn-info " href="EditProfile.jsp">Edit</a>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                    
                            </div>
                        </div>
                </div>
              <%
              proname=resultSet.getString("username");
              fullname=resultSet.getString("fullname");
              loc=resultSet.getString("location");
              phone=resultSet.getString("phonenum");
              mobile=resultSet.getString("mobilenum");
            }
         }  
        }
    catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    
</body>
</html>