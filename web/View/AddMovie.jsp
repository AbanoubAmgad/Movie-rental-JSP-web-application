<%-- 
    Document   : AddMovie
    Created on : Dec 20, 2014, 7:34:52 PM
    Author     : Abanoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Add a Movie </title>
    </head>
    <body background="IMG\bg.jpg">
        <h1 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Welcome To Movie Rent </h1>
        <h2 style="background-color:black;text-align: center;color: white;font-family: Freestyle Script;"> Everything in One Place :) </h2>
    <center><a href="AdminHome.jsp" > <img src="IMG\Logo.png" alt="NewsSection" wedth="150" height="150" align="center"/> </a></center>

    <center>
        <p>

        <form action="addmovie">
            <p style="text-align: left; color:black;font-family:MV Boli;font-size:25px;">  
            <table border="0">
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" /></td>
                </tr>

               <tr>
                    <td> Year of Release: </td>
                    <td> <select name="date">
                            <option value="New : > 2010">New : > 2010</option>
                            <option value="Old : < 2010">Old : < 2010</option>
                        </select>
                    </td>
                </tr>


                <tr>
                    <td> Genre: </td>
                    <td> <select name="genre">
                            <option value="Action">Action</option>
                            <option value="Drama">Drama</option>
                            <option value="Horror">Horror</option>
                            <option value="Comedy">Comedy</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td> Description: </td>
                    <td> <textarea placeholder="a small description" name="description"></textarea> </td>
                </tr>

                <tr>
                    <td> Actors: </td>
                    <td> <textarea placeholder="actors .." name="actors"></textarea> </td>
                </tr>

                <tr> 
                    <td> 
                        Quantity:
                    </td> 
                    <td> 
                        <input type="text" name="quantity" /> 
                    </td> 
                </tr> 

                <tr> 
                    <td> 
                        Price:
                    </td> 
                    <td> 
                        <input type="text" name="price" /> 
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
