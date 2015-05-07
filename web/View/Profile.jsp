<%-- 
    Document   : Profile
    Created on : Dec 21, 2014, 2:31:42 PM
    Author     : Abanoub
--%>
<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = "jdbc:mysql://localhost:3306/movie";
    String user = "root";
    String password = "1111";
    String Line;
    Connection Con = null;
    Statement Stmt = null;
    ResultSet RS = null;
    String email = request.getSession().getAttribute("Account").toString();
    User us = new User();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Con = DriverManager.getConnection(url, user, password);
        Stmt = Con.createStatement();
        RS = Stmt.executeQuery("SELECT * FROM user where Email = '" + email + "';");
    } catch (Exception cnfe) {
        System.err.println("Exception: " + cnfe);
    }

    if (RS != null) {
        while (RS.next()) {
            us.setName(RS.getString("Name"));
            us.setPassword(RS.getString("Password"));
            us.setEmail(RS.getString("Email"));
            us.setGender(RS.getString("gender"));
            us.setAge(RS.getString("age"));
        }
    } else {
        out.print("No items Available");
    }
%>
<%
    RS.close();
    Stmt.close();
    Con.close();%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Edit User </title>
    </head>
    <body background="IMG\bg.jpg">
        <h1 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Welcome To Movie Rent </h1>
        <h2 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Everything in One Place :) </h2>
    <center><a href="UserHome.jsp" > <img src="IMG\Logo.png" alt="NewsSection" wedth="150" height="150" align="center"/> </a></center>
    <center>
        <p>

        <form action="edituser">
            <p style="text-align: left; color:black;font-family:MV Boli;font-size:25px;">  
            <table border="0">
                <tr>
                    <td>Email : </td>
                    <td><%= us.getEmail()%></td>
                <input type="hidden" name="email" value="<%=us.getEmail()%>"/></td>
                </tr>

                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" value="<%= us.getName()%>"/></td>
                </tr>

                <tr> 
                    <td> 
                        Password:
                    </td> 
                    <td> 
                        <input type="text" name="password" value="<%= us.getPassword()%>"/> 
                    </td> 
                </tr> 

                <tr>
                    <% if (us.getGender().equals("male")) {%>
                    <td>
                        <input type="radio" name="gender" value="male" checked>Male</br>
                    </td>
                    <td> 
                        <input type="radio" name="gender" value="female">Female</br>
                    </td>
                    <% } else {%>
                    <td>
                        <input type="radio" name="gender" value="male" >Male</br>
                    </td>
                    <td> 
                        <input type="radio" name="gender" value="female" checked>Female</br>
                    </td>
                <%}%>
                </td>
                </tr>

                <tr>
                    <td> Age: </td>
                    <td> <select name="age">
                            <% if (us.getAge().equals("6-12")) {%>
                            <option value="6-12" selected>6-12</option>
                            <% } else {%>
                            <option value="6-12">6-12</option>
                            <%}%>

                            <% if (us.getAge().equals("12-18")) {%>
                            <option value="12-18" selected>12-18</option>
                            <% } else {%>
                            <option value="12-18">12-18</option>
                            <%}%>

                            <% if (us.getAge().equals("18-25")) {%>
                            <option value="18-25" selected>18-25</option>
                            <% } else {%>
                            <option value="18-25">18-25</option>
                            <%}%>

                            <% if (us.getAge().equals("25+")) {%>
                            <option value="25+" selected>25+</option>
                            <% } else {%>
                            <option value="25+">25+</option>
                            <%}%>
                        </select>
                    </td>                 
                </tr>
                </p>
            </table>
            <input type="submit" name="submit"/>
            <button value="Cancel" formaction="UserHome.jsp">Cancel</button>
        </form>
    </p>
</center>
</body>
</html>
