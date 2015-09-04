<%-- 
    Document   : modperso
    Created on : 13-feb-2010, 15.26.27
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica informazioni personali</title>
    </head>
    <body>
        <center><h2><font color="magenta">MODIFICA INFORMAZIONI PERSONALI</font></h2>

        <sql:query var="xxx" dataSource="${dataSrc}">
            SELECT * FROM utenti WHERE usr = '<%= session.getAttribute("user") %>'
        </sql:query>
        <c:forEach var="asd" items="${xxx.rows}">
        <form method="post" action="modpersona.jsp">
            <table>
                <tr><td>Username: </td><td><c:out value="${asd.usr}"/></td></tr>
            <tr><td>Password: </td><td><c:out value="${asd.pwd}"/></td></tr>
            <tr><td>Nome: </td><td><c:out value="${asd.nome}"/></td></tr>
            <tr><td>Cognome: </td><td><c:out value="${asd.cognome}"/></td></tr>
            <tr><td>Luogo di nascita: </td><td><INPUT type="text" name="luonasc"
            value="<c:out value="${asd.luonasc}"/>"></td></tr>

            <%--
            <tr><td>Data di nascita: </td><td><INPUT type="text" name="datanasc"
            value="<c:out value="${asd.datanasc}"/>">&nbsp;(yyyy-mm-dd)</td></tr>
            --%>

            <tr><td>Data di nascita: </td><td>
                                <INPUT type="text" name="annon" size="2" value="<c:out value="${asd.annon}"/>">anno
                        <INPUT type="text" name="mesen" size="1" value="<c:out value="${asd.mesen}"/>">mese
                        <INPUT type="text" name="giornon" size="1" value="<c:out value="${asd.giornon}"/>">giorno</td></tr>

            



            <tr><td>Nazione: </td><td><INPUT type="text" name="country"
            value="<c:out value="${asd.country}"/>"></td></tr>
            <tr><td>Indirizzo: </td><td><INPUT type="text" name="address"
            value="<c:out value="${asd.address}"/>"></td></tr>
            <tr><td>Città: </td><td><INPUT type="text" name="city"
            value="<c:out value="${asd.city}"/>"></td></tr>
            <tr><td>CAP: </td><td><INPUT type="text" name="cap"
            value="<c:out value="${asd.cap}"/>"></td></tr>
            <tr><td>Provincia: </td><td><INPUT type="text" name="prov"
            value="<c:out value="${asd.prov}"/>"></td></tr>
            <tr><td>Documento d'identità: </td><td><INPUT type="text" name="doc"
            value="<c:out value="${asd.doc}"/>"></td></tr>
            <tr><td>N° documento: </td><td><INPUT type="text" name="numdoc"
            value="<c:out value="${asd.numdoc}"/>"></td></tr>
            <tr><td>Telefono: </td><td><INPUT type="text" name="phone"
            value="<c:out value="${asd.phone}"/>"></td></tr>
            <tr><td>E-mail: </td><td><c:out value="${asd.mail}"/></td></tr>
            </table>
            <p>
            <input type="submit" value="CONFERMA MODIFICHE">
        </form>
            </c:forEach>
    </center>
        <p>
        <form method="post" action="infopersona.jsp">
            <input type="submit" value="TORNA INDIETRO">
        </form>
    </body>
</html>
