<%-- 
    Document   : inscurriculum
    Created on : 14-feb-2010, 18.07.08
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<sql:update var="qr" dataSource="${dataSrc}">
    UPDATE curricula
    SET qualifiche='${param.qua}', esperienze='${param.esp}',
    insegnamenti='${param.ins}', motivazioni='${param.mot}'
    WHERE utente='<%=session.getAttribute("user")%>'
</sql:update>

<sql:update var="qr1" dataSource="${dataSrc}">
    UPDATE utenti
    SET i_curri_com=true
    WHERE usr='<%=session.getAttribute("user")%>'
</sql:update>

<jsp:forward page="curriculum.jsp"/>