<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jewelry Shop</title>
    <link href="bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            background-image: url('BackGroundImg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
        }
        .overlay {
            background-color: rgba(0, 0, 0, 0.6);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .heading {
            font-family: 'Playfair Display', serif;
            text-align: center;
            color: #ef9713;
            font-size: 4rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .subheading {
            font-family: 'Playfair Display', serif;
            color: #ab7e3f;
            font-size: 1.5rem;
            margin-top: 10px;
            letter-spacing: 1px;
        }
        .content {
            position: relative;
            z-index: 2;
            text-align: center;
            padding-top: 20vh;
        }
        .btn-custom {
            background-color: #ffdd75;
            color: #000;
        }
        
        .fade{
            color: black;
        }
        
        img{
         	color:gold;
         	height:30px; 
        }
    </style>
</head>
<body>
    <div class="overlay"></div>

    <div class="content">
        <h1 class="heading">Manikarnika Jeweller's</h1>
        <p class="subheading">Crafting Elegance, One Jewel at a Time</p>
            <img class="w-50" src="line_divider.png" alt="divider-image">
        <div id="carouselExample" class="carousel slide ">
      <div class="carousel-indicators ">
        <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <!-- <img src="BackGroundImg.jpg" class="d-block w-100" alt="..."> -->
            <div class="text-center mt-5 w-100 ">
              	<h1>Welcome to Jewellery Shop</h1>
        		<p>Manage your shop with ease using our billing system.</p>
              <br>
              <br>
            </div>
            <!-- <div class="carousel-caption d-none d-md-block">
            </div> -->
          </div>
          <div class="carousel-item">
            <!-- <img src="business-7284184_1280.png" class="d-block w-100" alt="..."> -->
            <div class=" text-center mt-5 d-block w-100 ">
                <h1>Effortless Billing, Seamless Management</h1>
        		<p>The Smarter Way to Manage Your Business.</p>
              <br>
              <br>
            </div>
            <!-- <div class="carousel-caption d-none d-md-block">
            </div> -->
          </div>
          <div class="carousel-item">
            <!-- <img src="tab.png" class="d-block w-100" alt="..."> -->
            <div class="text-center mt-5 d-block w-100 ">
                <h1>Welcome to Jewellery Shop</h1>
        		<p>Shaping the Future of Jewellery Shop Management
</p>
              <br>
             
            </div>
            <!-- <div class="carousel-caption d-none d-md-block">
            </div> -->
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      
      
        
        <div class="mt-4">
            <a href="#login" class="btn btn-custom btn-lg me-3" data-bs-toggle="modal">Login</a>
            <a href="#signup" class="btn btn-custom btn-lg" data-bs-toggle="modal">Sign Up</a>
        </div>
    </div>
    

    <!-- Login Modal -->
    <div class="modal fade" id="login" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Admin Login</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="login" method="post">
                        <div class="mb-3">
                            <label for="login-username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="login-username" name="Uname" placeholder="Enter your UserName" required>
                        </div>
                        <div class="mb-3">
                            <label for="login-password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="login-password" name="Upass" placeholder="Enter your Password" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Signup Modal -->
    <div class="modal fade" id="signup" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Admin Sign Up</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="Register" method="post">
                        <div class="mb-3">
                            <label for="signup-username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="signup-username" name="Uname" placeholder="Enter Username" required>
                        </div>
                        <div class="mb-3">
                            <label for="signup-email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="signup-email" name="Uemail" placeholder="Enter Email" required>
                        </div>
                        <div class="mb-3">
                            <label for="signup-password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="signup-password" name="Upass" placeholder="Enter Password" required>
                        </div>
                        
                        <button type="submit" class="btn btn-success w-100">Sign Up</button>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="bootstrap.bundle.min.js"></script>
</body>
</html>
