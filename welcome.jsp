<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" import="java.text.*"%>
<%
String logstat = (String) session.getAttribute("logstat") ;
out.println(logstat);
if(logstat==null){
  response.setHeader("Refresh","0;url=main.jsp");
}
%>
<html>
  <head>
    <meta charset="utf-8">
    <title>  welcome   </title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

  </head>
  <body>
    <div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
      <div class="w3-display-middle">
        <h1 class="w3-jumbo w3-animate-top" style="text-align:center; ">Welcome</h1>

        <form  action='login.jsp' name= "form" method="post">
          資料查詢
          <select name="searchBy">
          <option value="userid">帳號</option>
          <option value="name">名稱</option>
          <option value="birthday">生日</option>
          <option value="all">全部顯示</option>
          </select>
          <input type="text" size="20" name="datatype" placeholder="請輸入欲查詢資料">
          <input type ="submit" value="查詢">
          <input type="hidden" value="query" name="class" ClientIdMode="static">


        </form>


      </div>
    </div>
  </body>
</html>
