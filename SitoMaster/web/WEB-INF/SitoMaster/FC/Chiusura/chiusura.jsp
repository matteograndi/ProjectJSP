<%-- 
    Document   : chiusura
    Created on : 15-feb-2010, 11.03.54
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<% String error = "<font color=red><b><ul>\n";%>

<sql:query var="controllo" dataSource="${dataSrc}">
    SELECT i_perso_com,i_acca_com,i_curri_com FROM utenti WHERE usr='<%=session.getAttribute("user")%>'
</sql:query>

<c:forEach var="row" items="${controllo.rows}">
    <c:set var="ipc" value="${row.i_perso_com}"/>
    <c:set var="iac" value="${row.i_acca_com}"/>
    <c:set var="icc" value="${row.i_curri_com}"/>
</c:forEach>

<c:if test="${(ipc == false) or (iac == false) or (icc == false)}">

   <%--
    <c:if test="${ipc == false}">
        <% error += "<li> info perso";%>
    </c:if>
    <c:if test="${iac == false}">
        <% error += "<li> info acca";%>
    </c:if>
    <c:if test="${icc == false}">
<% error +="<li> curri"; %>
    </c:if>

   <jsp:param name="val" value="4"/>


    <jsp:forward page="errore.jsp">
        <jsp:param name="val" value="1"/>
        <jsp:param name="annon" value="${param.annon}"/>
    </jsp:forward>


 --%>
  <jsp:forward page="errorechiusura.jsp">
      <jsp:param name="ipcc" value="${ipc}"/>
      <jsp:param name="iacc" value="${iac}"/>
      <jsp:param name="iccc" value="${icc}"/>
  </jsp:forward>
  
  <%--
   <c:out value="${iac}"/>
   <c:out value="${ipc}"/>
    
  




    devi andare sulla pagina di errore e fare i controlli di quali sono falsi
    <% error += "<li> NOOOOOOOOOOOOOOOOOOOOOOO.\n";%>
    --%>
</c:if>


<sql:query var="utente" dataSource="${dataSrc}">
    SELECT * FROM utenti WHERE usr='<%=session.getAttribute("user")%>'
</sql:query>
<sql:query var="informazioni" dataSource="${dataSrc}">
    SELECT * FROM infoacca WHERE utente='<%=session.getAttribute("user")%>'
</sql:query>
<sql:query var="curriculum" dataSource="${dataSrc}">
    SELECT * FROM curricula WHERE utente='<%=session.getAttribute("user")%>'
</sql:query>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CHIUSURA ISCRIZIONE</title>
    </head>
    <body>
        <center>
            <h1><font color="red">CHIUSURA ISCRIZIONE</font></h1>

            <% error += "</ul></b></font>";%>
            <%=error%>

            <h2><font color="purple">INFORMAZIONI PERSONALI</font></h2>
            <c:forEach var="asd" items="${utente.rows}">
                <table>
                    <tr><td>Username: </td><td><c:out value="${asd.usr}"/></td></tr>
                    <tr><td>Password: </td><td><c:out value="${asd.pwd}"/></td></tr>
                    <tr><td>Nome: </td><td><c:out value="${asd.nome}"/></td></tr>
                    <tr><td>Cognome: </td><td><c:out value="${asd.cognome}"/></td></tr>
                    <tr><td>Luogo di nascita: </td><td><c:out value="${asd.luonasc}"/></td></tr>
                    <tr><td>Data di nascita: </td><td><c:out value="${asd.datanasc}"/></td></tr>
                    <tr><td>Nazione: </td><td><c:out value="${asd.country}"/></td></tr>
                    <tr><td>Indirizzo: </td><td><c:out value="${asd.address}"/></td></tr>
                    <tr><td>Città: </td><td><c:out value="${asd.city}"/></td></tr>
                    <tr><td>CAP: </td><td><c:out value="${asd.cap}"/></td></tr>
                    <tr><td>Provincia: </td><td><c:out value="${asd.prov}"/></td></tr>
                    <tr><td>Documento: </td><td><c:out value="${asd.doc}"/></td></tr>
                    <tr><td>N° documento: </td><td><c:out value="${asd.numdoc}"/></td></tr>
                    <tr><td>Telefono: </td><td><c:out value="${asd.phone}"/></td></tr>
                    <tr><td>E-mail: </td><td><c:out value="${asd.mail}"/></td></tr>
                </table>
            </c:forEach>
            <p>
            <p>
            <h2><font color="purple">CURRICULUM</font></h2>
            <c:forEach var="asd" items="${curriculum.rows}">
                <table>
                    <tr><td>Qulifiche: </td><td><c:out value="${asd.qualifiche}"/></td></tr>
                    <tr><td>Esperienze: </td><td><c:out value="${asd.esperienze}"/></td></tr>
                    <tr><td>Insegnamenti: </td><td><c:out value="${asd.insegnamenti}"/></td></tr>
                    <tr><td>Motivazioni: </td><td><c:out value="${asd.motivazioni}"/></td></tr>
                </table>
            </c:forEach>
            <p>
            <p>
            <h2><font color="purple">INFORMAZIONI ACCADEMICHE</font></h2>
            <c:forEach var="asd" items="${informazioni.rows}">
                <table>
                    <tr><td></td><td><h3><font color="orange"><c:out value="${asd.tipodiploma}"/></font></h3></td></tr>
                    <tr><td>Data diploma: </td><td><c:out value="${asd.datadiploma}"/></td></tr>
                    <tr><td>Voto: </td><td><c:out value="${asd.voto}"/></td></tr>
                    <tr><td>Data diimmatricolazione: </td><td><c:out value="${asd.dataimma}"/></td></tr>
                </table>
            </c:forEach>
            <p>
            <hr>
            <p>
            <h3><font color="red"><b>Attenzione</b></font></h3>
            <p>

                <i><font color="blue">Se si prosegue non si potranno più modificare i propri dati di iscrizione</font></i>
            <p>
            <p>
                Se vuoi stampare i tuoi dati su PDF clicca<a href="pdf.jsp">QUI</a>
            <p>
            <form method="post" action="fine.jsp">
                <input type="submit" value="CHIUDI ISCRIZIONE">
            </form>
            <p>
            <hr>
            <p>
            <form method="post" action="../welcome.jsp">
                <input type="submit" value="TORNA INDIETRO">
            </form>
        </center>
    </body>
</html>
