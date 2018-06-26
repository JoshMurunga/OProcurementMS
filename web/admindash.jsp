<%-- 
    Document   : admindash
    Created on : Jun 25, 2018, 3:27:45 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "Administrator";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<main id="maindash">
    
</main>
<jsp:include page="./includes/footer.jsp" />