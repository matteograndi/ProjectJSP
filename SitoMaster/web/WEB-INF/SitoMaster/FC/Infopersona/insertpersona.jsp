<%-- 
    Document   : insertperso
    Created on : 13-feb-2010, 15.41.43
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<sql:update var="ris" dataSource="${dataSrc}">
    UPDATE utenti
    SET luonasc='${param.luonasc}',datanasc='${param.datanasc}',
    annon='${param.annon}',mesen='${param.mesen}',giornon='${param.giornon}',
    country='${param.country}',address='${param.address}',
    city='${param.city}',cap='${param.cap}',
    prov='${param.prov}',doc='${param.doc}',
    numdoc='${param.numdoc}',phone='${param.phone}',
    i_perso_com=true
    WHERE usr='<%=session.getAttribute("user")%>'
</sql:update>

    <jsp:forward page="infopersona.jsp"/>
