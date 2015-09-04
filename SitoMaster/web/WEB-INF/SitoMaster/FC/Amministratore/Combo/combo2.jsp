<%-- 
    Document   : combo2
    Created on : 25-feb-2010, 17.15.38
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>

<sql:query var="asd" dataSource="${dataSrc}">
    SELECT usr,nome,cognome,country,compl FROM utenti WHERE adm=false ORDER BY country
</sql:query>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> per nazionalità</title>
    </head>
    <body>
        <center>
            <h2><font color="purple">ISCRITTI PER NAZIONALITA'</font></h2>
            <table border="1">
                <tr>
                    <th>Username</th>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Nazione</th>
                    <th>Iscrizione completata</th>
                </tr>

                <c:forEach var="xxx" items="${asd.rows}">

                    <c:if test="${xxx.compl=='true'}">
                        <c:set var="com" value="SI"/>
                    </c:if>
                    <c:if test="${xxx.compl=='false'}">
                        <c:set var="com" value="NO"/>
                    </c:if>

                     <tr>
                        <th><c:out value="${xxx.usr}"/></th>
                        <th><c:out value="${xxx.nome}"/></th>
                        <th><c:out value="${xxx.cognome}"/></th>
                        <th><c:out value="${xxx.country}"/></th>
                        <th><c:out value="${com}"/></th>
                    </tr>
                </c:forEach>
            </table>
            </center>
            <p>
            <a href="Excnaz.jsp">Estrazione del report in formato Excel</a>
            <p>
            <hr>
            <p>
            <form method="post" action="../welcome.jsp">
                <input type="submit" value="Torna al menu">
            </form>

    </body>
</html>
