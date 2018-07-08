<%-- 
    Document   : index
    Created on : Jul 13, 2015, 6:28:36 PM
    Author     : java2
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        <script>alert('Password Changed Successfully');</script>  
        <%}
            if (request.getParameter("msgg") != null) {%>
        <script>alert('Please Enter Correct Old Password');</script>  
        <%}
        %>
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
          <h2>Welcome To User  </h2>
          
            <div class="clr"></div>
		      <div class="img"><img src="images/img1.jpg" width="630" height="140" alt="" class="fl" /></div>
		      <div class="post_content">
                <p>&nbsp;</p>
                
        </div>
      </div>
          <div class="content">
    <div class="content_resize">
      <div class="mainbar"> 
                <div style="border: 1px solid red;border-top-left-radius: 2px;border-bottom-right-radius: 1px; width: 650px;height: 500px;margin-left: 1px;margin-top: 5px">
                    <center><h1 style="display: block;">Password Request</h1></center><hr>
                    <div style="float: right">
                        <center> 
                            <h2>Password Change</h2>
                            <br>
                            <form name="f2" action="paction.jsp" method="post" style="margin-right:  50px">
                                <label style="font-size: 23px">Enter Old Password</label><input class="textbox" type="password" placeholder="Enter Old Password" name="opass" style="margin-left: 58px;width: 250px" required=""/><br /><br />
                                <label style="font-size: 23px">Enter New Password</label><input class="textbox" type="password" placeholder="Enter New Password" name="npass" style="margin-left: 45px;width: 250px" required=""/><br /><br />
                                <input type="hidden" value="user" name="paction"/>
                                <input type="submit" value="Submit" class="button" style="margin-left: 110px;margin-top: -10px;width: 100px;" />
                                <input type="reset" value="Reset" class="button" style="margin-left: 35px;margin-top: -10px;width: 100px;"/>
                            </form> 
                        </center>
                    </div>
                    <div style="float: left">
                        <center> 
                            <h2>Password Request</h2><br>
                            <form name="f2" action="urequest.jsp" method="post" style="margin-right:  50px">
                                <label style="font-size: 23px">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enter Your EMail</label><input class="textbox" type="text" placeholder="Enter Your Email" name="rkey" style="margin-left: 58px;width: 250px" required=""/><br /><br />
                                <input type="submit" value="Submit" class="button" style="margin-left: 110px;margin-top: -10px;width: 100px;" />
                                <input type="reset" value="Reset" class="button" style="margin-left: 35px;margin-top: -10px;width: 100px;"/>
                            </form> <br />
                            <%
                                String rkey = request.getParameter("rkey");
                                System.out.println("The Request Key is " + rkey);
                                Connection con1 = null;
                                Statement st1 = null;
                                ResultSet rs1 = null;
                                try {
                                    con1 = Dbconnection.getConnection();
                                    st1 = con1.createStatement();
                                    rs1 = st1.executeQuery("select * from reg where email='" + rkey + "' AND role='User'");
                                    if (rs1.next()) {%>
                            <label style="color: red;margin-left: -20px;font-size: 20px">Password   &nbsp; : </label><%=rs1.getString("Pass")%><br />
                            <%} 
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>
                        </center>
                    </div>
                </div>
                </div>
              
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>User  Menu</span></h2>
          <div class="clr"></div>
          <ul class="sb_menu">
              <li><a href="user.jsp" >Home </a></li>
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

