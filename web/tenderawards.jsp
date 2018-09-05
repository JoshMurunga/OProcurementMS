<%-- 
    Document   : bids
    Created on : Jul 30, 2018, 9:16:15 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<% String title = "Tender Awards";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<main id="maindash">
    <jsp:include page="./includes/mandashnav.jsp" />
    <sql:setDataSource var = "tenders" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${tenders}" var = "result">
        SELECT awardtender.status, awardtender.awarddate, company.companyname, tenders.title, tenders.description FROM awardtender INNER JOIN tenders ON awardtender.tenderid = tenders.tenderid INNER JOIN company ON awardtender.companyid = company.companyid;
    </sql:query>
    <center><div class="green-text" style="font-size: 20; margin-top: 8px"><b>TENDER AWARDS</b></div></center>
    <div id="table_stats" class="container z-depth-2">
        <% String message = (String) request.getAttribute("errMessage");
            if (message == null) {
                message = "";
            } else {
        %>
        <script type="text/javascript"> Materialize.toast("<%=message%>", 4000);</script>
        <% }%>
        <table class="striped dataTabularized" id="clips_table">
            <thead>
                <tr>
                    <th>Tender Title</th>
                    <th>Tender Description</th>
                    <th>Company Name</th>
                    <th>Award Date</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td><c:out value = "${row.title}"/></td>
                        <td><c:out value = "${row.description}"/></td>
                        <td><c:out value = "${row.companyname}"/></td>
                        <td><fmt:formatDate type="date" value = "${row.awarddate}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />