/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package recommendation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.regex.Pattern;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost/tugasakhir";
    private static final String DB_USER = "root";  // Replace with your DB username
    private static final String DB_PASSWORD = "";  // Replace with your DB password

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");

        // Check if any field is empty
        if (username == null || username.isEmpty() ||
                email == null || email.isEmpty() ||
                password == null || password.isEmpty() ||
                confirmPassword == null || confirmPassword.isEmpty()) {
            request.setAttribute("error", "Please fill in all fields.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Validate email format
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern emailPat = Pattern.compile(emailRegex);
        if (!emailPat.matcher(email).matches()) {
            request.setAttribute("error", "Invalid email format.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Validate password length and content
        if (password.length() < 8) {
            request.setAttribute("error", "Password must be at least 8 characters long.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        String passwordRegex = "^(?=.*[a-zA-Z])(?=.*\\d).+$";
        Pattern passwordPat = Pattern.compile(passwordRegex);
        if (!passwordPat.matcher(password).matches()) {
            request.setAttribute("error", "Password must contain at least one letter and one number.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Save the data to the database
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare SQL query
            String sql = "INSERT INTO user (username, email, password) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);

            // Execute update
            pstmt.executeUpdate();

            // Simulate successful registration
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("login.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while processing your registration. Please try again.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}