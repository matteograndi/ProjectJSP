<%--
    Document   : modperso
    Created on : 13-feb-2010, 15.26.27
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="USODATA.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%-- continua è una variabile che mi indica se i valori che l'utente ha messo in
     ingresso sono esatti o no
      Se = 1 allora non ho riscontrato errori e visualizzo un'altra pagina
      Se = 0 ho riscontrato errori e visualizzo ancora questa pagina--%>
<c:set var="cont" value="${1}"/>

<%-- error è una lista che indica quali campi ho compilato in maniera errata --%>
<% String error = "<font color=red><b><ul>\n";%>

<%-- Controllo che l'utente non abbia lasciato campi vuoti --%>
<c:if test="${(empty param.luonasc)}">
    <% error += "<li> Inserisci il tuo luogo di nascita.\n";%>
</c:if>
<%-- Controllo opportuno per la data --%>
<%
        Usodata u = new Usodata();
        String a=request.getParameter("annon");
        String m=request.getParameter("mesen");
        String g=request.getParameter("giornon");
        String e = u.ErrorNascita(a,m,g);

if(e!=""){%>
    <c:set var="cont" value="${0}"/>
  <%}
        error += e;
%>

<%--
<c:if test="${(empty param.datanasc)}">
    <% error += "<li> Inserisci la tua data di nascita.\n";%>
</c:if>
--%>

<c:if test="${(empty param.country)}">
    <% error += "<li> Inserisci la tua nazionalità.\n";%>
</c:if>
<c:if test="${(empty param.address)}">
    <% error += "<li> Inserisci il tuo indirizzo.\n";%>
</c:if>
<c:if test="${(empty param.city)}">
    <% error += "<li> Inserisci la tua città.\n";%>
</c:if>
<c:if test="${(empty param.cap)}">
    <% error += "<li> Inserisci un tuo CAP.\n";%>
</c:if>
<c:if test="${(empty param.prov)}">
    <% error += "<li> Inserisci la tua provincia.\n";%>
</c:if>
<c:if test="${(empty param.doc)}">
    <% error += "<li> Inserisci il nome del tuo documento???.\n";%>
</c:if>
<c:if test="${(empty param.numdoc)}">
    <% error += "<li> Inserisci il codice del tuo documento.\n";%>
</c:if>
<c:if test="${(empty param.phone)}">
    <% error += "<li> Inserisci un tuo numero telefonico.\n";%>
</c:if>

<%-- Controllo generale dei campi vuoti per segnare l'errore--%>
<c:if test="${(empty param.luonasc) or (empty param.country) or
              (empty param.address) or (empty param.city) or
              (empty param.cap) or (empty param.prov) or
              (empty param.doc) or (empty param.numdoc) or
              (empty param.phone)}">
    
    <c:set var="cont" value="${0}"/>
</c:if>


<c:if test="${cont == 1}">
<%-- se non ci sono errori allora posso andare avanti --%>
    <jsp:forward page="insertpersona.jsp">
    <jsp:param name="luonasc" value="${param.luonasc}"/>
    
    <jsp:param name="datanasc" value="${param.annon}-${param.mesen}-${param.giornon}"/>

    <jsp:param name="annon" value="${param.annon}"/>
    <jsp:param name="mesen" value="${param.mesen}"/>
    <jsp:param name="giornon" value="${param.giornon}"/>
    <jsp:param name="country" value="${param.country}"/>
    <jsp:param name="address" value="${param.address}"/>
    <jsp:param name="city" value="${param.city}"/>
    <jsp:param name="cap" value="${param.cap}"/>
    <jsp:param name="prov" value="${param.doc}"/>
    <jsp:param name="doc" value="${param.city}"/>
    <jsp:param name="numdoc" value="${param.numdoc}"/>
    <jsp:param name="phone" value="${param.phone}"/>
</jsp:forward>

</c:if>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifica informazioni personali</title>
    </head>
    <body>
        <center>
            <% error += "</ul></b></font>";%>

            <h2><font color="magenta">MODIFICA INFORMAZIONI PERSONALI</font></h2>
            <p>
                <%=error%>
            <p>
                <sql:query var="xxx" dataSource="${dataSrc}">
                    SELECT * FROM utenti WHERE usr = '<%= session.getAttribute("user")%>'
                </sql:query>
                <c:forEach var="asd" items="${xxx.rows}">
                <form method="post" action="modpersona.jsp">
                    <table>
                        <tr><td>Username: </td><td><c:out value="${asd.usr}"/></td></tr>
                        <tr><td>Password: </td><td><c:out value="${asd.pwd}"/></td></tr>
                        <tr><td>Nome: </td><td><c:out value="${asd.nome}"/></td></tr>
                        <tr><td>Cognome: </td><td><c:out value="${asd.cognome}"/></td></tr>
                        <tr><td>Luogo di nascita: </td><td><INPUT type="text" name="luonasc"
                                                                  value="<c:out value="${param.luonasc}"/>"></td></tr>

                        <tr><td>Data di nascita: </td><td>
                                <INPUT type="text" name="annon" size="2" value="<c:out value="${param.annon}"/>">anno
                        <INPUT type="text" name="mesen" size="1" value="<c:out value="${param.mesen}"/>">mese
                        <INPUT type="text" name="giornon" size="1" value="<c:out value="${param.giornon}"/>">giorno</td></tr>

                        <tr><td>Nazione: </td><td><INPUT type="text" name="country"
                                                         value="<c:out value="${param.country}"/>"></td></tr>
                        <tr><td>Indirizzo: </td><td><INPUT type="text" name="address"
                                                           value="<c:out value="${param.address}"/>"></td></tr>
                        <tr><td>Città: </td><td><INPUT type="text" name="city"
                                                       value="<c:out value="${param.city}"/>"></td></tr>
                        <tr><td>CAP: </td><td><INPUT type="text" name="cap"
                                                     value="<c:out value="${param.cap}"/>"></td></tr>
                        <tr><td>Provincia: </td><td><INPUT type="text" name="prov"
                                                           value="<c:out value="${param.prov}"/>"></td></tr>
                        <tr><td>Documento d'identità: </td><td><INPUT type="text" name="doc"
                                                                      value="<c:out value="${param.doc}"/>"></td></tr>
                        <tr><td>N° documento: </td><td><INPUT type="text" name="numdoc"
                                                              value="<c:out value="${param.numdoc}"/>"></td></tr>
                        <tr><td>Telefono: </td><td><INPUT type="text" name="phone"
                                                          value="<c:out value="${param.phone}"/>"></td></tr>
                        <tr><td>E-mail: </td><td><c:out value="${asd.mail}"/></td></tr>
                    </table>
                    <p>
                        <input type="submit" value="CONFERMA MODIFICHE">
                </form>
                </c:forEach>
        </center>
        <p>
        <form method="post" action="infopersona.jsp">
            <input type="submit" value="TORNA INDIETRO">
        </form>
    </body>
</html>