<%-- 
    Document   : registrazione
    Created on : 8-feb-2010, 17.43.55
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>

<%-- continua è una variabile che mi indica se i valori che l'utente ha messo in
     ingresso sono esatti o no
      Se = 1 allora non ho riscontrato errori e visualizzo un'altra pagina
      Se = 0 ho riscontrato errori e visualizzo ancora questa pagina--%>
<% int continua = 1;%>
<%-- error è una lista che indica quali campi ho compilato in maniera errata --%>
<% String error = "<font color=red><b><ul>\n";%>

<%-- Se è la prima volta che entro non devo fare controlli dei parametri
     ma devo azzerare il valore di continua--%>
<c:if test="${(empty param.pulsante_premuto)}">
       <% continua = 0;%>
       </c:if>

<c:if test="${!(empty param.pulsante_premuto)}">
        <%--controllo che il campo user inserito dall'utente non sia già
        presente nel database--%>
    <sql:query var="tempo" dataSource="${dataSrc}">
        SELECT usr FROM utenti
    </sql:query>
    <c:forEach var="row" items="${tempo.rows}">
        <c:if test="${row.usr == param.usr}">
            <% error += "<font color=orange><li> Il nome utente inserito è già presente nel database.\n" +
                    "Inseriscine un'altro.\n</font>";%>
            <% continua = 0;%>
        </c:if>
    </c:forEach>

    <%-- Controllo che l'utente non abbia lasciato campi vuoti --%>
    <c:if test="${(empty param.usr)}">
        <% error += "<li> Inserisci un tuo nome utente d'identificazione.\n";%>
    </c:if>
    <c:if test="${(empty param.pwd)}">
        <% error += "<li> Inserisci una password per poter accedere al sito.\n";%>
    </c:if>
    <c:if test="${(empty param.nome)}">
        <% error += "<li> Inserisci il tuo nome.\n";%>
    </c:if>
    <c:if test="${(empty param.cognome)}">
        <% error += "<li> Inserisci il tuo cognome.\n";%>
    </c:if>
    <c:if test="${(empty param.mail)}">
        <% error += "<li> Inserisci la tua mail.\n";%>
    </c:if>

    <%-- Controllo generale dei campi vuoti per segnare l'errore--%>
    <c:if test="${(empty param.usr) or (empty param.pwd) or
                  (empty param.nome) or (empty param.cognome) or (empty param.mail)}">
        <% continua = 0;%>
    </c:if>

</c:if>

<%-- se non ci sono errori allora posso andare avanti --%>
<% if (continua == 1) {%>
<jsp:forward page="finereg.jsp">
    <jsp:param name="usr" value="${param.usr}"/>
    <jsp:param name="pwd" value="${param.pwd}"/>
    <jsp:param name="nome" value="${param.nome}"/>
    <jsp:param name="cognome" value="${param.cognome}"/>
    <jsp:param name="mail" value="${param.mail}"/>
</jsp:forward>
<%}%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script language=javascript>
            function continua()
            {document.getElementById("pulsante_premuto").value="OK";
            }
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrazione</title>
    </head>
    <body>
        <% error += "</ul></b></font>";%>
        <center>
            <h1><font color="green">PAGINA DIREGISTRAZIONE</font></h1>
            <p>

                <%-- Se non è la prima volta che sono entraato allora vuol dire
                che non ho compilato tutti i campi o ho fatto qualcosa di sbagliato
                allora visualizzo la mia stringa degli errori --%>
                <c:if test="${!(empty param.pulsante_premuto)}">
                    <%= error%>
                </c:if>
            <p>
            <form method="post" action="registrazione.jsp" name="registrazione">
                <%-- questo la visualizzo la prima volta con i campi vuoti --%>
                <c:if test="${(empty param.pulsante_premuto)}">
                    <table>
                        <tr><td>User: </td>
                            <td><INPUT type="text" name="usr" size="20"></td></tr>
                        <tr><td>Password: </td>
                            <td><INPUT type="password" name="pwd" size="20"></td></tr>
                        <tr><td>Nome: </td>
                            <td><INPUT type="text" name="nome" size="20"></td></tr>                                     </td></tr>
                        <tr><td>Cognome: </td>
                            <td><INPUT type="text" name="cognome" size="20"></td></tr>
                        <tr><td>E-mail: </td>
                            <td><INPUT type="text" name="mail" size="30"></td></tr>
                    </table>
                </c:if>
                <%-- praticamente la seconda volta visualizzo anche nelle mie lable 
                     i valori precedentemente inseriti dall'utente--%>
                <c:if test="${!(empty param.pulsante_premuto)}">
                    <table>
                        <tr><td>User: </td>
                            <td><INPUT type="text" name="usr" size="20" value="${param.usr}"></td></tr>
                        <tr><td>Password: </td>
                            <td><INPUT type="password" name="pwd" size="20" value="${param.pwd}"></td></tr>
                        <tr><td>Nome: </td>
                            <td><INPUT type="text" name="nome" size="20" value="${param.nome}"></td></tr>                                      </td></tr>
                        <tr><td>Cognome: </td>
                            <td><INPUT type="text" name="cognome" size="20" value="${param.cognome}"></td></tr>
                        <tr><td>E-mail: </td>
                            <td><INPUT type="text" name="mail" size="30" value="${param.mail}"></td></tr>
                    </table>
                </c:if>
                <p>
                    <INPUT type="submit" value="Accedi" onclick="continua()" >
                    <input type="hidden" id="pulsante_premuto" name="pulsante_premuto" value="aaaa">
            </form></center>
        <p>
            <form method="post" action="../index.jsp">
            <input type="submit" value="HOME PAGE">
        </form>
    </body>

</html>