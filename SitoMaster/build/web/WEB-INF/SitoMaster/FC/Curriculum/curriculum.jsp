<%-- 
    Document   : newjspcurriculum
    Created on : 14-feb-2010, 17.37.48
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<sql:query var="qr" dataSource="${dataSrc}">
    SELECT compl FROM utenti WHERE usr='${sessionScope.user}'
</sql:query>
<c:forEach var="row" items="${qr.rows}">
    <c:set var="fine" value="${row.compl}"/>
</c:forEach>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CURRICULUM</title>
    </head>
    <body>
        <form method="post" action="/SitoMaster/logout.jsp">
            <input type="submit" value="ESCI">
        </form>
        <p>
        <center>
            <h1>CURRICULUM</h1>
            <sql:query var="xxx" dataSource="${dataSrc}">
                SELECT * FROM curricula WHERE utente ='<%=session.getAttribute("user")%>'
            </sql:query>
            <c:forEach var="asd" items="${xxx.rows}">

                Qualifiche: <p>
                    <textarea readonly cols="25" row="5"><c:out value="${asd.qualifiche}"/></textarea><p><p>
                    Esperienze: <p>
                    <textarea readonly cols="25" row="5"><c:out value="${asd.esperienze}"/></textarea><p><p>
                 Insegnamenti: <p>
                    <textarea readonly cols="25" row="5"><c:out value="${asd.insegnamenti}"/></textarea><p><p>
                Motivazioni: <p>
                    <textarea readonly cols="25" row="5"><c:out value="${asd.motivazioni}"/></textarea><p><p>

                </c:forEach>

                <c:if test="${fine == false}">
                <form method="post" action="modcurriculum.jsp">
                    <input type="submit" value="MODIFICA">
                </form>
            </c:if>
            <p>
        </center>
        <hr>
        <p>
        <form method="post" action="../welcome.jsp">
            <input type="submit" value="TORNA ALLA PAGINA PRINCIPALE">
        </form>

    </body>
</html>


<%--

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CURRICULUM</title>
    </head>
    <body>
        <center>
            <h1>CURRICULUM</h1>
            <sql:query var="xxx" dataSource="${dataSrc}">
                SELECT * FROM curricula WHERE utente ='<%=session.getAttribute("user")%>'
            </sql:query>
            <c:forEach var="asd" items="${xxx.rows}">
                <table>
                    <tr><td>Qualifiche: </td></tr>
                    <tr><td><input readonly=\"readonly\" value="${asd.qualifiche}"></td></tr>
                    <tr><td><textarea cols="27" rows="6" name="area" value="${asd.qualifiche}"></textarea>
                        </td></tr>
                    <c:if test="${fine == false}">
                <tr><td>
                        <form method="post" action="modcurriculum.jsp">
                    <input type="submit" value="MODIFICA"></td></tr>
                </form>
                    <tr><td>Esperienze: </td><td><c:out value="${asd.esperienze}"/></td></tr>
                    <tr><td>Insegnamenti: </td><td><c:out value="${asd.insegnamenti}"/></td></tr>
                    <tr><td>Motivazioni: </td><td><c:out value="${asd.motivazioni}"/></td></tr>
                </table>
            </c:forEach>

            <c:if test="${fine == false}">
                <form method="post" action="modcurriculum.jsp">
                    <input type="submit" value="MODIFICA">
                </form>
            </c:if>
            <p>
        </center>
        <hr>
        <p>
        <form method="post" action="../welcome.jsp">
            <input type="submit" value="TORNA ALLA PAGINA PRINCIPALE">
        </form>

    </body>
</html>

--%>