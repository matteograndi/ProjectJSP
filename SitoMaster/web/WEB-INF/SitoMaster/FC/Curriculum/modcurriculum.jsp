<%-- 
    Document   : modcurriculum
    Created on : 14-feb-2010, 17.57.06
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

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

<%-- Se è la prima volta che entro non devo fare controlli dei parametri
     ma devo azzerare il valore di continua--%>
<c:if test="${(empty param.pulsante_premuto)}">
    <c:set var="cont" value="${0}"/>
</c:if>

<c:if test="${!(empty param.pulsante_premuto)}">
    <%-- Controllo che l'utente non abbia lasciato campi vuoti --%>
    <c:if test="${(empty param.qua)}">
        <% error += "<li> Inserisci una piccola descrizione sulle tue qualifiche.\n";%>
    </c:if>
    <c:if test="${(empty param.esp)}">
        <% error += "<li> Inserisci una piccola descrizione sulle tue esperianze lavorativa.\n";%>
    </c:if>
    <c:if test="${(empty param.ins)}">
        <% error += "<li> Inserisci una piccola descrizione sui tuoi insegnamenti svolti.\n";%>
    </c:if>
    <c:if test="${(empty param.mot)}">
        <% error += "<li> Inserisci Inserisci una piccola descrizione tue motivazioni.\n";%>
    </c:if>

    <%-- Controllo generale dei campi vuoti per segnare l'errore--%>
    <c:if test="${(empty param.qua) or (empty param.esp) or
                  (empty param.ins) or (empty param.mot)}">
        <c:set var="cont" value="${0}"/>
    </c:if>
</c:if>

<c:if test="${cont == 1}">
    <jsp:forward page="inscurriculum.jsp">
        <jsp:param name="qua" value="${param.qua}"/>
        <jsp:param name="esp" value="${param.esp}"/>
        <jsp:param name="ins" value="${param.ins}"/>
        <jsp:param name="mot" value="${param.mot}"/>
    </jsp:forward>
</c:if>

<html>
    <head>
        <script language=javascript>
            function continua()
            {document.getElementById("pulsante_premuto").value="OK";
            }
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFICA INFORMAZIONI PERSONALI</title>
    </head>
    <body>
        <% error += "</ul></b></font>";%>
        <center>
            <h2><font color="green">MODIFICA INFORMAZIONI PERSONALI</font></h2>
            <c:if test="${!(empty param.pulsante_premuto)}">
                    <%= error%>
                </c:if>
            <p>
                <sql:query var="xxx" dataSource="${dataSrc}">
                    SELECT * FROM curricula WHERE utente ='<%=session.getAttribute("user")%>'
                </sql:query>
                <c:forEach var="asd" items="${xxx.rows}">
                <form method="post" action="modcurriculum.jsp">
                    <%-- Questo la visualizzo la prima volta con i campi che contengono i valori che sono
                         stati salvati nel mio database --%>
                <c:if test="${(empty param.pulsante_premuto)}">
                    Qualifiche: <p>
                        <textarea name="qua" cols="25" row="5"><c:out value="${asd.qualifiche}"/></textarea><p><p>
                        Esperienze: <p>
                        <textarea name="esp" cols="25" row="5"><c:out value="${asd.esperienze}"/></textarea><p><p>
                        Insegnamenti: <p>
                        <textarea name="ins" cols="25" row="5"><c:out value="${asd.insegnamenti}"/></textarea><p><p>
                        Motivazioni: <p>
                        <textarea name="mot" cols="25" row="5"><c:out value="${asd.motivazioni}"/></textarea><p><p>
                    </c:if>
                        <%-- praticamente la seconda volta visualizzo anche nelle mie lable
                     i valori precedentemente inseriti dall'utente--%>
                <c:if test="${!(empty param.pulsante_premuto)}">
                    Qualifiche: <p>
                        <textarea name="qua" cols="25" row="5"><c:out value="${param.qua}"/></textarea><p><p>
                        Esperienze: <p>
                        <textarea name="esp" cols="25" row="5"><c:out value="${param.esp}"/></textarea><p><p>
                        Insegnamenti: <p>
                        <textarea name="ins" cols="25" row="5"><c:out value="${param.ins}"/></textarea><p><p>
                        Motivazioni: <p>
                        <textarea name="mot" cols="25" row="5"><c:out value="${param.mot}"/></textarea><p><p>
                </c:if>
                <p>
                        
                        <INPUT type="submit" value="CONFERMA" onclick="continua()" >
                    <input type="hidden" id="pulsante_premuto" name="pulsante_premuto" value="aaaa">
                </form>
            </c:forEach>
        </center>
        <hr>
        <p>
        <form method="post" action="curriculum.jsp">
            <input type="submit" value="TORNA INDIETRO">
        </form>
    </body>
</html>
