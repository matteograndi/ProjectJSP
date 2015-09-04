<%-- 
    Document   : pdf
    Created on : 15-feb-2010, 11.36.12
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="PDF.*"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
Class.forName("org.hsqldb.jdbcDriver");
Connection conn = null;

conn = DriverManager.getConnection("jdbc:hsqldb:hsql://localhost/xdb","sa","");
Statement st=conn.createStatement();

ResultSet RScons = st.executeQuery("SELECT utenti.usr,utenti.pwd,utenti.nome," +
        "utenti.cognome,utenti.luonasc,utenti.datanasc,utenti.country,utenti.address," +
        "utenti.city,utenti.cap,utenti.prov,utenti.doc,utenti.numdoc,utenti.phone," +
        "utenti.mail,curricula.qualifiche,curricula.esperienze,curricula.insegnamenti," +
        "curricula.motivazioni FROM utenti,curricula WHERE usr = '" +session.getAttribute("user")+"'");

ResultSet RScons1 = st.executeQuery("SELECT tipodiploma,datadiploma,voto,dataimma " +
        "FROM infoacca WHERE utente = '" + session.getAttribute("user") + "'");

while (RScons.next()){  //estraggo i dati
    String usr = RScons.getString("usr");
    String pwd = RScons.getString("pwd");
    String nome = RScons.getString("nome");
    String cognome = RScons.getString("cognome");
    String luonasc = RScons.getString("luonasc");
    String datanasc = RScons.getString("datanasc");
    String country = RScons.getString("country");
    String address = RScons.getString("address");
    String city = RScons.getString("city");
    String cap = RScons.getString("cap");
    String prov = RScons.getString("prov");
    String doc = RScons.getString("doc");
    String numdoc = RScons.getString("numdoc");
    String phone = RScons.getString("phone");
    String mail = RScons.getString("mail");
    String qualifiche = RScons.getString("qualifiche");
    String esperienze = RScons.getString("esperienze");
    String insegnamenti = RScons.getString("insegnamenti");
    String motivazioni = RScons.getString("motivazioni");

    PDFpersocurri pdfp = new PDFpersocurri();
    pdfp.Pdf_pers(usr, pwd, nome, cognome, luonasc, datanasc, country, address,
            city, cap, prov, doc, numdoc, phone, mail, qualifiche, esperienze,
            insegnamenti, motivazioni);

    }
RScons.close();

PDFacca pdfa = new PDFacca();
int i = 0;

while(RScons1.next()){  //estraggo i dati
    i++;
    String tipodiploma = RScons1.getString("tipodiploma");
    String datadiploma = RScons1.getString("datadiploma");
    String voto = RScons1.getString("voto");
    String dataimma = RScons1.getString("dataimma");

    pdfa.PdfAccad(i, tipodiploma, datadiploma, voto, dataimma);
    }

pdfa.chiudiPdf();
RScons1.close();
st.close();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creazione dei file PDF completata</title>
    </head>
    <body>
        <center>
            <h3>Creazione dei file <i>PDFpersocurri.pdf</i> e <i>PDFacca.pdf</i> completata!</h3>
        </center>
        <p>
        <hr>
        <p>
        <form method="post" action="fine.jsp">
            <input type="submit" value="Continua la tua chiusura">
        </form>
        <p>
        <form method="post" action="chiusura.jsp">
            <input type="submit" value="Annulla la tua chiusura">
        </form>
    </body>
</html>
