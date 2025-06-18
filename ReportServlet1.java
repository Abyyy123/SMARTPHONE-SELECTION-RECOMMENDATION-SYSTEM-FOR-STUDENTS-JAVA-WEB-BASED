/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package recommendation;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
/**
 *
 * @author hp
 */


@WebServlet(name = "ReportServlet1", urlPatterns = {"/ReportServlet1"})
public class ReportServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String harga = request.getParameter("hargaBobot");
        String ram = request.getParameter("ramBobot");
        String memory = request.getParameter("memoryBobot");
        String kamera = request.getParameter("kameraBobot");
        String baterai = request.getParameter("bateraiBobot");

        request.setAttribute("hargaBobot", harga);
        request.setAttribute("ramBobot", ram);
        request.setAttribute("memoryBobot", memory);
        request.setAttribute("kameraBobot", kamera);
        request.setAttribute("bateraiBobot", baterai);

        RequestDispatcher dispatcher = request.getRequestDispatcher("report.jsp");
        dispatcher.forward(request, response);
    }
}