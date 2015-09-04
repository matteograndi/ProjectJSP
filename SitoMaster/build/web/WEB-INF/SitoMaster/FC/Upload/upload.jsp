<%-- 
    Document   : upload
    Created on : 26-apr-2010, 19.23.21
    Author     : matteo grandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <%@page import="UPLOAD.*"%> --%>
<%-- <%@page import="POSTA.*"%> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%--
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Demo MultipartRequest Upload Servlet</p>
<FORM ACTION="DemoUploadServlet1" METHOD=POST
ENCTYPE="multipart/form-data">
What is your name? <INPUT TYPE=TEXT NAME=submitter>
<BR>
Which file to upload? <INPUT TYPE=FILE NAME=file1> <BR>
Which file to upload? <INPUT TYPE=FILE NAME=file2> <BR>
Which file to uploaddd? <INPUT TYPE=FILE NAME=file3> <BR>
<INPUT TYPE=SUBMIT>
</FORM>
    </body>
</html>

--%>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
            <h1><font color="red">PAGINA DI CARICAMENTO FILE</font></h1>
            <p>

                            
            <FORM ACTION="UploadServlet" METHOD=POST enctype="multipart/form-data">
            <BR>
            Carica allegato <INPUT TYPE=FILE NAME=file2> <BR>
<p>
<INPUT TYPE=SUBMIT>
</FORM>
                


        </center>
        <hr>
        <p>
        <form method="post" action="../welcome.jsp">
            <input type="submit" value="TORNA ALLA PAGINA PRINCIPALE">
        </form>
    </body>
</html>
