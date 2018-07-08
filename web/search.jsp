<%-- 
    Document   : index
    Created on : Jul 13, 2015, 6:28:36 PM
    Author     : java2
--%>

<%@page import="com.multi.kk.action.TrippleDes"%>
<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
            <div id="container">
                <div class="fdownload" style="border: 1px solid red;border-top-left-radius: 20px;border-bottom-right-radius: 20px;width: 500px;height: 300px;margin-left: 150px;margin-top: 60px">
               <center><h2>Search Results</h2></center>
                        <%
                            Connection con = null;
                            Statement st = null;
                            ResultSet rs = null;
                            ResultSet rs1 = null;
                            String f = null;
                            String k = null;
                            String owner = null;
                            String uname = session.getAttribute("email").toString();
                            String fname = request.getParameter("fname");
                            String firstEncrypt = new TrippleDes().encrypt(fname);
                            String secondEncrypt = new TrippleDes().encrypt(firstEncrypt);
                            try {
                                con = Dbconnection.getConnection();
                                st = con.createStatement();
                                rs1 = st.executeQuery("select * from reg where Email='" + uname + "'  AND role='User'");
                                if (rs1.next()) {
                                    rs = st.executeQuery("select * from files where keyword='" + secondEncrypt + "'  order by frank desc");
                                    while (rs.next()) {
                                        f = rs.getString("filename");
                                        k = rs.getString("keyword");
                                        owner = rs.getString("owner");
                        %>  
                    <center><a href="ranking.jsp?<%=uname%>,<%=f%>,<%=k%>,<%=owner%>" style="font-size: 20px;color: red;text-decoration: none"><%=f%></a></center><br />
                        <% }
                            } else {
                                response.sendRedirect("user.jsp?msgg=failed");
                            }%>
                        <%if (!(secondEncrypt.equalsIgnoreCase(k))) {%>
                    <label style="margin-left: 10px;font-size: 18px;color: red">Your search - <label style="color: blue"><%=fname%></label>- did not match any documents.</label><br /><br /><br />
                    <label style="margin-left: -100px;font-size: 18px;color: #0000cc">Suggestions:</label><br />
                    <ul style="margin-left: 10px;font-size: 18px;color: #0000cc"><br />
                        <li>Make sure that all words are spelled correctly.</li>
                        <li>Try different keywords.</li>
                        <li>Try more general keywords.</li>
                    </ul>
                    <% }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </div>
            </div>
            
        </div>
    </body>
</html>
