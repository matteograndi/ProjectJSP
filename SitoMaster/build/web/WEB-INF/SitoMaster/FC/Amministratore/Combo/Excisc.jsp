<%--
    Document   : Excisc
    Created on : 23-giu-2010, 11.51.49
    Author     : matteo grandi
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="EXCEL.Excel_iscr" %>
<%@page language="java" import="java.sql.*" %>

<%
Class.forName("org.hsqldb.jdbcDriver");

Connection dbconn = null;

dbconn = DriverManager.getConnection("jdbc:hsqldb:hsql://localhost/xdb","sa","");

Statement statement = dbconn.createStatement();

ResultSet iscritti = statement.executeQuery("SELECT id_utente,nome,cognome,compl FROM utenti WHERE adm=false");

Excel_iscr myexcel = new Excel_iscr();

int k;
int j=0;

while (iscritti.next()){

    k=0;
    j=j+1;

//ottiene il dato
    String id = iscritti.getString("id_utente");
    String nome = iscritti.getString("nome");
    String cogn = iscritti.getString("cognome");
    String iscri = iscritti.getString("compl");

    if(iscri.equalsIgnoreCase("false"))
        iscri="NO";
    if(iscri.equalsIgnoreCase("true"))
        iscri="SI";

    myexcel.scrivi_utenti(k,j,id,nome,cogn,iscri);

}

myexcel.chiudi();

dbconn.close();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creazione Iscritti.xls completata</title>
    </head>
    <body>
        <center><h3>Creazione del file <i>Iscritti.xls</i> completata</h3></center>
        <p>
        <hr>
        <p>
        <form method="post" action="controllacombo.jsp">
            <input type="hidden" name="combo" value="1">
            <input type="submit"value="INDIETRO">
        </form>
    </body>
</html>
