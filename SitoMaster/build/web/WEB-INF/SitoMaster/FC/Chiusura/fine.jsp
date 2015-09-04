<%-- 
    Document   : fine
    Created on : 15-feb-2010, 11.33.49
    Author     : matteo grandi
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="dataSrc" url="jdbc:hsqldb:hsql://localhost/xdb"
                   driver="org.hsqldb.jdbcDriver" user="sa" password=""/>

<sql:update var="xxx" dataSource="${dataSrc}">
    UPDATE utenti SET compl=true
    WHERE usr = '<%=session.getAttribute("user")%>'
</sql:update>

<jsp:forward page="../welcome.jsp"/>