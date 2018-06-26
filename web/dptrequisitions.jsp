<%-- 
    Document   : dptrequisitions
    Created on : Jun 23, 2018, 6:16:38 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String title = "User Department";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userdpt")) {
                if (session.getAttribute("userdpt") == null) {
                    response.sendRedirect("login.jsp");
                }
            }
        }
    }
%>
<main id="maindash">
    <jsp:include page="./includes/dptdashnav.jsp" />
    
</main>

<jsp:include page="./includes/footer.jsp" />