<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" import="java.text.*"%>
<%!
String user = "4104029001";
String pass = "Ss4104029001!";
String database = "4104029001";
String driver ="com.mysql.jdbc.Driver";
String url = "jdbc:mysql://"+"140.120.49.205:3306/" + database + "?useUnicode=true&characterEncoding=big5";

ResultSet rs = null ;
Statement stmt = null;
 //建立一個聯結物件
Connection conn = null;
 //建立PreparedStatement物件
PreparedStatement pstmt = null;

%>
<%
        try{
          Class.forName(driver).newInstance();
          conn = DriverManager.getConnection(url,user,pass);
          stmt = conn.createStatement();
          //新增一筆資料
            request.setCharacterEncoding("utf-8");
          }catch(SQLException sqle){
            out.println("SQL Exception : " + sqle);
          }


      String type = request.getParameter("class");
      //out.print(type);
      switch(type){
        case "main":{

           String userid = request.getParameter("userid");
           String userpass = request.getParameter("userpass");
          //  out.println(userid+userpass);

          String sql ="select userid from userdata where userid='" + userid +"'" ;
          rs = stmt.executeQuery(sql);

          if(rs.next()){
            sql = "select userid from userdata where userid ='"+ userid+"' and userpass='"+userpass+"'";
            rs = stmt.executeQuery(sql);
           //out.println(rs);

             if(rs.next()){
               out.println("登入成功");
               response.setHeader("Refresh","0;url=welcome.jsp");
             }else{
               %><script>alert("密碼錯誤");</script><%
               response.setHeader("Refresh","0;url=main.jsp");
             }
          }else{
            %><script>alert("無此帳號 跳轉注冊頁面");</script><%
            response.setHeader("Refresh","0;url=regpage.jsp");
          }
        break;
}
      case "regpage":{
        String username = request.getParameter("username");
        String userid = request.getParameter("userid");
        String userpass = request.getParameter("userpass");
        String reuserpass = request.getParameter("reuserpass");
        String usermemo =request.getParameter("memo");
        String birthday = request.getParameter("userbirthday");

        if(username==""||userpass==""||userid==""||birthday==""){
          %><script>alert("欄位不可留空");</script><%
          response.setHeader("Refresh","0;url=regpage.jsp");
        }
        else{
          if(!reuserpass.equals(userpass)){
            %><script>alert("兩次密碼不相同");</script><%
            response.setHeader("Refresh","0;url=regpage.jsp");
          }else{
            String sql = "select userid from userdata where userid='" + userid +"'" ;
            rs = stmt.executeQuery(sql);

            if(rs.next()) {
              %><script>alert("已存在的帳號");</script><%
              response.setHeader("Refresh","0;url=regpage.jsp");
            }
            else{
              sql = "insert into userdata(userid,userpass,name,birthday,memo) values('"+userid+"','"+userpass+"','"+username+"','"+birthday+"','"+usermemo+"');";
              stmt.executeUpdate(sql);

              %><script>alert("註冊成功");</script><%
              response.setHeader("Refresh","0;url=main.jsp");
            }
          }
        }
        break;
      }
 }


 %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>

  </body>
</html>
