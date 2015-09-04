<%-- 
    Document   : appoggio
    Created on : 13-feb-2010, 18.04.46
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
    AND tipodiploma = '${param.premi}'
</sql:query>

    <sql:query var="qr" dataSource="${dataSrc}">
        SELECT compl FROM utenti WHERE usr = '${sessionScope.user}'
    </sql:query>
    <c:forEach var="row" items="${qr.rows}">
    <c:set var="fine" value="${row.compl}"/>
</c:forEach>

        <c:forEach var="asd" items="${xxx.rows}">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><c:out value="${asd.tipodiploma}"/></title>
    </head>
    <body>
        <h2><font color="magenta"><c:out value="${asd.tipodiploma}"/></font></h2>
        <p>
        <table>
            <tr><td>Data diploma: </td>
                <td><c:out value="${asd.datadiploma}"/></td></tr>
            <tr><td>Voto: </td>
                <td><c:out value="${asd.voto}"/></td></tr>
            <tr><td>Data di immatricolazione: </td>
                <td><c:out value="${asd.dataimma}"/></td></tr>
        </table>
        <p>
            <c:if test="${fine == false}">
            <form method="post" action="modaccademiap.jsp">
                <input type="hidden" value="<c:out value="${asd.tipodiploma}"/>" name="tipo">
                <input type="submit" value="Modifica">
            </form>
                <p>
            </c:if>
                <hr>
                <p>
                <form method="post" action="infoaccademia.jsp">
                    <input type="submit" value="INFORMAZIONI ACCADEMICHE">
                </form>

    </body>
</html>
        </c:forEach>