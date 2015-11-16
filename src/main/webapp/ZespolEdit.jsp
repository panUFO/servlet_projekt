<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="agencja.domain.Zespol"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Agencja koncertowa</title>
    </head>

    <body>
        <p><a href="hello">See greetings from servlet</a></p>
        <div class="navbar">
            <div class="navbuttons">
                <div class="navbuttonhome"><a href="index.jsp"><img src="img/home.png" class="navbuttonhome"></a></div>
                <div class="navbutton"><a href="ZespolShowAll.jsp"><img src="img/zespol.png" class="navbutton"></a></div>
                <div class="navbutton"><a href="KlubShowAll.jsp"><img src="img/klub.png" class="navbutton"></a></div>
                <div class="navbutton"><a href="KoncertShowAll.jsp"><img src="img/koncert.png" class="navbutton"></a></div>

            </div>
        </div>

        <jsp:useBean id="storage" class="agencja.service.Storage_service" scope="application" />
        <jsp:useBean id="zespol" class="agencja.domain.Zespol" scope="session" />
        <jsp:setProperty name="zespol" property="*" />

        <div class="contentbox">
            <table class="operationtable">
                <%
                    String ID = request.getParameter("idedit");
                    String Nazwa = "";
                    String Kraj = "";

                    for (Zespol z : storage.getAllZespols())
                    {
                        if (z.getID() == Integer.parseInt(ID))
                        {
                            Nazwa = z.getNazwa();
                            Kraj = z.getKraj();
                            break;
                        }
                    }
                    out.println("<form action='zespoleditservlet'><input type='hidden' name='id' value='" + ID + "' /><tr class='tableheader'><td colspan='2'>Zespol ID = " + ID + "</td></tr><tr><td>Nazwa:</td><td><input type='text' name='nazwa' value='" + Nazwa + "' /></td></tr><tr><td>Kraj:</td><td><input type='text' name='kraj' value='" + Kraj + "' /></td></tr><tr><td colspan='2'><input type='submit' value='ZAPISZ'></td></tr></form>");
                    out.println("<p align='center'><a href='ZespolShowAll.jsp'>Powrót</a></p>");
                %>

            </table>
        </div>
    </body>
</html>