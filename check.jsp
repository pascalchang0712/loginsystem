<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" import="java.text.*"%>
<%!
String user = "4104029001";
String pass = "Ss4104029001!";
String database = "4104029001";
String driver ="com.mysql.jdbc.Driver";
String url = "jdbc:mysql://"+"140.120.49.205:3306/" + database + "?useUnicode=true&characterEncoding=big5";
// String user = "root";
// String pass = "";
// String database = "loginpg";
// String driver ="com.mysql.jdbc.Driver";
// String url = "jdbc:mysql://"+"127.0.0.1:3306/" + database + "?useUnicode=true&characterEncoding=big5";

ResultSet rs = null ;
Statement stmt = null;
 //建立一個聯結物件
Connection conn = null;
 //建立PreparedStatement物件
PreparedStatement pstmt = null;
%>
<%
String account = request.getParameter("acc");
try{
  Class.forName(driver).newInstance();
  conn = DriverManager.getConnection(url,user,pass);
  stmt = conn.createStatement();
  //新增一筆資料
    request.setCharacterEncoding("utf-8");
  }catch(SQLException sqle){
    out.println("SQL Exception : " + sqle);
  }
String sql = "select * from userdata where userid='" + account +"'" ;
rs = stmt.executeQuery(sql);

if(rs.next()){
  out.print("exist");
}else{
  out.print("good to go!");
}



%>
