package agencja.web;

import agencja.domain.Klub;
import agencja.domain.Zespol;
import agencja.service.Storage_service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/zespoleditservlet")
public class KlubEditServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");

        int ID = Integer.parseInt(request.getParameter("id"));
        String Miasto = request.getParameter("miasto");
        String Nazwa = request.getParameter("nazwa");
        int IloscMiejsc = Integer.parseInt(request.getParameter("ilosc_miejsc"));

        Storage_service storage_service = (Storage_service) getServletContext().getAttribute("storage");

        for (int i=0; i<storage_service.getAllKlubs().size(); i++)
        {
            if (storage_service.getAllKlubs().get(i).getID() == ID)
            {
                Klub klub = storage_service.getAllKlubs().get(i);
                klub.setMiasto(Miasto);
                klub.setNazwa(Nazwa);
                klub.setIlosc_miejsc(IloscMiejsc);
                break;
            }
        }

        this.getServletContext().getRequestDispatcher("/KlubShowAll.jsp").forward(request, response);
    }
}
