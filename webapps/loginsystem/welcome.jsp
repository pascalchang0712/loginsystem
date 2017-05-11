<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" import="java.text.*"%>
<%


%>
<html>
  <head>
    <meta charset="utf-8">
    <title>  welcome   </title>
    <link rel="stylesheet" href="mystyle.css">

  </head>
  <body class="blue">
    <h1 class="navbar">歡迎</h1>
    <img src="lkE60.gif">
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
  </body>
</html>
