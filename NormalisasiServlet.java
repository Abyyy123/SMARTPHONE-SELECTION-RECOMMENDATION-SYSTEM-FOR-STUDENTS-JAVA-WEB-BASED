/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package recommendation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "NormalisasiServlet", urlPatterns = {"/NormalisasiServlet"})
public class NormalisasiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost/tugasakhir";
    private static final String DB_USER = "root";  // Replace with your DB username
    private static final String DB_PASSWORD = "";  // Replace with your DB password
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            normalizeData();
            response.getWriter().write("{\"status\":\"success\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\":\"error\",\"message\":\"" + e.getMessage() + "\"}");
        }
    }
    
    private void normalizeData() throws SQLException, ClassNotFoundException {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement()) {
             
            // Fetch data from the database
            String query = "SELECT * FROM data_smartphone";
            try (ResultSet rs = stmt.executeQuery(query)) {
                while (rs.next()) {
                    String merk = rs.getString("merk");
                    double harga = rs.getDouble("harga");
                    double ram = rs.getDouble("ram");
                    double memoryinternal = rs.getDouble("Memory Internal");
                    double kamera = rs.getDouble("kamera");
                    double baterai = rs.getDouble("baterai");
                    String os = rs.getString("os");
                    
                    // Define min and max values for normalization
                    double minHarga = 2329000;
                    double maxRam = 12;
                    double maxMemory = 256;
                    double maxKamera = 108;
                    double maxBaterai = 6000;
                    
                    // Normalize values
                    double normalizedHarga = minHarga / harga;
                    double normalizedRam = ram / maxRam;
                    double normalizedMemory = memoryinternal / maxMemory;
                    double normalizedKamera = kamera / maxKamera;
                    double normalizedBaterai = baterai / maxBaterai;
                    
                    // Insert the normalized values into the new table
                    String insertQuery = "INSERT INTO normalisasi VALUES (?, ?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement pstmt = conn.prepareStatement(insertQuery)) {
                        pstmt.setString(1, merk);
                        pstmt.setDouble(2, round(normalizedHarga, 3)); // Set precision to 2 decimal places
                        pstmt.setDouble(3, round(normalizedRam, 3));
                        pstmt.setDouble(4, round(normalizedMemory, 3));
                        pstmt.setDouble(5, round(normalizedKamera, 3));
                        pstmt.setDouble(6, round(normalizedBaterai, 3));
                        pstmt.setString(7, os);
                        pstmt.executeUpdate();
                    }
                }
            }
        }
    }
    
    private double round(double value, int places) {
        if (places < 0) throw new IllegalArgumentException();

        long factor = (long) Math.pow(10, places);
        value = value * factor;
        long tmp = Math.round(value);
        return (double) tmp / factor;
    }
}