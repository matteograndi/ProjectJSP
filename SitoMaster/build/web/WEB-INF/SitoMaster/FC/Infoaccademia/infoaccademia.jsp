<%-- 
    Document   : infoacademia
    Created on : 13-feb-2010, 17.28.50
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>

<sql:query var="xxx" dataSource="${dataSrc}">
    SELECT * FROM infoacca WHERE utente = '<%=session.getAttribute("user")%>'
</sql:query>

<sql:query var="qr" dataSource="${dataSrc}">
    SELECT compl FROM utenti WHERE usr = '${sessionScope.user}'
</sql:query>
<c:forEach var="row" items="${qr.rows}">
    <c:set var="fine" value="${row.compl}"/>
</c:forEach>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INFORMAZIONI ACCADEMICHE</title>
    </head>
    <body>
        <form method="post" action="/SitoMaster/logout.jsp">
            <input type="submit" value="ESCI">
        </form>
        <p>
        <center>
        <h2>INFORMAZIONI ACCADEMICHE</h2>
        <c:forEach var="asd" items="${xxx.rows}">
            <form method="post" action="appoggio.jsp">
                <input type="text" readonly="readonly" name="premi" size="40" value="<c:out value="${asd.tipodiploma}"/>">
                <input type="submit" value="PARTICOLARI">
            </form>
        </c:forEach>
        <c:if test="${fine==false}">
            <p>
            <form method="post" action="newaccademia.jsp">
                <input type="submit" value="AGGIUNGI INFORMAZIONE ACCADEMICA O TITOLO">
             </form>
        </c:if>
        </center>
        <p>
        <hr>
        <p>
        <form method="post" action="../welcome.jsp">
            <input type="submit" value="TORNA ALLA PAGINA PRINCIPALE">
        </form>
    </body>
</html>
