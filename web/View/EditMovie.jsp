<%-- 
    Document   : EditMovie
    Created on : Dec 20, 2014, 10:28:21 PM
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
    String moviename = request.getParameter("editbutton");
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
        }else {
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
        <title> Edit a Movie </title>
    </head>
    <body background="IMG\bg.jpg">
        <h1 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Welcome To Movie Rent </h1>
        <h2 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Everything in One Place :) </h2>
    <center><a href="AdminHome.jsp" > <img src="IMG\Logo.png" alt="NewsSection" wedth="150" height="150" align="center"/> </a></center>
    <center>
        <p>

        <form action="editmovie">
            <p style="text-align: left; color:black;font-family:MV Boli;font-size:25px;">  
            <table border="0">
                <tr>
                    <td>Name:</td>
                    <td><%= movie.getName()%></td>
                <input type="hidden" name="name" value="<%= movie.getName()%>"/></td>
                </tr>

                 <tr>
                    <td> Year of Release: </td>
                    <td> <select name="date">
                            <option value="New : > 2010" <%if (movie.getReleasedate().equals("New : > 2010")) {%> selected <%}%> >New : > 2010</option>
                            <option value="Old : < 2010" <%if (movie.getReleasedate().equals("Old : < 2010")) {%> selected <%}%> >Old : < 2010</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td> Genre: </td>
                    <td> <select name="genre">
                            <option value="Action" <%if (movie.getGenre().equals("Action")) {%> selected <%}%> >Action</option>
                            <option value="Drama" <%if (movie.getGenre().equals("Drama")) {%> selected <%}%> >Drama</option>
                            <option value="Horror" <%if (movie.getGenre().equals("Horror")) {%> selected <%}%> >Horror</option>
                            <option value="Comedy" <%if (movie.getGenre().equals("Comedy")) {%> selected <%}%> >Comedy</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td> Description: </td>
                    <td> <textarea name="description" value="<%= movie.getDescription()%>"> <%= movie.getDescription()%> </textarea> </td>
                </tr>

                <tr>
                    <td> Actors: </td>
                    <td> <textarea placeholder="actors .." name="actors" value="<%= movie.getActors()%>"> <%= movie.getActors()%></textarea> </td>
                </tr>

                <tr> 
                    <td> 
                        Quantity:
                    </td> 
                    <td> 
                        <input type="text" name="quantity" value="<%= movie.getQuantity()%>" /> 
                    </td> 
                </tr> 

                <tr> 
                    <td> 
                        Price:
                    </td> 
                    <td> 
                        <input type="text" name="price" value="<%= movie.getPrice()%>"/> 
                    </td> 
                </tr> 

                </p>
            </table>
            <input type="submit" name="submit"/>
            <button value="Cancel" formaction="AdminHome.jsp">Cancel</button>
        </form>
    </p>
</center>
</body>
</html>
