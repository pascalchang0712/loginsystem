<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="mystyle.css">
    <title>  welcome   </title>
  </head>
  <body class="blue">
    <h1 class="navbar">登入</h1>

    <div  >
      <form  action='login.jsp' name= "form" method="post">
      帳號<input type="text" size="20" name="userid"><br>
      密碼<input type="password" size="20" name="userpass">
      <input type ="submit" value="登入">
      <input type="hidden" value="main" name="class" ClientIdMode="static">
      </form>
    </div>


    <button><a href="regpage.jsp" style="color:black;text-decoration: none">註冊</a></button>
    <button>忘記密碼?</button>
  </body>
</html>
