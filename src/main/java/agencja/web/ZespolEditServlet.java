package agencja.web;

import agencja.domain.Zespol;
import agencja.service.Storage_service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/zespoleditservlet")
public class ZespolEditServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");

        int ID = Integer.parseInt(request.getParameter("id"));
        String Nazwa = request.getParameter("nazwa");
        String Kraj = request.getParameter("kraj");

        Storage_service storage_service = (Storage_service) getServletContext().getAttribute("storage");

        for (int i=0; i<storage_service.getAllZespols().size(); i++)
        {
            if (storage_service.getAllZespols().get(i).getID() == ID)
            {
                Zespol zespol = storage_service.getAllZespols().get(i);
                zespol.setNazwa(Nazwa);
                zespol.setKraj(Kraj);
                break;
            }
        }

        //Navigate to page with list of all customers
        this.getServletContext().getRequestDispatcher("/ZespolShowAll.jsp").forward(request, response);
    }
}
