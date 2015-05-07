/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Movie;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Abanoub
 */
@WebServlet(name = "addmovie", urlPatterns = {"/addmovie"})
public class addmovie extends HttpServlet {

    public static boolean isNumeric(String str) {
        try {
            double d = Double.parseDouble(str);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Movie movie = new Movie();
            movie.setName(request.getParameter("name"));
            movie.setReleasedate(request.getParameter("date"));
            movie.setGenre(request.getParameter("genre"));
            movie.setDescription(request.getParameter("description"));
            movie.setActors(request.getParameter("actors"));
            movie.setQuantity(request.getParameter("quantity"));
            movie.setPrice(request.getParameter("price"));

            String url = "jdbc:mysql://localhost:3306/movie";
            String dbuser = "root";
            String password = "1111";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            boolean valid = false;

            if (movie.getActors() != "" && movie.getDescription() != ""
                    && movie.getGenre() != "" && movie.getName() != "" && movie.getReleasedate() != ""
                    && movie.getQuantity() != "" && movie.getPrice() != "") {
                valid = true;

            }

            if (!valid) {
                out.println("You Forgot to fill some details, Note That All Fields are required");
                out.println("<button onclick=\"goBack()\">Go Back</button>");
                out.println("<script>");
                out.println("function goBack() {window.history.back()}");
                out.println("</script>");
            } else if (!isNumeric(movie.getQuantity())) {
                out.println("This is Not a Valid Quantity");
                out.println("<button onclick=\"goBack()\">Go Back</button>");
                out.println("<script>");
                out.println("function goBack() {window.history.back()}");
                out.println("</script>");
            } else if (!isNumeric(movie.getPrice())) {
                out.println("This is Not a Valid price");
                out.println("<button onclick=\"goBack()\">Go Back</button>");
                out.println("<script>");
                out.println("function goBack() {window.history.back()}");
                out.println("</script>");
            } else {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Con = DriverManager.getConnection(url, dbuser, password);
                    Stmt = Con.createStatement();
                    RS = Stmt.executeQuery("SELECT * FROM movies where name = '" + movie.getName() + "';");
                    boolean empty = true;
                    while (RS.next()) {
                        empty = false;
                    }
                    System.out.print(RS);
                    if (empty) {
                        Stmt.executeUpdate("INSERT INTO movies VALUES( '" + movie.getName() + "','" + movie.getReleasedate()
                                + "','" + movie.getGenre() + "','" + movie.getDescription() + "','"
                                + movie.getActors() + "','" + movie.getQuantity() + "','" + movie.getPrice() + "')");
                        Stmt.close();
                        Con.close();
                        response.sendRedirect("AdminHome.jsp");
                    } else {
                        out.println("You Can't add The Movie Twice");
                        out.println("<button onclick=\"goBack()\">Go Back</button>");
                        out.println("<script>");
                        out.println("function goBack() {window.history.back()}");
                        out.println("</script>");
                        RS.close();
                        Stmt.close();
                        Con.close();
                    }

                } catch (Exception cnfe) {
                    System.err.println("Exception: " + cnfe);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
