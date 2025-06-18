/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package recommendation;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet1", urlPatterns = {"/LoginServlet1"})
public class LoginServlet1 extends HttpServlet {
    private static final String VALID_USERNAME = "admin"; // Ganti dengan username valid
    private static final String VALID_PASSWORD = "123"; // Ganti dengan password valid

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException , IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("loginadmin.jsp");
        dispatcher.forward(request,response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        if (VALID_USERNAME.equals(username) && VALID_PASSWORD.equals(password)) {
            session.setAttribute("loggedIn", true);
            response.sendRedirect("dashboardServlet"); // Redirect ke dashboard setelah login berhasil
        } else {
            session.setAttribute("loggedIn", false);
            response.sendRedirect("loginadmin.jsp"); // Redirect ke halaman login jika gagal
        }
    }
}