<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
  <head>
    <meta charset="utf-8">
    <title>  welcome   </title>
  </head>
  <body>
    <h1>註冊一個新帳號</h1>
    <form action='login.jsp' name= "form" method="post">
    帳號<input type="text" size="20" name="userid"><br>
    密碼<input type="password" size="20" name="userpass"><br>
    請重新輸入密碼<input type="password" size="20" name="reuserpass"><br>
    姓名<input type="text" size="20" name="username"><br>
    生日<input type="date" name="userbirthday"><br>
    備註<input type="text" size="20" name="memo"><br>
    <input type="submit" value="送出" >
    <input type="reset" value="重設">

    <input type="hidden" value="regpage" name="class" ClientIdMode="static">

    </form>

  </body>
</html>
