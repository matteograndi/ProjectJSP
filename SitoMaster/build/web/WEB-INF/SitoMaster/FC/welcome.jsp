<%--
    Document   : infopersona
    Created on : 11-feb-2010, 18.34.39
    Author     : matteo grandi
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>

<sql:query var="q" dataSource="${dataSrc}">
    SELECT compl FROM utenti WHERE usr='${sessionScope.user}'
</sql:query>
<c:forEach var="row" items="${q.rows}">
    <c:set var="completato" value="${row.compl}"/>
</c:forEach>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Benvenuto <%=session.getAttribute("user")%></title>
    </head>
    <body>
        <form method="post" action="/SitoMaster/logout.jsp">
            <input type="submit" value="ESCI">
        </form>
        <p>
        <center>
            <h1>Benvenuto <%=session.getAttribute("user")%></h1>
            <p>
                <c:if test="${completato == true}">
                    <b>LA TUA ISCRIZIONE E' STATA CHIUSA<br>
                        Puoi solo visualizzare i tuoi dati senza modificarli</b>
                <p>
                </c:if>
                <a href="/SitoMaster/FC/Infopersona/infopersona.jsp">INFORMAZIONI PERSONALI</a>
            <p>
                <a href="/SitoMaster/FC/Infoaccademia/infoaccademia.jsp">INFORMAZIONI ACCADEMICHE</a>
            <p>
                <a href="/SitoMaster/FC/Curriculum/curriculum.jsp">CURRICULUM</a>
            <p>
                <c:if test="${completato == false}">
                <a href="/SitoMaster/FC/Upload/upload.jsp">CARICA FILE CURRICULUM</a>
                                               <p>
                <hr>
                <a href="/SitoMaster/FC/Chiusura/chiusura.jsp">CHIUSURA ISCRIZIONE</a>
            </c:if>
        </center>
    </body>
</html>