/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Abanoub
 */
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

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
            User user = new User();
            user.setName(request.getParameter("name"));
            user.setPassword(request.getParameter("password"));
            user.setEmail(request.getParameter("email"));
            user.setAge(request.getParameter("age"));
            user.setGender(request.getParameter("gender"));
            user.setAdmin(request.getParameter("admin"));
            if (user.isAdmin() == null) {
                user.setAdmin("0");
            }

            String url = "jdbc:mysql://localhost:3306/movie";
            String dbuser = "root";
            String password = "1111";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;
            boolean valid = false;

            if (user.getAge() != "" && user.getEmail() != ""
                    && user.getGender() != "" && user.getName() != ""
                    && user.getPassword() != "" && user.isAdmin() != "") {
                valid = true;

            }

            if (!valid) {
                out.println("You Forgot to fill some details, Note That All Fields are required");
                out.println("<button onclick=\"goBack()\">Go Back</button>");
                out.println("<script>");
                out.println("function goBack() {window.history.back()}");
                out.println("</script>");
            } else {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Con = DriverManager.getConnection(url, dbuser, password);
                    Stmt = Con.createStatement();
                    RS = Stmt.executeQuery("SELECT * FROM user where Email = '" + user.getEmail() + "';");
                    boolean empty = true;
                    while (RS.next()) {
                        empty = false;
                    }
                    if (empty) {
                        Stmt.executeUpdate("INSERT INTO user VALUES( '" + user.getName() + "','" + user.getPassword()
                                + "','" + user.getEmail() + "','" + user.getGender() + "','"
                                + user.getAge() + "','" + user.isAdmin() + "')");
                        RS.close();
                        Stmt.close();
                        Con.close();
                        response.sendRedirect("Home.jsp");
                    } else {
                        out.println("This Mail is already in our database, please use it to login");
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
    }    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

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
