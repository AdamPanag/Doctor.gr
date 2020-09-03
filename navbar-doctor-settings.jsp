<head>
  <link rel="stylesheet" type="text/css" href="css/navbar.css">
</head>

<html>
    <body>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Doctor.gr</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contactUs.jsp">Contact us</a>
                    </li>
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=doctor.getFullName()%><span class="sr-only">(current)</span></a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item active" href="doctor-profile.jsp">Settings</a>
                            <a class="dropdown-item" href="my-appointments_doctor.jsp">My Appointments</a>
                            <a class="dropdown-item" href="<%= request.getContextPath() %>/logout-doctor.jsp"><span class="sr-only" href="index.jsp"></span> Log out</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    </body>
</html>