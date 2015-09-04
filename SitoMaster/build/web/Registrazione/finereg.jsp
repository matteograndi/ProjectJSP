<%-- 
    Document   : finereg
    Created on : 2-feb-2010, 18.22.05
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="POSTA.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>


<c:set var="id" value="SELECT max(id_utente) FROM utenti"/>
<sql:update var="queryRes" dataSource="${dataSrc}">

    <%-- compl indica se l'utente ha confermato i dati di presentazione inseriti
         adm indica se l'utente è amministatore o no --%>
       INSERT INTO utenti(id_utente, usr,pwd, nome, cognome, mail,
                          i_perso_com, i_acca_com, i_curri_com, compl, adm)
    VALUES(${id}+1, '${param.usr}', '${param.pwd}', '${param.nome}',
    '${param.cognome}', '${param.mail}', false, false, false, false, false)
</sql:update>

<c:set var="idc" value="SELECT max(id_curricula) FROM curricula"/>
<sql:update var="queryRes" dataSource="${dataSrc}">
    INSERT INTO curricula(id_curricula, utente, qualifiche, esperienze,
    insegnamenti, motivazioni)
    VALUES(${idc}+1,'${param.usr}', '', '', '', '')
</sql:update>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fine registrazione</title>

    </head>
    <body>
        <center>
            <h2><font color="magenta">REGISTRAZIONE COMPLETATA</font></h2>

        <%
        String testo = "Benvenuto\n ora puoi inserire i dati sottostanti nel campo autenticazione dell'home page\n" +
                "per completare l'iscrizione al corso di Master.\n" +
                "Username: " + request.getParameter("usr") + "\n" +
                "Password: " + request.getParameter("pwd") + ".";
        String mittente="webMaster@gmail.com";
        String destinatario = request.getParameter("mail");
        
        try{
            new Mail(mittente, destinatario, testo);
            out.println("<font color=\"green\">Mail inviata correttamente a " +
                    destinatario+"\n</font>");
        } catch (Exception e) {
            out.println("Errore: " + e.toString());
        }            
        %>
        <p>
            <font color="blue">
            Ti è stata inviata una mail di avvenuta registrazione<br>
            contiene i dati necessari per poter accedere all'iscrizione del master
            </font></center>
        <p>
        <hr>
        <p>
        <form method="post" action="../index.jsp">
            <input type="submit" value="HOME PAGE">
        </form>
    </body>
</html>
