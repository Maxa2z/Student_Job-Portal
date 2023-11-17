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
  <title>Edit</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>
<body>
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


      <div class="container-xl px-4 mt-4">
        <hr class="mt-0 mb-4">
        <div class="row">
            <div class="col-xl-4">
                <!-- Profile picture card-->
                <div class="card mb-4 mb-xl-0">
                    <div class="card-header">Profile Picture</div>
                    <div class="card-body text-center">
                        <!-- Profile picture image-->
                        <img class="img-account-profile rounded-circle mb-2" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="">
                        <!-- Profile picture help block-->
                        <div class="small font-italic text-muted mb-4">JPG or PNG no larger less then 5 MB</div>
                        <!-- Profile picture upload button-->
                        <button class="btn btn-primary"  type="button" disabled>Upload new image</button>
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <!-- Account details card-->
                <div class="card mb-4">
                    <div class="card-header">Account Details</div>
                    <div class="card-body">
                        <form action="editprofilecheck.jsp" method="post">
                            <!-- Form Group (username)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="username">Username (how your name will appear to other users on the site)</label>
                                <input class="form-control" id="username" name="username" type="text" placeholder="Enter your username" >
                            </div>
                            <!-- Form Group (email address)-->
                            <div class="mb-3">
                              <label class="small mb-1" for="email">Email address(Don't Change email)</label>
                              <input class="form-control" id="email" name="email" type="email" placeholder="Enter your email address " value='<%= session.getAttribute("email")%>' >
                          </div>
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (first name)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="fullname">Full name</label>
                                    <input class="form-control" id="fullname" name="fullname" type="text" placeholder="Enter your first name" >
                                </div>
                            </div>
                            <!-- Form Row        -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (organization name)
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputOrgName">Organization name</label>
                                    <input class="form-control" id="inputOrgName" type="text" placeholder="Enter your organization name" value="Vignan student">
                                </div>-->
                                <!-- Form Group (location)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="location">Location</label>
                                    <input class="form-control" name="location" id="location" type="text" placeholder="Enter your location" value="Vadlamudi">
                                </div>
                            </div>
                            
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (phone number)-->
                                <div class="col-md-6">
                                  <label class="small mb-1" for="phonenum">Phone number</label>
                                  <input class="form-control" id="phonenum" name="phonenum" type="tel" placeholder="Enter your phone number">
                              </div>
                                <div class="col-md-6">
                                  <label class="small mb-1" for="mobilenum">Mobile number</label>
                                  <input class="form-control" id="mobilenum" name="mobilenum" type="tel" placeholder="Enter your phone number" required>
                              </div>
                            <!-- Save changes button-->
                            <button class="btn btn-primary mt-4" type="submit">Save changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>