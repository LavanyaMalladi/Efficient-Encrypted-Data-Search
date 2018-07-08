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
            Connection con = null;
            Statement st = null;
            if (request.getParameter("msg") != null) {%>
        <script>alert('Login Successfully');</script>
        <%}
            if (request.getParameter("amsg") != null) {%>
        <script>alert('Activated Successfully');</script>
        <%}
            if (request.getParameter("dmsg") != null) {%>
        <script>alert('Deactivated Successfully');</script>   
        <%}
            if (request.getParameter("emsg") != null) {%>
            <script>alert('Re-encrypted Successfully');</script>
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
                
                     <center><h1>File Details</h1></center>
                    <center> <table border="1" style="text-align: center;margin-left: 10px;">
                        <tr>
                            <th>File Name</th>
                            <th>Keyword</th>
                            <th>Owner</th>
                            <th>Upload Date</th>
                            <th>Action</th>
                        </tr>
                        <tr>
                            <%
                                String status = "reencrypt";
                                String status1 = "cloud";
                                try {
                                    con = Dbconnection.getConnection();
                                    st = con.createStatement();
                                    ResultSet rs1 = st.executeQuery("select * from files where serstatus='No'");
                                    while (rs1.next()) {
                                        String filename = new TrippleDes().encrypt(rs1.getString("filename"));
                            %>
                            <td><%=filename%></td> 
                            <td><%=rs1.getString("keyword")%></td>
                            <td><%=rs1.getString("owner")%></td>
                            <td><%=rs1.getString("CDate")%></td>
                            <td><a href="encryptaction.jsp?<%=rs1.getString("filename")%>,<%=rs1.getString("keyword")%>,<%=rs1.getString("owner")%>,<%=status%>" style="text-decoration: none">Re-encrypt and Send_to_Cloud</a></td>
                            </tr>
                            <%}
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                    </table>
                    </center>
                </div>
            </div>
                    <br>        
      <div class="sidebar" style="width: 200px;height: 300px;margin-left: 20px;margin-top: 60px">
        <div class="gadget">
          <h2 class="star"><span>Admin Menu</span></h2>
          <div class="clr"></div>
          <ul class="sb_menu">
              <li><a href="ahome.jsp" >Home </a></li>
            <li><a href="activate.jsp" >Activation </a></li>
            <li><a href="filedetails1.jsp">File Details</a></li>
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