<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@page import="agencja.domain.Klub"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Agencja koncertowa</title>
    </head>

    <body>
        <p><a href="hello">See greetings from servlet</a></p>
        <div class="navigationbar">
            <div class="navigationbuttons">
                <div class="navigationbuttonhome"><a href="index.jsp"><img src="img/home.png" class="navigationbuttonhome"></a></div>
                <div class="navigationbutton"><a href="ZespolShowAll.jsp"><img src="img/zespol.png" class="navigationbutton"></a></div>
                <div class="navigationbutton"><a href="KlubShowAll.jsp"><img src="img/klub.png" class="navigationbutton"></a></div>
                <div class="navigationbutton"><a href="KoncertShowAll.jsp"><img src="img/koncert.png" class="navigationbutton"></a></div>

            </div>
        </div>

            <jsp:useBean id="storage" class="agencja.service.Storage_service" scope="application" />
            <jsp:useBean id="klub" class="agencja.domain.Klub" scope="session" />
            <jsp:setProperty name="klub" property="*" />

        <div class="contentbox">

            <table class="operationtable">

                <%

                    String ID = request.getParameter("idpreview");
                    String Miasto = "";
                    String Nazwa = "";
                    String Kraj = "";
                    int IloscMiejsc = -1;


                    for (Klub k : storage.getAllKlubs())
                    {
                        if (k.getID() == Integer.parseInt(ID))
                        {
                            Miasto = k.getMiasto();
                            Nazwa = k.getNazwa();
                            IloscMiejsc = k.getIlosc_miejsc();
                            break;
                        }
                    }


                    out.println("<tr class='tableheader'><td colspan='2'>Klub ID=" + ID + "</td></tr><tr><td>Miasto:</td><td>" + Miasto + "</td></tr>");<tr><td>Nazwa:</td><td>" + Nazwa + "</td></tr><tr><td>Ilosc miejsc:</td><td>" + IloscMiejsc + "</td></tr>");
                    out.println("<p align='center'><a href='KlubShowAll.jsp'>Powrót do listy klubow</a></p>");
                %>

            </table>
        </div>
    </body>
</html>