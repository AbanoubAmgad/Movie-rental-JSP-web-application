<%-- 
    Document   : AdminHome
    Created on : Dec 20, 2014, 5:32:52 PM
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
        RS = Stmt.executeQuery("SELECT * FROM movies;");
    } catch (Exception cnfe) {
        System.err.println("Exception: " + cnfe);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
    </head>
    <body  background=IMG\bg.jpg>
        <h1 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Welcome To Movie Rent </h1>
        <h2 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Everything in One Place :) </h2>
    <center><a href="AdminHome.jsp" > <img src="IMG\Logo.png" alt="Movierent" wedth="150" height="150" align="center"/> </a></center>
    <center>
        <table border="1" bgcolor="purple" >
            <tr>
                <td> <a href="AdminHome.jsp"><p style="size:20;color:yellow;"> Movies </p></a></td>	
                <td> <a href="AddMovie.jsp"> <p style="size:20;color:white;">Add a Movie</p></a></td> 
                <td> <a href="Late.jsp"> <p style="size:20;color:white;">Late Users</p></a></td>
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
                    out.println("Price : " + RS.getString("price"));
                    out.print("<br>");
                    out.println("Quantity : " + RS.getString("quantity"));
                    out.print("<br>");

            %>
            <button  value="<%= RS.getString("name")%>" formaction="EditMovie.jsp" name="editbutton" >Edit</button>
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
