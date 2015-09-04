<%-- 
    Document   : newinsacca
    Created on : 14-feb-2010, 16.21.34
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
driver="org.hsqldb.jdbcDriver" user="sa" password=""/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%--
<c:set var="id1" value="SELECT max(id_utente) FROM utenti"/>
<c:set var="id" value="SELECT MAX(id_info) FROM infoacca"/>
<c:set var="id" value="SELECT max(id_info) FROM infoacca"/>
--%>
<c:set var="id" value="SELECT max(id_info) FROM infoacca"/>

<sql:update var="qr" dataSource="${dataSrc}">
    INSERT INTO infoacca (id_info,utente,tipodiploma,datadiploma,annoc,mesec,giornoc,voto,v,tot,dataimma,annoi,mesei,giornoi)
    VALUES(${id}+1,'<%=session.getAttribute("user")%>','${param.tipo}','${param.data}',
          '${param.annoc}','${param.mesec}','${param.giornoc}',
          '${param.voto}',${param.v},${param.tot},'${param.imma}',
          '${param.annoi}','${param.mesei}','${param.giornoi}')
</sql:update>

<jsp:forward page="infoaccademia.jsp"/>

