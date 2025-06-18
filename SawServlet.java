/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package recommendation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import recommendation.Phone;

@WebServlet(name = "SawServlet", urlPatterns = {"/SawServlet"})
public class SawServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost/tugasakhir";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = ""; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double priceWeight = Double.parseDouble(request.getParameter("hargaBobot"))/ 100;
        double ramWeight = Double.parseDouble(request.getParameter("ramBobot"))/ 100;
        double memoryWeight = Double.parseDouble(request.getParameter("memoryBobot"))/ 100;
        double cameraWeight = Double.parseDouble(request.getParameter("kameraBobot"))/ 100;
        double batteryWeight = Double.parseDouble(request.getParameter("bateraiBobot"))/ 100;

        List<Phone> phones = new ArrayList<>();

        // Database connection
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM normalisasi";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    phones.add(new Phone(rs.getString("Merk"), rs.getDouble("Harga"), rs.getDouble("Ram"), rs.getDouble("Memory Internal"), rs.getDouble("Kamera"), rs.getDouble("Baterai")));
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        // Calculate the SAW score
        for (Phone phone : phones) {
            double score = (phone.getHarga() * priceWeight) +
                           (phone.getRam() * ramWeight) +
                           (phone.getMemoryInternal() * memoryWeight) +
                           (phone.getKamera() * cameraWeight) +
                           (phone.getBaterai() * batteryWeight);
            phone.setScore(score);
        }

        // Sort phones by score
        phones.sort(Comparator.comparingDouble(Phone::getScore).reversed());

        // Pass the result to JSP
        request.setAttribute("phones", phones);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}