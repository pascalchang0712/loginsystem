<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8" >
    <title>MyWeb</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

  </head>
  <body>
    <div class="bgimg w3-display-container w3-animate-opacity w3-text-black">
      <div class="w3-display-topleft w3-padding-large w3-xlarge w3-text-white">
        <a href="index.jsp" style="text-decoration:none;padding-right:20px;">Home</a>
        <a href="main.jsp" style="text-decoration:none;padding-right:20px;">Sign in</a>
        <a href="regpage.jsp" style="text-decoration:none;padding-right:20px;">Join us</a>
      </div>
      <div class="w3-display-middle" style="text-align:center;background-color:Gainsboro;">
        <h1 class="w3-jumbo w3-animate-top">Create account</h1>
        <form action='login.jsp' name= "form" method="post" style="text-align:left">
        Username<br><input type="text" size="20" name="userid"><br>
        password<br><input type="password" size="20" name="userpass"><br>
        Re-enter password<br><input type="password" size="20" name="reuserpass"><br>
        Full name<br><input type="text" size="20" name="username"><br>
        Birthday<br><input type="date" name="userbirthday"><br>
        Note<br><input type="text" size="20" name="memo"><br>
        <input type="submit" value="submit" >
        <%-- <input type="reset" value="reset"> --%>
        <input type="hidden" value="regpage" name="class" ClientIdMode="static">

        </form>
      </div>
    </div>

  </body>
</html>
