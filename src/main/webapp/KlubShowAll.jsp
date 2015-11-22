<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="agencja.domain.Klub"%>
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
            <table class="operationtable">
                <tr class="tableheader">
                    <td colspan="2">CRUD - podaj id</td>
                </tr>
                <tr>
                    <td colspan="2"><a href="KlubGet.jsp"><div class="opbutton"><img src="img/add.png"></div></a></td>
                </tr>
                <tr>
                    <form action="KlubPreview.jsp">
                        <td><input type="text" name="idpreview" value=""/></td>
                        <td><input type="image" src="img/preview.png" border="0" alt="Submit" onclick="window.location.href='KlubPreview.jsp'" /></td>
                    </form>
                </tr>
                <tr>
                    <form action="KlubEdit.jsp">
                        <td><input type='text' name='idedit' value=""/></td>
                        <td><input type="image" src="img/edit.png" border="0" alt="Submit" /></td>
                    </form>
                </tr>
                <tr>
                    <form action="klubdeleteservlet">
                        <td><input type='text' name='iddelete' value=""/></td>
                        <td><input type='image' src="img/delete.png" border="0" alt="Submit"/></td>
                    </form>
                </tr>
            </table>

            <jsp:useBean id="storage" class="agencja.service.Storage_service" scope="application" />

            <table class="presentationtable" align="center">
            <tr>
                <td>ID</td>
                <td>Miasto</td>
                <td>Nazwa</td>
                <td>Ilosc miejsc</td>
            </tr>
            <%
                for (Klub klub : storage.getAllKlubs())
                {
                    out.println(
                    "<tr><td>" + klub.getID() + "</td>" +
                    "<td>" + klub.getMiasto() + "</td>" +
                    "<td>" + klub.getNazwa() + "</td>" +
                    "<td>" + klub.getIlosc_miejsc() + "</td>" +
                    /*"<td><img src=" + "img/preview.png" + " class=\"actionbutton\"></td>" +
                    "<td><img src=" + "img/edit.png" + " class=\"actionbutton\"></td>" +
                    "<td><img src=" + "img/delete.png" + " class=\"actionbutton\"></td>" +*/
                    "</tr>");
                }
            %>
            </table>
        </div>
    </body>
</html>