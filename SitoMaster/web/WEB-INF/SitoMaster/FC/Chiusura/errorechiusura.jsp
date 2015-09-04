<%-- 
    Document   : errorechiusura
    Created on : 27-apr-2010, 11.58.49
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="ipc" value="${param.ipcc}"/>
<c:set var="iac" value="${param.iacc}"/>
<c:set var="icc" value="${param.iccc}"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
           <%-- <h1><font color="red">LA TUA REGISTRAZIO NE NON E' COMPLETATA</font></h1>
           --%>


           <table>  
               <tr><td><h3><font color="red">LA TUA REGISTRAZIO NE NON E' COMPLETATA</font></h3></td></tr>
<tr><td>
               <font color=blue><b><ul>
               <c:if test="${ipc == false}">
                   <li>Devi compilare la pagina riguardante le tue informazioni personali<p>
               </c:if>
                   <c:if test="${iac == false}">
                   <li>Devi compilare la pagina riguardante le tue informazioni accademiche<p>
               </c:if>
                   <c:if test="${param.iccc == false}">
                   <li>Devi compilare la pagina riguardante la tua parte curriculum<p>
               </c:if>
                       </ul></b></font>
        </td></tr>
         </table>
                   <p>
                   <p>
                       
        <form method="post" action="../welcome.jsp">
                <input type="submit" value="TORNA AL MENU">
        </form>
            </center>
    </body>
</html>
