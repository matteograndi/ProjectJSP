<%-- 
    Document   : controllalogin
    Created on : 3-feb-2010, 17.17.43
    Author     : matteo grandi
--%>

<%@page language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%-- se campo utente o password vuoti --%>
<c:if test="${empty param.usr or empty param.pwd}">
    <jsp:forward page="errore.jsp">
        <jsp:param name="val" value="1"/>
    </jsp:forward>
</c:if>

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>

<sql:query var="righe" dataSource="${dataSrc}">
    SELECT usr,pwd,adm FROM utenti
</sql:query>

<c:forEach var="r" items="${righe.rows}">
    <c:if test="${r.usr==param.usr}">
        <c:if test="${r.pwd==param.pwd}">
            <% session.setAttribute("user",request.getParameter("usr"));%>
            <c:if test="${r.adm==true}">
<jsp:forward page="/FC/Amministratore/welcome.jsp"/>
            </c:if>
                <jsp:forward page="/FC/welcome.jsp"/>
        </c:if>
    </c:if>
</c:forEach>

    <%-- Non sono riuscito a trovare un utente con inseriti i valori passati parametro--%>
<jsp:forward page="errore.jsp">
    <jsp:param name="val" value="2"/>
</jsp:forward>



