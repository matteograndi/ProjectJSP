<%-- 
    Document   : insertacca
    Created on : 13-feb-2010, 18.33.09
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>

<sql:update var="qr" dataSource="${dataSrc}">
    UPDATE infoacca
    SET tipodiploma='${param.tipo}',datadiploma='${param.data}',
    annoc='${param.annoc}',mesec='${param.mesec}',giornoc='${param.giornoc}',
    voto='${param.voto}',v=${param.v},tot=${param.tot},dataimma='${param.imma}',
    annoi='${param.annoi}',mesei='${param.mesei}',giornoi='${param.giornoi}'
    WHERE tipodiploma='${param.dip}'
</sql:update>

<sql:update var="qr1" dataSource="${dataSrc}">
    UPDATE utenti
    SET i_acca_com=true
    WHERE usr='<%=session.getAttribute("user")%>'
</sql:update>

<jsp:forward page="appoggio.jsp">
    <jsp:param name="premi" value="${param.dip}"/>
</jsp:forward>