<%-- 
    Document   : controllacombo
    Created on : 25-feb-2010, 17.12.10
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<c:if test="${param.combo==1}">
    <jsp:forward page="combo1.jsp"/>
</c:if>

<c:if test="${param.combo==2}">
    <jsp:forward page="combo2.jsp"/>
</c:if>


