package agencja.web;


import agencja.domain.Koncert;
import agencja.service.Storage_service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/koncerteditservlet")
public class KoncertEditServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        int ID = Integer.parseInt(request.getParameter("id"));
        String [] c = request.getParameterValues("klubs");
        int KlubId = Integer.parseInt(c[0]);

        String NazwaKoncertu = request.getParameter("nazwa_koncertu");
        String CenyBiletow = request.getParameter("ceny_biletow");

        Storage_service storage_service = (Storage_service) getServletContext().getAttribute("storage");

        for (int i=0; i<storage_service.getAllKlubs().size(); i++) {
            if (storage_service.getAllKlubs().get(i).getID() == ID)
            {
                Koncert koncert = storage_service.getAllKoncerts().get(i);
                koncert.setKlub_id(KlubId);
                koncert.setNazwa_koncertu(NazwaKoncertu);
                koncert.setCeny_biletow(CenyBiletow);
                break;
            }
        }

        this.getServletContext().getRequestDispatcher("/KoncertShowAll.jsp").forward(request, response);
    }
}