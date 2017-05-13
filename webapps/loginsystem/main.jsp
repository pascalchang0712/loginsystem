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
      <div class="bgimg w3-display-container w3-animate-opacity w3-text-white" >
        <div class="w3-display-topleft w3-padding-large w3-xlarge w3-text-white">
          <a href="index.jsp" style="text-decoration:none;padding-right:20px;">Home</a>
          <a href="main.jsp" style="text-decoration:none;padding-right:20px;">Sign in</a>
          <a href="regpage.jsp" style="text-decoration:none;padding-right:20px;">Join us</a>
        </div>

        <div class="w3-display-topright" style="text-align:center;margin-right:10%;margin-top:100px;">

          <h1 class="w3-jumbo w3-animate-top" style="margin-bottom:40px">Sign in</h1>
          <form  action='login.jsp' name= "form" method="post" style="text-align:left">
          USERNAME<input type="text" size="20" name="userid" float="left" style="margin-bottom:15px;margin-left:7px;background-color:#ffffff;opacity: .4;border:0;" ><br>
          PASSWORD<input type="password" size="20" name="userpass" style="margin-bottom:15px;margin-left:5px;background-color:#ffffff;opacity: .4;border:0;"><br>
          <input class="w3-display-bottomright" type ="submit" value="Sign in" style="border:0;background-color:transparent;color:white;"><br>
          <input type="hidden" value="main" name="class" ClientIdMode="static">
          </form>
        </div>
        <div class="w3-display-right" style="margin-right:13%;">
          <br><br><br><br><br>
          <a  href="regpage.jsp" class="whitectn">REGISTER |</a>
          <a  href="regpage.jsp" class="whitectn">FORGET PASSWORD</a>
        </div>



    </div>

  </body>
</html>
