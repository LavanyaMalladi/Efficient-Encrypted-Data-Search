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
        <script>alert('Login Successfully');</script>
        <%}
            if (request.getParameter("msgg") != null) {%>
        <script>alert('Please Enter Correct Secret Key');</script>
        <%}
            if (request.getParameter("rmsg") != null) {%>
        <script>alert('File Request Sended to Data Owner');</script>
        <%}
            if (request.getParameter("dmsg") != null) {%>
        <script>alert('Please Enter Correct Decryption Key');</script>
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
              <%
                        String name=null,email=null,dob=null,gender=null,loc=null;
                        String uname = session.getAttribute("email").toString();
                        Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                        try {
                            con = Dbconnection.getConnection();
                            st = con.createStatement();
                            rs = st.executeQuery("select *from reg where Email='"+uname+"' AND role='User' ");
                            if(rs.next())
                            {
                                name = rs.getString("Name");
                                email = rs.getString("Email");
                                dob = rs.getString("DOB");
                                gender = rs.getString("Gender");
                                loc = rs.getString("Loc");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
                    <div style="float: left">
                        <div style=" float: left;margin-left: 50px;margin-top: 10px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">Name</label></center></div><br /><br /><br />
                        <div style=" float: left;margin-left: 50px;margin-top: 18px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">Email</label></center></div><br /><br /><br />
                        <div style=" float: left;margin-left: 50px;margin-top: 22px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">DOB</label></center></div><br /><br /><br />
                        <div style="float: next;margin-left: 50px;margin-top: 35px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">Gender</label></center></div>
                        <div style="float: next;margin-left: 50px;margin-top: 24px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">Location</label></center></div><br />
                    </div>
                    <!--                    /*Start*/-->
                    <div>
                        <center><div><input type="text" value="<%=name%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: 10px;border-radius: 10px"/></div><br /><br />
                            <div><input type="text" value="<%=email%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: -20px;border-radius: 10px"/></div><br />
                            <div><input type="text" value="<%=dob%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: 5px;border-radius: 10px"/></div><br /><br />
                            <div><input type="text" value="<%=gender%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: -10px;border-radius: 10px"/></div><br /><br />
                            <div><input type="text" value="<%=loc%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: -20px;border-radius: 10px"/></div></center><br />
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


      
            