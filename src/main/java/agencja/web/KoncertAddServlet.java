package agencja.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


import agencja.domain.Klub;
import agencja.domain.Koncert;
import agencja.service.Storage_service;

@WebServlet(urlPatterns = "/koncertaddservlet")
public class KoncertAddServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String [] a = request.getParameterValues("klubs");
        int KlubId = Integer.parseInt(a[0]);
        String NazwaKoncertu =  request.getParameter("nazwa_koncertu");
        String CenyBiletow = request.getParameter("ceny_biletow");

        Storage_service storage = (Storage_service) getServletContext().getAttribute("storage");


        Koncert newKoncert = new Koncert(KlubId, NazwaKoncertu, CenyBiletow);
        storage.add(newKoncert);

        this.getServletContext().getRequestDispatcher("/KoncertShowAll.jsp").forward(request, response);
        }
}