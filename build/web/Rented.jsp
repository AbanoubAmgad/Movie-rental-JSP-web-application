<%-- 
    Document   : Rented
    Created on : Dec 21, 2014, 1:05:17 PM
    Author     : Abanoub
--%>

﻿<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String url = "jdbc:mysql://localhost:3306/movie";
    String user = "root";
    String password = "1111";
    String Line;
    Connection Con = null;
    Statement Stmt = null;
    ResultSet RS = null;
    String email = null ;

    try {
        email = request.getSession().getAttribute("Account").toString();
        Class.forName("com.mysql.jdbc.Driver");
        Con = DriverManager.getConnection(url, user, password);
        Stmt = Con.createStatement();
        RS = Stmt.executeQuery("SELECT * FROM movies inner join cart on movies.name = cart.movieID where cart.userID ='"+ email +"'");
    } catch (Exception cnfe) {
        System.err.println("Exception: " + cnfe);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home</title>
    </head>
    <body  background=IMG\bg.jpg>
        <h1 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Welcome To Movie Rent </h1>
        <h2 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Everything in One Place :) </h2>
    <center><a href="UserHome.jsp" > <img src="IMG\Logo.png" alt="Movierent" wedth="150" height="150" align="center"/> </a></center>
    
    <% if (email != null) {%>
    <center>
        <table border="1" bgcolor="purple" >
            <tr>
                <td> <a href="UserHome.jsp"><p style="size:20;color:white;"> Movies </p></a></td>	
                <td> <a href="Profile.jsp"> <p style="size:20;color:white;">Edit Profile</p></a></td> 
                <td> <a href="Rented.jsp"> <p style="size:20;color:yellow;">My Movies</p></a></td>
                <td> <form><button  value="logout" formaction="logout" >Logout</button></form></td> 
            </tr>
        </table>
    </center>    
    <center>
        <form>
            <%
                if (RS != null) {
            %>    
            <%
                while (RS.next()) {
                    out.println("Name : " + RS.getString("name"));
                    out.print("<br>");
                    out.println("Year of release : " + RS.getString("releasedate"));
                    out.print("<br>");
                    out.println("Genre : " + RS.getString("genre"));
                    out.print("<br>");
                    out.println("Description : " + RS.getString("description"));
                    out.print("<br>");
                    out.println("Actors : " + RS.getString("actors"));
                    out.print("<br>");
                    out.println("Days Left : " + RS.getString("duration"));
                    out.print("<br>");

            %>
            <button  value="<%= RS.getString("name")%>" formaction="returnmovie" name="returnbutton" >Return</button>
            <button  value="<%= RS.getString("name")%>" formaction="extendmovie.jsp" name="extendbutton" >Extend Rental</button>
            <%
                    out.print("<br>");
                    out.println("------------------");
                    out.print("<br>");
                }
            %>
            </select>
            <%
                } else {
                    out.print("No items Available");
                }
            %>
            <%
                RS.close();
                Stmt.close();
                Con.close();%>
        </form>
    </center>
        <%} else {%>
        <form>  
        click here to go to login screen
        <button  value="login" formaction="login.jsp" >Login</button>
        </form>
        <%}%>
</body>
</html>
