<%--
    Document   : Excnaz
    Created on : 23-giu-2010, 11.51.12
    Author     : matteo grandi
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="EXCEL.Excel_naz" %>
<%@page language="java" import="java.sql.*" %>

<%
   Class.forName("org.hsqldb.jdbcDriver");

Connection dbconn = null;

dbconn = DriverManager.getConnection("jdbc:hsqldb:hsql://localhost/xdb","sa","");

Statement statement = dbconn.createStatement();

ResultSet naz = statement.executeQuery("SELECT nome,cognome,country,compl FROM utenti WHERE adm=false ORDER BY country");

Excel_naz excel_naz = new Excel_naz();

int k;
int j=0;

while (naz.next()){

    k=0;
    j=j+1;

//ottiene il dato
 String nome = naz.getString("nome");
 String cogn = naz.getString("cognome");
 String nazione = naz.getString("country");
 String comple = naz.getString("compl");

 if(comple.equalsIgnoreCase("false"))
        comple="NO";
    if(comple.equalsIgnoreCase("true"))
        comple="SI";

excel_naz.scrivi_nazione(k,j,nome,cogn,nazione,comple);

}

excel_naz.chiudi_naz();

dbconn.close();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creazione Iscritti per nazione.xls completata</title>
    </head>
    <body>
        <center><h3>Creazione del file <i>Iscritti per nazione.xls</i> completata</h3></center>
        <p>
        <hr>
        <p>
        <form method="post" action="controllacombo.jsp">
            <input type="hidden" name="combo" value="2">
            <input type="submit"value="INDIETRO">
        </form>
    </body>
</html>