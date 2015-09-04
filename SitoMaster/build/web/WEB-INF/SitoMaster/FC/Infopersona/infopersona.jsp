<%-- 
    Document   : infopersona
    Created on : 11-feb-2010, 18.34.39
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>

<sql:query var="q" dataSource="${dataSrc}">
    SELECT compl FROM utenti WHERE usr='${sessionScope.user}'
</sql:query>
<c:forEach var="row" items="${q.rows}">
    <c:set var="fine" value="${row.compl}"/>
</c:forEach>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informazioni Personali</title>
    </head>
    <body>
        <form method="post" action="/SitoMaster/logout.jsp">
            <input type="submit" value="ESCI">
        </form>
        <p>
        <center><h2>INFORMAZIONI PERSONALI</h2>
            <sql:query var="xxx" dataSource="${dataSrc}">
                SELECT * FROM utenti WHERE usr='<%=session.getAttribute("user")%>'
            </sql:query>
            <c:forEach var="asd" items="${xxx.rows}">
                <table>
                    <tr><td>Username: </td><td><c:out value="${asd.usr}"/></td></tr>
                    <tr><td>Password: </td><td><c:out value="${asd.pwd}"/></td></tr>
                    <tr><td>Nome: </td><td><c:out value="${asd.nome}"/></td></tr>
                    <tr><td>Cognome: </td><td><c:out value="${asd.cognome}"/></td></tr>
                    <tr><td>Luogo di nascita: </td><td><c:out value="${asd.luonasc}"/></td></tr>
                    <tr><td>Data di nascita: </td><td><c:out value="${asd.datanasc}"/></td></tr>
                    <tr><td>Nazione: </td><td><c:out value="${asd.country}"/></td></tr>
                    <tr><td>Indirizzo: </td><td><c:out value="${asd.address}"/></td></tr>
                    <tr><td>città: </td><td><c:out value="${asd.city}"/></td></tr>
                    <tr><td>CAP: </td><td><c:out value="${asd.cap}"/></td></tr>
                    <tr><td>Provincia: </td><td><c:out value="${asd.prov}"/></td></tr>
                    <tr><td>Documento d'identità </td><td><c:out value="${asd.doc}"/></td></tr>
                    <tr><td>N° documento </td><td><c:out value="${asd.numdoc}"/></td></tr>
                    <tr><td>Telefono: </td><td><c:out value="${asd.phone}"/></td></tr>
                    <tr><td>E-mail: </td><td><c:out value="${asd.pwd}"/></td></tr>
                </table>
            </c:forEach>
            <p>

                <c:if test="${fine==false}">
                <form method="post" action="modpersonap.jsp">
                    <input type="submit" value="MODIFICA I CAMPI">
                </form>
                <p>
                </c:if>
        </center>
        <hr>
        <p>
        <form method="post" action="../welcome.jsp">
            <input type="submit" value="TORNA ALLA PAGINA PRINCIPALE">
        </form>

    </body>
</html>
