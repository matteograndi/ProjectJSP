<%-- 
    Document   : welcome
    Created on : 25-feb-2010, 16.43.17
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Benvenuto <%=session.getAttribute("user")%></title>
    </head>
    <body>
        <form method="post" action="/SitoMaster/logout.jsp">
            <input type="submit" value="ESCI">
        </form>
        <p>
        <center>
            <h1><font color="red">Benvenuto amministatore <%=session.getAttribute("user")%></font></h1>
            <p>
            <form method="post" action="/SitoMaster/FC/Amministratore/Combo/controllacombo.jsp">
                <b>Visualizzazione report</b>&nbsp;<select name="combo">
                    <option value="1" selected>Lista iscritti totali</option>
                    <option value="2">Lista iscritti per nazionalità</option>
                </select>
                <p>
                    <input type="submit" value="VISUALIZZA">
            </form>
        </center>
    </body>
</html>
