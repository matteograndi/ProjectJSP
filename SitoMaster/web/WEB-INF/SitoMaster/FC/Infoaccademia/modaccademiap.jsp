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
            <center>
                <h2>Modifica dei dati di &nbsp;<c:out value="${asd.tipodiploma}"/></h2>
                <form method="post" action="modaccademia.jsp">
                    <table>
                        <tr><td>Titolo Accademico: </td><td>
                                <input type="text" value="<c:out value="${asd.tipodiploma}"/>" name="dip" size="40" readonly="readonly"></td></tr>

                        <tr><td>Data diploma: </td><td>
                                <INPUT type="text" name="annoc" size="2" value="<c:out value="${asd.annoc}"/>">anno
                                <INPUT type="text" name="mesec" size="1" value="<c:out value="${asd.mesec}"/>">mese
                                <INPUT type="text" name="giornoc" size="1" value="<c:out value="${asd.giornoc}"/>">giorno</td></tr>

                        <tr><td>Voto: </td><td>
                                voto<INPUT type="text" name="v" size="5" value="<c:out value="${asd.v}"/>">
                                totale<INPUT type="text" name="tot" size="5" value="<c:out value="${asd.tot}"/>"></td></tr>

                        <tr><td>Data di immatricolazione</td><td>
                                <INPUT type="text" name="annoi" size="2" value="<c:out value="${asd.annoi}"/>">anno
                                <INPUT type="text" name="mesei" size="1" value="<c:out value="${asd.mesei}"/>">mese
                                <INPUT type="text" name="giornoi" size="1" value="<c:out value="${asd.giornoi}"/>">giorno</td></tr>
                    </table>
                    <p>
                        <INPUT type="submit" value="CONFERMA LE MODIFICHE"  >
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