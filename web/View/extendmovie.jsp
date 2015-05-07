<%-- 
    Document   : extendmovie
    Created on : Dec 23, 2014, 8:48:13 AM
    Author     : Abanoub
--%>
<%String name = request.getParameter("extendbutton");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <form action="extendmovie">
            <p style="text-align: left; color:black;font-family:MV Boli;font-size:25px;">  
                You Will Extend Movie :  <%= name%> , this will cost you 3$
                <br>
            <input type="hidden" name="name" value="<%= name%>"/></td>
            <input type="submit" name="Proceed"/>
            <button value="Cancel" formaction="Rented.jsp">Cancel</button>
        </form>
    </div>
</center>
    </body>
</html>
