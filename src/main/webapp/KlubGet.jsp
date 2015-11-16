<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        <div class="contentbox">
            <form action="KlubAdd.jsp">
            <table class="operationtable">
                <tr class='tableheader'>
                    <td colspan='2'>Dodawanie klubu</td>
                </tr>
                <tr>
                    <td>Miasto:</td>
                    <td><input type="text" name="miasto" value="${klub.miasto}" /></td>
                </tr>

                <tr>
                    <td>Nazwa:</td>
                    <td><input type="text" name="nazwa" value="${klub.nazwa}" /></td>
                </tr>

                <tr>
                    <td>Ilosc Miejsc:</td>
                    <td><input type="text" name="ilosc_miejsc" value="${klub.ilosc_miejsc}" /></td>
                </tr>


                <tr>
                    <td colspan="2"><input type="submit" value=" DODAJ " align="right"></td>
                </tr>
            </table>
            </form>
        </div>
    </body>
</html>