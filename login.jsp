<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="java.util.*" import="java.text.*"%>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="4104029001"/>
  <jsp:setProperty property="user" name="database" value="4104029001"/>
  <jsp:setProperty property="password" name="database" value="Ss4104029001!"/>
</jsp:useBean>
<%-- <%!
String user = "4104029001";
String pass = "Ss4104029001!";
String database = "4104029001";
String driver ="com.mysql.jdbc.Driver";
String url = "jdbc:mysql://"+"140.120.49.205:3306/" + database + "?useUnicode=true&characterEncoding=big5";
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


%> --%>



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
        // try{
        //   Class.forName(driver).newInstance();
        //   conn = DriverManager.getConnection(url,user,pass);
        //   stmt = conn.createStatement();
        //   //新增一筆資料
        //     request.setCharacterEncoding("utf-8");
        //   }catch(SQLException sqle){
        //     out.println("SQL Exception : " + sqle);
        //   }


        database.connectDB();



      String type = request.getParameter("class");
      //out.print(type);
      switch(type){
        case "main":{

           String userid = request.getParameter("userid");
           String userpass = request.getParameter("userpass");


           database.query("select * from userdata where userid='"+userid+"';");
           ResultSet rs = database.getRS();
           if(rs.next()){
             database.query("select userid from userdata where userid ='"+ userid+"' and userpass='"+userpass+"'");
              rs = database.getRS();

              if(rs.next()){
                session.setAttribute("logstat","1") ;
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
            database.query("select * from userdata where userid='"+userid+"';");
            ResultSet rs = database.getRS();

            if(rs.next()) {
              %><script>alert("Account exists");</script><%
              response.setHeader("Refresh","0;url=regpage.jsp");
            }
            else{
              database.connectDB();
              database.insertData(userid,userpass,username,birthday,usermemo);

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
      ResultSet rs = null;
      switch(searchBy){
        case "userid":
        database.query("select userid from userdata");
         rs = database.getRS();
        break;

        case "name":
        database.query("select userid from userdata");
         rs = database.getRS();
        break;

        case "birthday":
        database.query("select userid from userdata");
         rs = database.getRS();
        break;

        case "all":
        database.query("select * from userdata");
         rs = database.getRS();
        break;
      }

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
