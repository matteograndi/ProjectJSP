<%-- 
    Document   : modacca
    Created on : 13-feb-2010, 18.41.19
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


<%--controllo che il campo user inserito dall'utente non sia già
    presente nel database--%>
<c:if test="${(empty param.tipo)}">
    <% error += "<li> Devi specificare un titolo al tuo diploma.\n";%>
    <c:set var="cont" value="${0}"/>
</c:if>
<%-- Controllo opportuno per la data --%>
<%
        Usodata u = new Usodata();
        String a = request.getParameter("annoc");
        String m = request.getParameter("mesec");
        String g = request.getParameter("giornoc");
        String e = u.ErrorConseguimento(a, m, g);

        if (e != "") {%>
<c:set var="cont" value="${0}"/>
<%}
        error += e;
%>

<%--
<c:if test="${(empty param.datanasc)}">
    <% error += "<li> Inserisci la tua data di nascita.\n";%>
</c:if>
--%>

<%-- Controllo opportuno per i campi del voto --%>
<%
        String v = request.getParameter("v");
        String tot = request.getParameter("tot");
        e = u.ErrorVotazione(v, tot);

        if (e != "") {%>
<c:set var="cont" value="${0}"/>
<%}
        error += e;
%>


<%-- Controllo opportuno per la data di immatricolazione --%>
<%
        a = request.getParameter("annoi");
        m = request.getParameter("mesei");
        g = request.getParameter("giornoi");
        e = u.ErrorConseguimento(a, m, g);

        if (e != "") {%>
<c:set var="cont" value="${0}"/>
<%}
        error += e;
%>




<c:if test="${cont == 1}">
    <%-- se non ci sono errori allora posso andare avanti --%>
    <jsp:forward page="faimodaccademia.jsp">
        <jsp:param name="tipo" value="${param.tipo}"/>

        <jsp:param name="data" value="${param.annoc}-${param.mesec}-${param.giornoc}"/>

        <jsp:param name="annoc" value="${param.annoc}"/>
        <jsp:param name="mesec" value="${param.mesec}"/>
        <jsp:param name="giornoc" value="${param.giornoc}"/>
        <jsp:param name="voto" value="${param.v}/${param.tot}"/>
        <jsp:param name="v" value="${param.v}"/>
        <jsp:param name="tot" value="${param.tot}"/>

        <jsp:param name="imma" value="${param.annoi}-${param.mesei}-${param.giornoi}"/>

        <jsp:param name="annoi" value="${param.annoi}"/>
        <jsp:param name="mesei" value="${param.mesei}"/>
        <jsp:param name="giornoi" value="${param.giornoi}"/>
    </jsp:forward>
</c:if>









<sql:query var="xxx" dataSource="${dataSrc}">
    SELECT * FROM infoacca WHERE utente = '<%=session.getAttribute("user")%>'
    AND tipodiploma = '${param.tipo}'
</sql:query>





<c:forEach var="asd" items="${xxx.rows}">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Modifica dei dati di &nbsp;<c:out value="${asd.tipodiploma}"/></title>
        </head>
        <body>
            <% error += "</ul></b></font>";%>
            <center>
                <h2>Modifica dei dati di &nbsp;<c:out value="${asd.tipodiploma}"/></h2>
                <p>
                <%-- visualizzo la mia stringa degli errori --%>

                    <%= error%>
                <p>
                <form method="post" action="modaccademia.jsp">
                    <table>
                        <tr><td>Titolo Accademico: </td><td>
                                <input type="text" value="<c:out value="${asd.tipodiploma}"/>" name="dip" size="40" readonly="readonly"></td></tr>

                        <tr><td>Data diploma: </td><td>
                                <INPUT type="text" name="annoc" size="2" value="<c:out value="${param.annoc}"/>">anno
                                <INPUT type="text" name="mesec" size="1" value="<c:out value="${param.mesec}"/>">mese
                                <INPUT type="text" name="giornoc" size="1" value="<c:out value="${param.giornoc}"/>">giorno</td></tr>

                        <tr><td>Voto: </td><td>
                            voto<INPUT type="text" name="v" size="2" value="<c:out value="${param.v}"/>">
                            totale<INPUT type="text" name="tot" size="2" value="<c:out value="${param.tot}"/>"></td></tr>

                        <tr><td>Data di immatricolazione</td><td>
                                <INPUT type="text" name="annoi" size="2" value="<c:out value="${param.annoi}"/>">anno
                                <INPUT type="text" name="mesei" size="1" value="<c:out value="${param.mesei}"/>">mese
                                <INPUT type="text" name="giornoi" size="1" value="<c:out value="${param.giornoi}"/>">giorno</td></tr>
                    </table>
                    <p>
                        <INPUT type="submit" value="CONFERMA LE MODIFICHE">
                        <input type="hidden" value="<c:out value="${asd.tipodiploma}"/>" name="tipo">
                </form>
            </center>
                <hr>
        <p>
        <form method="post" action="infoaccademia.jsp">
            <input type="submit" value="TORNA INDIETRO">
        </form>
        </body>
    </html>
</c:forEach>