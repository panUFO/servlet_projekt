<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.example.jdbc.domain.Zespol"%>
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
            </div>
        </div>

        <div class="contentbox">
            <jsp:useBean id="storage" class="com.example.jdbc.service.Storage_service" scope="application" />
            <jsp:useBean id="zespol" class="com.example.jdbc.domain.Zespol" scope="session" />
            <jsp:setProperty name="zespol" property="*" />

            <%
            storage.add(zespol);
            %>

            <div class="successbox">Dodano zespol do bazy.</div>

            <p align="center">
                <a href="ZespolShowAll.jsp">Powrót do listy zespolow</a>
            </p>
        </div>
    </body>
</html>