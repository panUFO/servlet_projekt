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
        <div class="navbar">
            <div class="navbuttons">
                <div class="navbuttonhome"><a href="index.jsp"><img src="img/home.png" class="navbuttonhome"></a></div>
                <div class="navbutton"><a href="ZespolShowAll.jsp"><img src="img/zespol.png" class="navbutton"></a></div>
            </div>
        </div>

        <jsp:useBean id="storage" class="agencja.service.Storage_service" scope="application" />
        <jsp:useBean id="zespol" class="agencja.domain.Zespol" scope="session" />

        <div class="contentbox">
            <form action="ZespolAdd.jsp">
            <table class="operationtable">
                <tr class='tableheader'>
                    <td colspan='2'>Dodawanie zespolu</td>
                </tr>
                <tr>
                    <td>Nazwa:</td>
                    <td><input type="text" name="nazwa" value="${zespol.nazwa}" /></td>
                </tr>
                <tr>
                    <td>Kraj:</td>
                    <td><input type="text" name="kraj" value="${zespol.kraj}" /></td>
                </tr>

                <tr>
                    <td colspan="2"><input type="submit" value=" DODAJ " align="right"></td>
                </tr>
            </table>
            </form>
        </div>
    </body>
</html>