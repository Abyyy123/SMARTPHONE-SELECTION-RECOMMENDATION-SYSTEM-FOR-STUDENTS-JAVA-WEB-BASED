/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package recommendation;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author hp
 */
@WebServlet(name = "reportnormServlet", urlPatterns = {"/reportnormServlet"})
public class reportnormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/tugasakhir", "root", "");
            stmt = conn.createStatement();

            String sql = "SELECT * FROM normalisasi";
            rs = stmt.executeQuery(sql);

            PrintWriter out = response.getWriter();
            response.setContentType("text/html");

            // Format tanggal dan hari dalam Bahasa Indonesia
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, dd MMMM yyyy", new Locale("in", "ID"));
            String formattedDate = dateFormat.format(now);

            out.println("<html><head><title>Report Data Normalisasi</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px; }");
            out.println(".container { max-width: 900px; margin: auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }");
            out.println("h1 { text-align: center; color: #333; font-size: 24px; margin-bottom: 20px; }");
            out.println("p.date { text-align: center; font-size: 16px; color: #555; margin-bottom: 20px; }");
            out.println("table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }");
            out.println("th, td { border: 1px solid #ddd; text-align: left; padding: 12px; }");
            out.println("th { background-color: #4CAF50; color: white; }");
            out.println("tr:nth-child(even) { background-color: #f9f9f9; }");
            out.println("tr:hover { background-color: #f1f1f1; }");
            out.println(".signature { text-align: right; margin-top: 30px; }");
            out.println(".print-btn, .save-btn { display: block; width: 200px; margin: 30px auto 10px auto; padding: 10px; text-align: center; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; }");
            out.println(".save-btn { background-color: #007BFF; margin-top: 10px; }");
            out.println(".print-btn:hover, .save-btn:hover { background-color: #45a049; }");
            out.println("</style>");
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js'></script>");
            out.println("</head><body>");
            out.println("<div class='container' id='report-container'>");
            out.println("<h1>Report Data Normalisasi</h1>");
            out.println("<p class='date'>Tanggal: " + formattedDate + "</p>");
            out.println("<table>");
            out.println("<tr><th>Merk</th><th>Harga</th><th>Ram</th><th>Memory Internal</th><th>Kamera</th><th>Baterai</th><th>Os</th></tr>");

            int rowCount = 0; // Debugging counter
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("Merk") + "</td>");
                out.println("<td>" + rs.getDouble("Harga") + "</td>");
                out.println("<td>" + rs.getDouble("Ram") + "</td>");
                out.println("<td>" + rs.getDouble("Memory Internal") + "</td>");
                out.println("<td>" + rs.getDouble("Kamera") + "</td>");
                out.println("<td>" + rs.getDouble("Baterai") + "</td>");
                out.println("<td>" + rs.getString("Os") + "</td>");
                out.println("</tr>");
                rowCount++;
            }
            out.println("</table>");

            // Bagian tanda tangan ditambahkan di sini, di bawah tabel
            out.println("<div class='signature'>");
            out.println("<p>Jakarta, " + formattedDate + "</p>");
            out.println("<p style='margin-top: 50px;'>Admin</p>"); // Jarak antara "Jakarta" dan "Admin" ditambah 50px
            out.println("</div>");

            // Tombol ditempatkan di bawah tanda tangan
            out.println("<button class='print-btn' onclick='window.print();'>Cetak Laporan</button>");
            out.println("<button class='save-btn' onclick='captureAndDownload();'>Unduh sebagai Gambar</button>");

            out.println("</div>");
            out.println("<script>");
            out.println("function captureAndDownload() {");
            out.println("  html2canvas(document.getElementById('report-container')).then(function(canvas) {");
            out.println("    var link = document.createElement('a');");
            out.println("    link.href = canvas.toDataURL('image/png');");
            out.println("    link.download = 'reportdatanormalisasi.png';");
            out.println("    link.click();");
            out.println("  });");
            out.println("}");
            out.println("</script>");
            out.println("</body></html>");

            // Debugging: print row count to server log
            System.out.println("Number of rows retrieved: " + rowCount);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}