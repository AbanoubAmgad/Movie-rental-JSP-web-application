<%-- 
    Document   : Late
    Created on : Dec 22, 2014, 8:15:38 PM
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

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Con = DriverManager.getConnection(url, user, password);
        Stmt = Con.createStatement();
        RS = Stmt.executeQuery("SELECT * FROM cart where duration = 0;");
    } catch (Exception cnfe) {
        System.err.println("Exception: " + cnfe);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Late Users</title>
    </head>
    <body  background=IMG\bg.jpg>
        <h1 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Welcome To Movie Rent </h1>
        <h2 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Everything in One Place :) </h2>
    <center><a href="AdminHome.jsp" > <img src="IMG\Logo.png" alt="Movierent" wedth="150" height="150" align="center"/> </a></center>
    <center>
        <table border="1" bgcolor="purple" >
            <tr>
                <td> <a href="AdminHome.jsp"><p style="size:20;color:white;"> Movies </p></a></td>	
                <td> <a href="AddMovie.jsp"> <p style="size:20;color:white;">Add a Movie</p></a></td> 
                <td> <a href="Late.jsp"> <p style="size:20;color:yellow;">Late Users</p></a></td>
                <td> <form><button  value="logout" formaction="logout" >Logout</button></form></td> 
            </tr>
        </table>
    </center>    
    <br> <br> 
    <center>
        <form>
            <%
                if (RS != null) {
            %>    
            <%
                while (RS.next()) {
                    out.println("User : " + RS.getString("userID"));
                    out.print("<br>");
                    out.println("Rented Movie: " + RS.getString("movieID"));
                    out.print("<br>");
            %>
            <button  value="<%= RS.getString("userID")%>" formaction="sendMail" name="mailbutton" >Send Late Mail to <%= RS.getString("userID")%></button>
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
    </body>
</html>
