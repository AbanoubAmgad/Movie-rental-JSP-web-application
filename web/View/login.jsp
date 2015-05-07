<%-- 
    Document   : login
    Created on : Dec 20, 2014, 4:49:50 PM
    Author     : Abanoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Login </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body  background=IMG\bg.jpg>
        <h1 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Welcome To Movie Rent </h1>
        <h2 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Everything in One Place :) </h2>
    <center><a href="Home.jsp" > <img src="IMG\Logo.png" alt="Movierent" wedth="150" height="150" align="center"/> </a></center>
    <center>
        <table border="1" bgcolor="purple" >
            <tr>
                <td> <a href="signup.jsp"><p style="size:20;color:white;"> Register </p></a></td>
                <td> <a href="Login.jsp"><p style="size:20;color:yellow;"> Login </p></a></td>
            </tr>
        </table>
    </center>
    
    <center>
        <table border="1" background="IMG\formbg.jpg" width="500" height="300" >
            <form action="login">
                <tr>
                    <td>
                        <p style ="color: white;font-family: Gabriola; font-size:20px;text-align:center; "> Login Box ! </p> 
                        </br>

                        <p style ="color: white;font-family: Tempus Sans ITC;text-align:center;">
                            E-Mail   :  <input type="email" name="email" /> <br/>
                            Password :  <input type="Password" name="password"/> <br/>
                           <input type="submit" value="Log In">
                            </br> </br> </br>
                        <p style ="color: white;font-family: Tempus Sans ITC;text-align:center;"> 
                            If You are a NEW Member , Click 
                            <a href="signup.jsp" > HERE </a>
                            To Sign Up
                        </p>
                        </p>
                    </td>
                </tr>
        </table>
    </form>
</center>
</body>
</html>
