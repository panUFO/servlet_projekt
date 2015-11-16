<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="agencja.domain.Zespol"%>
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

            <!--<a href="ZespolGet.jsp" class="buttonlink"><div class="addbutton">+</div></a>-->
            <table class="operationtable">
                <tr class="tableheader">
                    <td colspan="2">Operacje</td>
                </tr>
                <tr>
                    <td colspan="2"><a href="ZespolGet.jsp"><div class="opbutton"><img src="img/add.png"></div></a></td>
                </tr>
                <tr>
                    <form action="ZespolPreview.jsp">
                        <td><input type="text" name="idpreview" value="Podaj ID"/></td>
                        <!--<td><a href="ZespolPreview.jsp"><div class="opbutton"><img src="img/preview.png"></div></a></td>-->
                        <td><input type="image" src="img/preview.png" border="0" alt="Submit" onclick="window.location.href='ZespolPreview.jsp'" /></td>
                    </form>
                </tr>
                <tr>
                    <form action="ZespolEdit.jsp">
                        <td><input type='text' name='idedit' value="Podaj ID"/></td>
                        <!--<td><a href="ZespolGet.jsp"><div class="opbutton"><img src="img/edit.png"></div></a></td>-->
                        <td><input type="image" src="img/edit.png" border="0" alt="Submit" /></td>
                    </form>
                </tr>
                <tr>
                    <form action="zespoldeleteservlet">
                        <td><input type='text' name='iddelete' value="Podaj ID"/></td>
                        <!--<td><a href="ZespolGet.jsp"><div class="opbutton"><img src="img/delete.png"></div></a></td>-->
                        <td><input type='image' src="img/delete.png" border="0" alt="Submit"/></td>
                    </form>
                </tr>
            </table>

            <jsp:useBean id="storage" class="agencja.service.Storage_service" scope="application" />

            <table class="presentationtable" align="center">
            <tr>
                <td>ID</td>
                <td>Nazwa</td>
                <td>Kraj</td>
                <!--<td colspan="3">Operacje</td>-->
            </tr>
            <%
                for (Zespol zespol : storage.getAllZespols())
                {
                    out.println(
                    "<tr><td>" + zespol.getID() + "</td>" +
                    "<td>" + zespol.getNazwa() + "</td>" +
                    "<td>" + zespol.Kraj() + "</td>" +
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