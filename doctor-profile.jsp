<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, model.*, java.util.*" %>

<%-- restrict page access --%>
<%@ include file="doctorAuthenticationGuard.jsp"%>

<%
    Doctor doctor = (Doctor) session.getAttribute("doctor-database-obj");

    DoctorDAO doctorDAO = new DoctorDAO();

    doctor = doctorDAO.getDoctorInfo(doctor.getId());

%>

<!doctype html>
<html lang="en">
<head>

    <title>Doctor.gr | My Profile</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="css/doctor-profile.css">
</head>

<body>

    <!-- Navigation Bar-->
    <%@ include file="navbar-doctor-settings.jsp" %>

    <!-- Page Content -->
    <div class="main-panel">
        <div class="container">
            <div class="row">
                <div class="col-md-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="profile-card">
                            <div class="profile-header">    
                                <div class="user-image">
                                    <img src="images/profile-pic.jpg" alt="profile">
                                </div>
                            </div>
                            <div class="profile-content">
                                <div class="profile-name"><%=doctor.getFullName()%></div>
                                <div class="profile-designation"><%=doctor.getSpecialty()%></div>
                                <ul class="profile-info-list">
                                    <a href="my-appointments_doctor.jsp"><button type="button" class="profile-info-list-item" id="button">My Appointments</button></a>
                                    <a href="index.jsp"><button type="button" class="profile-info-list-item" id="button" href="<%= request.getContextPath() %>/logout-doctor.jsp">Log Out</button></a>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-title font-weight-bold">Settings</p>
                            <hr>
                            <p class="card-description">Personal Information</p>
                            <ul class="about">
                                <li class="about-items"><i class="mdi mdi-account icon-sm "></i><span class="about-item-name">Name:</span><span class="about-item-detail"><%=doctor.getName()%></span></li>
                                <li class="about-items"><i class="mdi mdi-mail-ru icon-sm "></i><span class="about-item-name">Surname:</span><span class="about-item-detail"><%=doctor.getSurname()%></span></li>
                                <li class="about-items"><i class="mdi mdi-account icon-sm "></i><span class="about-item-name">Username:</span><span class="about-item-detail"><%=doctor.getUsername()%></span></li>
                                <li class="about-items"><i class="mdi mdi-account icon-sm "></i><span class="about-item-name">Specialty:</span><span class="about-item-detail"><%=doctor.getSpecialty()%></span></li>
                            </ul>
                            <p class="card-description">Contact Information</p>
                            <ul class="about">
                                <li class="about-items"><i class="mdi mdi-phone icon-sm "></i><span class="about-item-name">Phone Number:</span><span class="about-item-detail"><%=doctor.getPhoneNumber()%></span></li>
                                <li class="about-items"><i class="mdi mdi-map-marker icon-sm "></i><span class="about-item-name">Email:</span><span class="about-item-detail"><%=doctor.getEmail()%></span></li>
                                <li class="about-items"><i class="mdi mdi-email-outline icon-sm "></i><span class="about-item-name">Address:</span><span class="about-item-detail"><a href=""><%=doctor.getAddress()%></a></span></li>
                                <li class="about-items"><i class="mdi mdi-email-outline icon-sm "></i><span class="about-item-name">Area:</span><span class="about-item-detail"><a href=""><%=doctor.getArea()%></a></span></li>
                            </ul>
                            <a href="/ismgroup96/edit-doctor.jsp?id=<%=doctor.getId()%>" class="btn btn-xs btn-default btn-block" title="Edit">Edit <i class="material-icons" style="vertical-align: -6px;">create</i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>