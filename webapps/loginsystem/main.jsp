<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8" >
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <title>MyWeb</title>
  </head>
  <body>
      <div class="bgimg w3-display-container w3-animate-opacity w3-text-black" >
        <div class="w3-display-topleft w3-padding-large w3-xlarge w3-text-white">
          <a href="index.jsp" style="text-decoration:none;padding-right:20px;">Home</a>
          <a href="main.jsp" style="text-decoration:none;padding-right:20px;">Sign in</a>
          <a href="regpage.jsp" style="text-decoration:none;padding-right:20px;">Join us</a>
        </div>

        <div class="w3-display-middle" style="text-align:center;background-color:Gainsboro;">

          <h1 class="w3-jumbo w3-animate-top">Sign in</h1>
          <form  action='login.jsp' name= "form" method="post" style="text-align:left">
          Username<input type="text" size="20" name="userid" float="left"><br>
          Password <input type="password" size="20" name="userpass">
          <input type ="submit" value="Sign in">
          <input type="hidden" value="main" name="class" ClientIdMode="static">
          </form>
          <button ><a href="regpage.jsp" style="color:black;text-decoration: none">Register</a></button>
          <button>Forget Password?</button>

        </div>




    </div>

  </body>
</html>
