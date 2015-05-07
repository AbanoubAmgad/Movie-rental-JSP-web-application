<%-- 
    Document   : signup
    Created on : Dec 20, 2014, 1:42:42 PM
    Author     : Abanoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Sign Up </title>
    </head>
    <body background="IMG\bg.jpg">
        <h1 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Welcome To Movie Rent </h1>
        <h2 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Everything in One Place :) </h2>
    <center><a href="Home.jsp" > <img src="IMG\Logo.png" alt="NewsSection" wedth="150" height="150" align="center"/> </a></center>
    <center>
        <table border="1" bgcolor="purple" >
            <tr>
                <td> <a href="signup.jsp"><p style="size:20;color:yellow;"> Register </p></a></td>
                <td> <a href="login.jsp"><p style="size:20;color:white;"> Login </p></a></td>
            </tr>
        </table>
    </center>
    <br> <br>

    <center>
        <p>

        <form action="register">
            <p style="text-align: left; color:black;font-family:MV Boli;font-size:25px;">  
            <table border="0">
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" /></td>
                </tr>

                <tr>
                    <td>Choose a Password:</td>
                    <td><input type="password" name="password" /></td>
                </tr>

                <tr> 
                    <td> 
                        Valid E-mail:
                    </td> 
                    <td> 
                        <input type="email" name="email" /> 
                    </td> 
                </tr> 

                <tr>
                    <td> Age: </td>
                    <td> <select name="age">
                            <option value="6-12">6-12</option>
                            <option value="12-18">12-18</option>
                            <option value="18-25">18-25</option>
                            <option value="25+">25+</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>
                        <input type="radio" name="gender" value="male"/>Male</br>
                    </td>
                    <td>
                        <input type="radio" name="gender" value="female"/>Female
                    </td>
                </tr>

                </p>
            </table>
            Admin <input type="checkbox" name="admin" value="1" /> </br>
            <input type="submit" name="submit"/>


        </form>
    </p>

</body>
</html>
