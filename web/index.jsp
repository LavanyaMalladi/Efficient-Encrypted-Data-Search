<%-- 
    Document   : index
    Created on : Jul 13, 2015, 6:28:36 PM
    Author     : java2
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page import="com.multi.kk.action.TrippleDes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ENDAS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <script src="js/jquery.min.js" type="text/javascript"></script>
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
        <script>alert('Registration Successfully \n Email Id as Your Username');</script>
        <%}
            if (request.getParameter("msgg") != null) {%>
        <script>alert(' Failed ');</script> 
        <%}
            if (request.getParameter("omsg") != null) {%>
        <script>alert('Please Enter Correct Username and Password');</script>
        <%}
                if (request.getParameter("umsg") != null) {%>
        <script>alert('Please Enter Correct Username and Password');</script>
        <%}
        if(request.getParameter("amsg")!=null)
        {%>
             <script>alert("You're not Activated");</script>
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
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="320" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="960" height="320" alt="" /></a></div>
        <div class="clr"></div>
      </div>
      <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
            
                <h2>HOME PAGE </h2>
          <div class="clr"></div>
          <div class="img"><img src="images/img1.jpg" width="630" height="140" alt="" class="fl" /></div>
          <div class="post_content">
              <h3> <font size="5"> Abstract</font></h3>
            <p style="text-align: justify"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;With the advent of cloud computing, it has become increasingly popular for data owners to outsource their data to
public cloud servers while allowing data users to retrieve this data. For privacy concerns, secure searches over encrypted cloud
data has motivated several research works under the single owner model. However, most cloud servers in practice do not just
serve one owner; instead, they support multiple owners to share the benefits brought by cloud computing. In this paper, we
propose schemes to deal with Privacy preserving Ranked Multi-keyword Search in a Multi-owner model (PRMSM). To enable
cloud servers to perform secure search without knowing the actual data of both keywords and trapdoors, we systematically
construct a novel secure search protocol. To rank the search results and preserve the privacy of relevance scores between
keywords and files, we propose a novel Additive Order and Privacy Preserving Function family. To prevent the attackers from
eavesdropping secret keys and pretending to be legal data users submitting searches, we propose a novel dynamic secret key
generation protocol and a new data user authentication protocol. Furthermore, PRMSM supports efficient data user revocation.
Extensive experiments on real-world datasets confirm the efficacy and efficiency of PRMSM.</p>
            <p class="spec">&nbsp;</p>
          </div>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>User Menu</span></h2>
          <div class="clr"></div>
          <ul class="sb_menu">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="ownerlogin.html">Data Owner</a></li>
			<li><a href="userlogin.html">User Login</a></li>
			<li><a href="adminlogin.html">Admin</a></li>
			<li><a href="cloudserver.html">Cloud Server</a></li>
			<li><a href="registration.html">Registration</a></li>
			</ul>
        </div>
      </div>
        
      </div>
      <div class="clr"></div>
    </div>
  </div>
  
  <div class="footer style2">
    <div class="footer_resize">
     
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style2"></div>
</body>
</html>
