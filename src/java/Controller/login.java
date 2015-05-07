/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abanoub
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

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
            String email = request.getParameter("email");
            String userpassword = request.getParameter("password");
            boolean valid = false;
            boolean admin = false;
            String url = "jdbc:mysql://localhost:3306/movie";
            String dbuser = "root";
            String password = "1111";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Con = DriverManager.getConnection(url, dbuser, password);
                Stmt = Con.createStatement();
                RS = Stmt.executeQuery("Select * from user where Email = '" + email + "' and Password ='" + userpassword + "'");
                while (RS.next()) {
                    valid = true;
                    if (RS.getInt("Admin") == 1) {
                        admin = true;
                    }
                }

                if (valid) {
                    HttpSession session = request.getSession(true);
                    if (session.isNew() == false) {
                        session.invalidate();
                        session = request.getSession(true);
                    }
                    session.setAttribute("Account", email);
                    session.setAttribute("Genre", "All");
                    session.setAttribute("Year", "All");
                    if (admin) {
                        response.sendRedirect("AdminHome.jsp");
                    } else {
                        response.sendRedirect("UserHome.jsp");
                    }
                } else {
                    out.println("Wrong user name or password");
                    out.println("<button onclick=\"goBack()\">Go Back</button>");
                    out.println("<script>");
                    out.println("function goBack() {window.history.back()}");
                    out.println("</script>");
                }

            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
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
