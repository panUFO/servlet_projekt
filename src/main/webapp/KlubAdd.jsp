<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        <div class="contentbox">
            <jsp:useBean id="storage" class="agencja.service.Storage_service" scope="application" />
            <jsp:useBean id="klub" class="agencja.domain.Klub" scope="session" />
            <jsp:setProperty name="klub" property="*" />

            <%
            storage.add(klub);
            %>

            <div class="successbox">Dodano klub do bazy.</div>

            <p align="center">
                <a href="KlubShowAll.jsp">Powrót do listy klubow</a>
            </p>
        </div>
    </body>
</html>