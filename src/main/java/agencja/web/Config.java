package agencja.web;

import agencja.service.Storage_service;

import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;

@WebListener
public class Config implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        event.getServletContext().setAttribute("storage", new Storage_service());
    }

    public void contextDestroyed(ServletContextEvent event) {
    }
}
