<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
  <head>
    <meta charset="utf-8">
    <title>  welcome   </title>
  </head>
  <body>
    <h1>登入</h1>
    <form action='login.jsp' name= "form" method="post">
    帳號<input type="text" size="20" name="userid"><br>
    密碼<input type="password" size="20" name="userpass">
    <input type ="submit" value="登入">
    <input type="hidden" value="main" name="class" ClientIdMode="static">
    </form>

    <button><a href="regpage.jsp" style="color:black;text-decoration: none">註冊</a></button>
    <button>忘記密碼?</button>
  </body>
</html>
