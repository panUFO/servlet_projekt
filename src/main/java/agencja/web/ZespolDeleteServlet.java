package agencja.web;

import agencja.service.Storage_service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/zespoldeleteservlet")
public class ZespolDeleteServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");

        int index = -1;
        int ID = Integer.parseInt(request.getParameter("iddelete"));

        Storage_service storage_service = (Storage_service) getServletContext().getAttribute("storage");

        for (int i=0; i<storage_service.getAllZespols().size(); i++)
        {
            if (storage_service.getAllZespols().get(i).getID() == ID)
            {
                index = i;
                break;
            }
        }

        if (index != -1)
            storage_service.getAllZespols().remove(index);

        this.getServletContext().getRequestDispatcher("/ZespolShowAll.jsp").forward(request, response);

    }
}
