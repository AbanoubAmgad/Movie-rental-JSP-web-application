<%-- 
    Document   : UserHome
    Created on : Dec 20, 2014, 5:33:08 PM
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
    String year = null;
    String genre = null;
    String email = null;

    try {

        year = request.getSession().getAttribute("Year").toString();
        genre = request.getSession().getAttribute("Genre").toString();
        email = request.getSession().getAttribute("Account").toString();

        Class.forName("com.mysql.jdbc.Driver");
        Con = DriverManager.getConnection(url, user, password);
        Stmt = Con.createStatement();
        if (email != null) {
            if (!genre.equals("All") && !year.equals("All")) {
                RS = Stmt.executeQuery("SELECT * FROM movies where genre = '" + genre + "' and releasedate = '" + year + "' and quantity > 0;");
            }

            if (!genre.equals("All") && year.equals("All")) {
                RS = Stmt.executeQuery("SELECT * FROM movies where genre = '" + genre + "' and quantity > 0;");
            }

            if (genre.equals("All") && !year.equals("All")) {
                RS = Stmt.executeQuery("SELECT * FROM movies where releasedate = '" + year + "' and quantity > 0 ;");
            }

            if (genre.equals("All") && year.equals("All")) {
                RS = Stmt.executeQuery("SELECT * FROM movies where quantity > 0;");
            }
        }
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
                <td> <a href="UserHome.jsp"><p style="size:20;color:yellow;"> Movies </p></a></td>	
                <td> <a href="Profile.jsp"> <p style="size:20;color:white;">Edit Profile</p></a></td> 
                <td> <a href="Rented.jsp"> <p style="size:20;color:white;">My Movies</p></a></td>
                <td> <form><button  value="logout" formaction="logout" >Logout</button></form></td> 
            </tr>
        </table>
    </center>    
    <center>
        <form>

            <table border="0">
                <tr>
                    <td> Year of Release: </td>
                    <td> <select name="date">
                            <option value="All" <%if (year.equals("All")) {%> selected <%}%> >All</option>
                            <option value="New : > 2010" <%if (year.equals("New : > 2010")) {%> selected <%}%>>New : > 2010</option>
                            <option value="Old : < 2010" <%if (year.equals("Old : < 2010")) {%> selected <%}%>>Old : < 2010</option>
                        </select>
                    </td>
                </tr>

                <input type="hidden" name="email" value="<%=email%>"/></td>
                <tr>
                    <td> Genre: </td>
                    <td> <select name="genre">
                            <option value="All" <%if (genre.equals("All")) {%> selected <%}%> >All</option>
                            <option value="Action" <%if (genre.equals("Action")) {%> selected <%}%> >Action</option>
                            <option value="Drama" <%if (genre.equals("Drama")) {%> selected <%}%> >Drama</option>
                            <option value="Horror" <%if (genre.equals("Horror")) {%> selected <%}%> >Horror</option>
                            <option value="Comedy" <%if (genre.equals("Comedy")) {%> selected <%}%> >Comedy</option>
                        </select>
                    </td>
                </tr>
            </table>
            <button  value="Filter" formaction="filter" >Filter</button>
            <br>
            <br>
            <%
                if (RS != null) {
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

            %>
            <button  value="<%= RS.getString("name")%>" formaction="RentMovie.jsp" name="rentbutton" >Rent</button>
            <%
                        out.print("<br>");
                        out.println("------------------");
                        out.print("<br>");
                    }
                } else {
                    out.print("No items Available");
                }
                RS.close();
                Stmt.close();
                Con.close();%>
        </form>
    </center>

    <%} else {%>
    <form>  
        click to go to login screen
        <button  value="login" formaction="login.jsp" >Login</button>
    </form>
    <%}%>
</body>
</html>
