<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8" >
    <title>MyWeb</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script language="JavaScript">
            $(document).ready(function() {
              $('#fuserid').blur(function() {
              if($(this).val().length != 0) {
                $.post('check.jsp',{acc:$(this).val()},
                function(response){
                  $('#fuserid').addClass('error')
                  .after('<span class="error">'+response+'!</span>');
                })
              }
              });
              $(':input').blur(function() {
              if($(this).val().length == 0) {
              $(this).addClass('error')
              .after('<span class="error">不可是空的!</span>');
              }
              });
              $(':input').focus(function() {
              $(this).removeClass('error')
              .next('span').remove();
              });
              });

      </script>

  <body>
    <div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
      <div class="w3-display-topleft w3-padding-large w3-xlarge w3-text-white">
        <a href="index.jsp" style="text-decoration:none;padding-right:20px;">Home</a>
        <a href="main.jsp" style="text-decoration:none;padding-right:20px;">Sign in</a>
        <a href="regpage.jsp" style="text-decoration:none;padding-right:20px;">Join us</a>
      </div>
      <div class="w3-display-topright" style="text-align:center;background-color:trasparent;margin-right:5% ;">
        <h1 class="w3-jumbo w3-animate-top">Create account</h1>
        <div id="result" class="box"></div><br/>

        <form action='login.jsp' name= "form" method="post" style="text-align:left">
        USERNAME<br><input type="text" size="20" id="fuserid" name="userid"  style="background-color:#ffffff;opacity: .4;"><p><span></span></p><br>
        PASSWORD<br><input type="password" size="20" id ="fuserps" name="userpass" style="background-color:#ffffff;opacity: .4;"><br>
        RE-ENTER PASSWORD<br><input type="password" size="20" name="reuserpass" style="background-color:#ffffff;opacity: .4;"><br>
        FULL NAME<br><input type="text" size="20" name="username" style="background-color:#ffffff;opacity: .4;"><br>
        BIRTHDAY<br><input type="date" name="userbirthday" style="background-color:#ffffff;opacity: .6;"><br>
        NOTE<br><input type="text" size="20" name="memo" style="background-color:#ffffff;opacity: .4;"><br><br><br>
        <input type="submit" value="SUBMIT" style="background-color:transparent;color:white;border:0;" >
        <%-- <input type="reset" value="reset"> --%>
        <input type="hidden" value="regpage" id ="fclass" name="class" ClientIdMode="static" >

        </form>
      </div>
    </div>

  </body>
</html>
