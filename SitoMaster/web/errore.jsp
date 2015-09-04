<%-- 
    Document   : errore
    Created on : 4-feb-2010, 17.03.21
    Author     : matteo grandi
--%>

<%--
    Document   : errore
    Created on : 2-feb-2010, 17.45.33
    Author     : matteo grandi
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${param.val == null}">
    <jsp:forward page="index.jsp"/>
</c:if>

<c:if test="${param.val==1}">
    <html>
        <head>
            <title>Errore</title>

        </head>
        <body>
            <h3>Campo user o password vuoti</h3>
            <p>
                <c:out value="${param.val}"/>
            <form method="post" action="index.jsp">
                <input type="submit" value="PROSEGUI">
            </form>
        </body>
    </html>
</c:if>


<c:if test="${param.val==2}">
    <html>
        <head>
            <title>Errore</title>
        </head>
        <body>
            <h3>Utente non presente nel database</h3>
            <p>
            <form method="post" action="index.jsp">
                <input type="submit" value="PROSEGUI">
            </form>
        </body>
    </html>
</c:if>