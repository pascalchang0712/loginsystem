<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" import="java.text.*"%>
<%!
// String user = "4104029001";
// String pass = "Ss4104029001!";
// String database = "4104029001";
// String driver ="com.mysql.jdbc.Driver";
// String url = "jdbc:mysql://"+"140.120.49.205:3306/" + database + "?useUnicode=true&characterEncoding=big5";
String user = "root";
String pass = "";
String database = "loginpg";
String driver ="com.mysql.jdbc.Driver";
String url = "jdbc:mysql://"+"127.0.0.1:3306/" + database + "?useUnicode=true&characterEncoding=big5";

ResultSet rs = null ;
Statement stmt = null;
 //建立一個聯結物件
Connection conn = null;
 //建立PreparedStatement物件
PreparedStatement pstmt = null;

%>

<!DOCTYPE html>
<html>
  <head>
    <title>MyWeb</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8" >
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="style.css">
  </head>
  <body id="body" >
    <div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
      <div class="w3-display-topleft w3-padding-large w3-xlarge">
        <a href="index.jsp" style="text-decoration:none;padding-right:20px;">Home</a>
        <a href="main.jsp" style="text-decoration:none;padding-right:20px;">Sign in</a>
        <a href="regpage.jsp" style="text-decoration:none;padding-right:20px;">Join us</a>
      </div>
  </div>
  </body>
</html>
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
               response.setHeader("Refresh","0;url=welcome.jsp");
             }else{
               %><script>alert("Incorrect Password");</script><%
               response.setHeader("Refresh","0;url=main.jsp");
             }
          }else{
            %><script>alert("Invalid accountname skip to register page");</script><%
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
          %><script>alert("All spaces must be filled");</script><%
          response.setHeader("Refresh","0;url=regpage.jsp");
        }
        else{
          if(!reuserpass.equals(userpass)){
            %><script>alert("Passwords must match");</script><%
            response.setHeader("Refresh","0;url=regpage.jsp");
          }else{
            String sql = "select userid from userdata where userid='" + userid +"'" ;
            rs = stmt.executeQuery(sql);

            if(rs.next()) {
              %><script>alert("Account exists");</script><%
              response.setHeader("Refresh","0;url=regpage.jsp");
            }
            else{
              sql = "insert into userdata(userid,userpass,name,birthday,memo) values('"+userid+"','"+userpass+"','"+username+"','"+birthday+"','"+usermemo+"');";
              stmt.executeUpdate(sql);

              %><script>alert("Welcome <%=username%>");</script><%
              response.setHeader("Refresh","0;url=main.jsp");
            }
          }
        }
        break;
      }
      case "query" :{
      String searchBy = request.getParameter("searchBy");
      String datatype = request.getParameter("datatype");
      String sql ="select * from userdata where userid='" + datatype +"'" ;
      switch(searchBy){
        case "userid":
          sql ="select * from userdata where userid='" + datatype +"'" ;
        break;

        case "name":
          sql ="select * from userdata where name='" + datatype +"'" ;
        break;

        case "birthday":
          sql ="select * from userdata where birthday='" + datatype +"'" ;
        break;

        case "all":
          sql ="select * from userdata " ;
        break;
      }
      //String sql ="select * from userdata";
      rs = stmt.executeQuery(sql);
      if(rs.next()){
        rs.beforeFirst();
        %>
        <div class="w3-display-middle" style="text-align:center;background-color:Gainsboro">
        <h1>Results</h1>
        <table border="1">
          <tr>
            <td>會員帳號</td>
            <td>會員密碼</td>
            <td>會員名稱</td>
            <td>生日</td>
            <td>註記</td>
          </tr>
          <%while(rs.next()){%>
            <tr>
              <td><%=rs.getString(2)%></td>
              <td><%=rs.getString(3)%></td>
              <td><%=rs.getString(4)%></td>
              <td><%=rs.getString(5)%></td>
              <td><%=rs.getString(6)%></td>
            </tr>
          <%}%>


            </table>
          </div>
            <br>

            <script>
            document.getElementById("banner").innerHTML = "查詢結果";
            </script>


          <%
      }else{
        out.println("查無資料");
        %>
        <br><br><br>
        <script>
        document.getElementById("banner").innerHTML = "查詢結果";
        </script>
        <%
      }
      break;


    }
 }


 %>
