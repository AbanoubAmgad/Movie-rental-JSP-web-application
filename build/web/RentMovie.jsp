<%-- 
    Document   : RentMovie
    Created on : Dec 21, 2014, 12:20:38 PM
    Author     : Abanoub
--%>
﻿<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = "jdbc:mysql://localhost:3306/movie";
    String user = "root";
    String password = "1111";
    String Line;
    Connection Con = null;
    Statement Stmt = null;
    ResultSet RS = null;
    String moviename = request.getParameter("rentbutton");
    Movie movie = new Movie();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Con = DriverManager.getConnection(url, user, password);
        Stmt = Con.createStatement();
        RS = Stmt.executeQuery("SELECT * FROM movies where name = '" + moviename + "';");
    } catch (Exception cnfe) {
        System.err.println("Exception: " + cnfe);
    }

    if (RS != null) {
        while (RS.next()) {
            movie.setName(RS.getString("name"));
            movie.setReleasedate(RS.getString("releasedate"));
            movie.setGenre(RS.getString("genre"));
            movie.setDescription(RS.getString("description"));
            movie.setActors(RS.getString("actors"));
            movie.setPrice(RS.getString("price"));
            movie.setQuantity(RS.getString("quantity"));
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
        <title> Rent a Movie </title>
    </head>
    <body background="IMG\bg.jpg">
        <h1 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Welcome To Movie Rent </h1>
        <h2 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Everything in One Place :) </h2>
    <center><a href="UserHome.jsp" > <img src="IMG\Logo.png" alt="NewsSection" wedth="150" height="150" align="center"/> </a></center>
    <div align=center>
        <form action="rentmovie">
            <p style="text-align: left; color:black;font-family:MV Boli;font-size:25px;">  
            <table border="0">
                <tr>
                    <td>Name:</td>
                    <td><%= movie.getName()%></td>
                <input type="hidden" name="name" value="<%= movie.getName()%>"/></td>
                </tr>

                <tr>
                    <td>Year of release:</td>
                    <td><%= movie.getReleasedate()%></td>
                </tr>

                <tr> 
                    <td> 
                        Genre:
                    </td> 
                    <td> 
                        <%= movie.getGenre()%>
                    </td> 
                </tr> 

                <tr>
                    <td> Description: </td>
                    <td><%= movie.getDescription()%> </td>
                </tr>

                <tr>
                    <td> Actors: </td>
                    <td> <%= movie.getActors()%></td>
                </tr>

                <tr> 
                    <td> 
                        Price:
                    </td> 
                    <td> 
                        <%= movie.getPrice()%>
                    </td> 
                </tr> 

                <tr> 
                    <td> 
                        Your Credit Card Number:
                    </td> 
                    <td> 
                        <input type="text" >
                    </td> 
                </tr> 

                </p>
            </table>
            <input type="submit" name="Proceed"/>
            <button value="Cancel" formaction="UserHome.jsp">Cancel</button>
        </form>
    </div>
</center>
</body>
</html>
