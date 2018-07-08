<%-- 
    Document   : caction
    Created on : Jul 13, 2015, 6:27:21 PM
    Author     : java2
--%>
<%@page import="com.multi.kk.action.Mail"%>
<%@page import="java.util.UUID"%>
<%@page import="com.multi.kk.action.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String name = "Cloud";
    String user = request.getParameter("user");
    String pass = request.getParameter("pass");
    String skey = request.getParameter("skey");
    String cname = request.getParameter("saction");
    System.out.println("The Checking Value is " + cname);
    String status="No";
    String status1="Yes";
    switch (cname) {
        case "owner":
            try {
                con = Dbconnection.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from reg where Email='" + user + "' AND Pass='" + pass + "' AND  role='Owner'");
                if (rs.next()) {
                    if((rs.getString("astatus").equals(status)))
                    {
                        response.sendRedirect("index.jsp?amsg=success");
                    }
                    else if (user.equals(rs.getString("Email")) && pass.equals(rs.getString("Pass"))&&status1.equals(rs.getString("astatus"))) {
                        String a = rs.getString("Email");
                        System.out.println("The Value is " + a);
                        response.sendRedirect("owner.jsp?msg=success");
                        session.setAttribute("email", rs.getString("Email"));
                        session.setAttribute("name", rs.getString("Name"));
                    }
                } else {
                    response.sendRedirect("index.jsp?omsg=success");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            break;
        case "user":
            try {
                con = Dbconnection.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from reg where Email='" + user + "' AND Pass='" + pass + "' AND  role='User'");
                if (rs.next()) {
                    if((rs.getString("astatus").equals(status)))
                    {
                        response.sendRedirect("index.jsp?amsg=success");
                    }
                    else if (user.equals(rs.getString("Email")) && pass.equals(rs.getString("Pass"))&&status1.equals(rs.getString("astatus"))) {
                        String a = rs.getString("Email");
                        System.out.println("The Value is " + a);
                        response.sendRedirect("user.jsp?msg=success");
                        session.setAttribute("email", rs.getString("Email"));
                        session.setAttribute("uname", rs.getString("Name"));
                    }
                } else {
                    response.sendRedirect("index.jsp?umsg=success");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            break;
        case "cloud":
            try {
                if (user.equalsIgnoreCase(name) && pass.equalsIgnoreCase(name)) {
                    response.sendRedirect("chome.jsp?msg=success");
                } else {
                    response.sendRedirect("index.jsp?msgg=failed");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            break;
        case "admin":
            try {
                if (user.equalsIgnoreCase("Admin") && pass.equalsIgnoreCase("Admin")) {
                    response.sendRedirect("ahome.jsp?msg=success");
                } else {
                    response.sendRedirect("index.jsp?msgg=failed");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            break;
        case "reg":
            name = request.getParameter("name");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String gen = request.getParameter("gen");
            String role = request.getParameter("role");
            String loc = request.getParameter("loc");
            String k = UUID.randomUUID().toString().substring(0, 6);
            String msg = "Name : " + name + "\n\nPassword   : " + k + "\n\nRole   : " + role;
            try {
                con = Dbconnection.getConnection();
                st = con.createStatement();
                int i = st.executeUpdate("insert into reg (Name, Pass, Email, DOB, Gender, role, Loc, astatus) values ('" + name + "','" + k + "','" + email + "','" + dob + "','" + gen + "','" + role + "','" + loc + "','No')");
                if (i != 0) {
                    Mail m = new Mail();
                    m.secretMail(msg, name, email);
                    response.sendRedirect("index.jsp?msg=success");
                } else {
                    response.sendRedirect("index.jsp?msgg=failed");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            break;
        default:
            response.sendRedirect("index.jsp");
    }
%>
