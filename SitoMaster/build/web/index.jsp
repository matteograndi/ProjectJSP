<%--
    Document   : index
    Created on : 1-feb-2010, 14.49.07
    Author     : matteo grandi
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>

<sql:query var="conteggio" dataSource="${dataSrc}">
    SELECT COUNT(*) AS conta FROM utenti WHERE compl=true
</sql:query>
<c:forEach var="row" items="${conteggio.rows}">
    <c:set var="ok" value="${row.conta}"/>
</c:forEach>

<%-- numero totale di posti disponibili --%>
<c:set var="posti" value="${15}" scope="page" />


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Master in Business Intelligence su Piattaforma Sap</title>
    </head>
    <body>
        <center><h1><font color="magenta">Master in Business Intelligence su Piattaforma Sap</font></h1>

            <p>
                Per ULTERIORI INFORMAZIONI clicca <a href="info.html">QUI</a>
            </p><p>
                n° totale di posti disponibili = <b><c:out value="${posti-ok}"/></b><br>
                n° totale di borse di studio offerte = <b><c:out value="${posti}"/></b><br>
                n° corrente di domande completate = <b><c:out value="${ok}"/></b>
            <p>
            <hr>
            <b>AUTENTICAZIONE</b>
            <p>

            <form method="post" action="controllologin.jsp">
                Username:&nbsp;<INPUT type="text" NAME="usr" size=30>&nbsp;&nbsp;&nbsp;
                Password:&nbsp;<INPUT type="password" NAME="pwd" size=30>
                <p>
                    <INPUT TYPE="submit" VALUE="Accedi">
            </form></center>
        <hr>
        <p>
            <font color="purple">Per REGISTRARTI clicca
                <a href="Registrazione/registrazione.jsp">QUI</a></font>

    </body>
</html>

