<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>

    <title>doctorprofile</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="css/doctor-profile.css">
</head>

<body>
    <!-- Navigation Bar-->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#">Doctor.gr</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact us</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Adam Panagiotidis</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item active" href="#">Settings</a>
                            <a class="dropdown-item" href="#">My Appointments</a>
                            <a class="dropdown-item" href="#">Log Out</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

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
                                <div class="profile-name">Adam Panagiotidis</div>
                                <div class="profile-designation">Pathologist</div>
                                <ul class="profile-info-list">
                                    <a href="doctor-profile.jsp"><button type="button" class="profile-info-list-item" id="button">Settings</button></a>
                                    <button type="button" class="profile-info-list-item" id="button">My Appointments</button>
                                    <button type="button" class="profile-info-list-item" id="button">Log Out</button>
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
                                <li class="about-items"><i class="mdi mdi-account icon-sm "></i><span class="about-item-name">Name:</span><span class="about-item-detail">Adam</span><a href="" class="about-item-edit">Edit</a></li>
                                <li class="about-items"><i class="mdi mdi-mail-ru icon-sm "></i><span class="about-item-name">Surname:</span><span class="about-item-detail">Panagiotidis</span> <a href="" class="about-item-edit">Edit</a></li>
                                <li class="about-items"><i class="mdi mdi-lock-outline icon-sm "></i><span class="about-item-name">Password:</span><span class="about-item-detail">**********</span> <a href="" class="about-item-edit">Edit</a></li>
                                <li class="about-items"><i class="mdi mdi-account icon-sm "></i><span class="about-item-name">Occupation:</span><span class="about-item-detail">Pathologist</span><a href="" class="about-item-edit">Edit</a></li>
                            </ul>
                            <p class="card-description">Contact Information</p>
                            <ul class="about">
                                <li class="about-items"><i class="mdi mdi-phone icon-sm "></i><span class="about-item-name">Phone:</span><span class="about-item-detail">+30 6984417433</span><a href="" class="about-item-edit">Edit</a></li>
                                <li class="about-items"><i class="mdi mdi-map-marker icon-sm "></i><span class="about-item-name">Email:</span><span class="about-item-detail">adampanag06@gmail.com</span> <a href="" class="about-item-edit">Edit</a></li>
                                <li class="about-items"><i class="mdi mdi-email-outline icon-sm "></i><span class="about-item-name">Address:</span><span class="about-item-detail"><a href="">Athens, Ekali</a></span> <a href="" class="about-item-edit">Edit</a></li>
                            </ul>
                            <p class="card-description">Education</p>
                            <ul class="about">
                                <li class="about-items"><i class="mdi mdi-cake icon-sm "></i><span class="about-item-name">Master's Degree:</span><span class="about-item-detail">British School of Medicine</span><a href="" class="about-item-edit">Edit</a></li>
                                <li class="about-items"><i class="mdi mdi-account icon-sm "></i><span class="about-item-name">Bachelor's Degree:</span><span class="about-item-detail">National and Kapodistrian University of Athens</span> <a href="" class="about-item-edit">Edit</a></li>       
                            </ul>
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