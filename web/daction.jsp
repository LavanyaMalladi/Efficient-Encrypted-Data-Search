<%-- 
    Document   : index
    Created on : Jul 13, 2015, 6:28:36 PM
    Author     : java2
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ENDAS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-yanone.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
    <!--
.style1 {font-size: 14px}
.style2 {font-size: 24}
.style3 {font-size: 26px; }
.style4 {
	font-size: 24;
	font-weight: bold;
	color: #666666;
}
-->
</style>

       
    </head>
    <body>
         <%
            if (request.getParameter("msg") != null) {%>
        <script>alert('Please Enter Correct Decryption Key');</script>
        <%}%>
        <div class="main">
  <div class="header">
    <div class="header_resize">
      
      <div class="menu_nav">
        <ul>
          <li class="active"></li>
          <li class="style1">
           <div align="left"><a href="index.jsp"><span>Home</span></a></div>
		  <li><a href="ownerlogin.html"><span>Data Owner</span></a></li>
		  <li><a href="userlogin.html"><span>User Login</span></a></li>
		  <li><a href="adminlogin.html"><span>Admin</span></a></li>
                  <li><a href="cloudserver.html"><span>Cloud Server</span></a></li>
                  <li><a href="registration.html"><span>Registration</span></a></li>
                  
          </li>
        </ul>
      </div>
        
      <div class="clr"></div>
      <div class="logo">
       <h1><a href="index.jsp">ENDAS<span></span> <small>Efficient Encrypted Data Search as a Mobile Cloud Service</small></a></h1>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="320" alt="" /></a> </div>
        <div class="clr"></div>
      </div>
      
      <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
            
                <div class="search" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;background: white;width: 500px;height: 300px;margin-left: 150px;margin-top: 10px"><br /><br />
                    <%
                        String data1[] = request.getQueryString().split(",");
                        session.setAttribute("fname", data1[0]);
                        session.setAttribute("owner", data1[1]);
                    %>
                    <center> 
                        <h2>Key Verification System</h2>
                            <form action="verify.jsp" method="post">
                                <label>File Name  :</label><input type="text" name="fname" value="<%=data1[0]%>" readonly="" style="margin-left: 30px" class="textbox"/><br /><br />
                                <label>Decryption Key :</label><input type="text" name="dkey" required="" class="textbox"/><br /><br />
                                <input type="submit" value="Download" class="button" /><br /><br />
                            </form>
                    </center><br />
                </div>
                </div>
      </div>
                <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>User  Menu</span></h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="userdetails.jsp" >User Details </a></li>
            <li><a href="filesearch.jsp">File Search</a></li>
            <li><a href="filedownload.jsp">File Download</a></li>
            <li><a href="urequest.jsp">Password</a></li>
            <li><a href="index.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
            
        </div>
    </body>
</html>

