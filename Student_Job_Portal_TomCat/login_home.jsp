
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
    <title>Magicloc.in</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<body>

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
                        <li><a class="dropdown-item" href="#"><%= session.getAttribute("email") %></a></li>
                        <li><a class="dropdown-item" href="logout.jsp">log out</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </nav>

          <div>
            
          </div>

          <div class="container py-3">
            <header>
              <div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom">
                <a href="/" class="d-flex align-items-center link-body-emphasis text-decoration-none">
                  <h1><span class="fs-4 mb-4 display-4 fw-normal text-body-emphasis">Job Offer</span></h1>
                </a>
              </div>
          
              <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
                <h1 class="display-4 fw-normal text-body-emphasis mb-4">Apply.</h1>
                <p class="fs-5 text-body-secondary"> We have a wide range of job openings across different industries, from entry-level to senior positions, suitable for various qualifications and experience levels. Our website offers an easy-to-use interface to locate the relevant job postings and submit your job application online. </p>
              </div>
            </header>
          
            <main>
              <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">Google</h4>
                    </div>
                    <div class="card-body">
                      <h1 class="card-title pricing-card-title">Chennai<small class="text-body-secondary fw-light">/Tamil Nadu</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>30 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">amazon</h4>
                    </div>
                    <div class="card-body">
                      <h1 class="card-title pricing-card-title">Bengaluru<small class="text-body-secondary fw-light">/Karnataka</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>36 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">Wipro</h4>
                    </div>
                    <div class="card-body">
                      <h1 class="card-title pricing-card-title" >Bengaluru<small class="text-body-secondary fw-light">/Karnataka</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>25 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">Microsoft</h4>
                    </div>
                    <div class="card-body">
                      <h1 class="card-title pricing-card-title">Hyderabad<small class="text-body-secondary fw-light">/Telangana</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>20 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">TCS PUNE</h4>
                    </div>
                    <div class="card-body">
                      <h1 class="card-title pricing-card-title">Pune<small class="text-body-secondary fw-light">/Maharashtra</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>20 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">IBM</h4>
                    </div>
                    <div class="card-body">
                      <h1 class="card-title pricing-card-title">Hyderabad<small class="text-body-secondary fw-light">/Telangana</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>15 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">Accenture</h4>
                    </div>
                    <div class="card-body">
                      <h1 class="card-title pricing-card-title">Hyderabad<small class="text-body-secondary fw-light">/Telangana</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>12 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">Infosys</h4>
                    </div>
                    <div class="card-body">
                      <h1 class="card-title pricing-card-title">Bengaluru<small class="text-body-secondary fw-light">/Karnataka</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>12 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">Cisco</h4>
                    </div>
                    <div class="card-body">
                      <h1 class="card-title pricing-card-title">Chennai<small class="text-body-secondary fw-light">/Tamil Nadu</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>15 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">HCL Info</h4>
                    </div>
                    <div class="card-body">
                      <h1 class="card-title pricing-card-title">Vijayawada<small class="text-body-secondary fw-light">/AP</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>12 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">Tech Mahindra</h4>
                    </div>
                    <div class="card-body">
                      <h1 class="card-title pricing-card-title">Madhapur<small class="text-body-secondary fw-light">/Telangana</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>20 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                <div class="col mb-4 mt-5">
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <h4 class="my-0 fw-normal">Mphasis</h4>
                    </div>
                    <div class="card-body ">
                      <h1 class="card-title pricing-card-title">Mangaluru<small class="text-body-secondary fw-light">/Karnataka</small></h1>
                      <ul class="list-unstyled mt-3 mb-4">
                        <li>Package</li>
                        <li>15 per Annum</li>
                        <li>Full-Time</li>
                      </ul>
                      <button type="button" onclick="apply()" class="w-100 btn btn-lg btn-primary">Apply</button>
                    </div>
                  </div>
                </div>
                
              </div>
          </div>

    </div>
    <div class="slid">
        
    </div>
    <script type="text/javascript" src="login_home.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>