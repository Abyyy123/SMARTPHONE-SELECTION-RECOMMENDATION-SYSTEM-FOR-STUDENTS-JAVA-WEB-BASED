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
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "InputServlet", urlPatterns = {"/InputServlet"})
public class InputServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost/tugasakhir";
    private static final String DB_USER = "root";  // Replace with your DB username
    private static final String DB_PASSWORD = "";  // Replace with your DB password
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Inputdata.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data with null and empty checks
        String merk = request.getParameter("merk");
        if (merk == null || merk.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Merk is required.");
            request.getRequestDispatcher("Inputdata.jsp").forward(request, response);
            return; // Stop execution if Merk is null or empty
        }

        int harga = parseInteger(request.getParameter("harga"));
        int ram = parseInteger(request.getParameter("ram"));
        int memoryInternal = parseInteger(request.getParameter("memoryinternal"));
        int kamera = parseInteger(request.getParameter("kamera"));
        int baterai = parseInteger(request.getParameter("baterai"));
        String os = request.getParameter("os");

        // Debugging: Log the values to the console
        System.out.println("Merk: " + merk);
        System.out.println("Harga: " + harga);
        System.out.println("RAM: " + ram);
        System.out.println("Memory Internal: " + memoryInternal);
        System.out.println("Kamera: " + kamera);
        System.out.println("Baterai: " + baterai);
        System.out.println("OS: " + os);

        // Save the data to the database
        Connection conn = null;
        PreparedStatement pstmt = null;
        String message = "Data berhasil disimpan.";

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver"); // Update to com.mysql.cj.jdbc.Driver for newer MySQL versions

            // Establish connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare SQL query for inserting data
            String sql = "INSERT INTO data_smartphone VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, merk);
            pstmt.setInt(2, harga);
            pstmt.setInt(3, ram);
            pstmt.setInt(4, memoryInternal);
            pstmt.setInt(5, kamera);
            pstmt.setInt(6, baterai);
            pstmt.setString(7, os);

            // Execute update
            pstmt.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            message = "Terjadi kesalahan saat menyimpan data.";
            throw new ServletException(e);
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        // Forward to JSP with success message
        request.setAttribute("message", message);
        request.getRequestDispatcher("Inputdata.jsp").forward(request, response);
    }

    private int parseInteger(String value) {
        if (value == null || value.isEmpty()) {
            return 0; // or throw an exception, or set to a default value
        }
        return Integer.parseInt(value);
    }
}