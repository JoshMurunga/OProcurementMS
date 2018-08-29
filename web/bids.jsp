<%-- 
    Document   : bids
    Created on : Jul 30, 2018, 9:16:15 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "Publish";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    String tenderid = request.getParameter("id");
%>
<main id="maindash">
    <jsp:include page="./includes/mandashnav.jsp" />
    <sql:setDataSource var = "tenders" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${tenders}" var = "result">
        select company.companyname, company.companyid, evaluationlot.bidid, avg(evaluationlot.stage1) as stageone, avg(evaluationlot.stage2) as stagetwo, avg(evaluationlot.stage3) as stagethree, round((avg(evaluationlot.stage1+evaluationlot.stage2+evaluationlot.stage3))::numeric,2) as total, row_number() OVER (ORDER BY (avg(evaluationlot.stage1+evaluationlot.stage2+evaluationlot.stage3)) DESC) as rnum from evaluationlot inner join bids on evaluationlot.bidid=bids.bidid inner join company on bids.companyid=company.companyid where evaluationlot.tenderid=<%=tenderid%> group by company.companyname, evaluationlot.bidid, company.companyid;
    </sql:query>

    <form id="butt_stats" class="right" method="post" action="<%=response.encodeURL("ControllerServlet")%>" onsubmit="return publisher()">
        <input type="hidden" name="source" value= "publish">
        <input type="hidden" name="tenderid" value= "<%=tenderid%>">
        <c:forEach var = "row" items = "${result.rows}" end = "0">
            <input type="hidden" name="companyid" value= "${row.companyid}">
        </c:forEach>
        <button class="btn col s12 waves-effect waves-light orange" type="submit" name="action">Publish Result</button>
    </form>

    <br><br>
    <div id="table_stats" class="container z-depth-2">
        <table class="striped dataTabularized" id="clips_table">
            <thead>
                <tr>
                    <th>Rank</th>
                    <th>Company Name</th>
                    <th>Stage One Score</th>
                    <th>Stage Two Score</th>
                    <th>Stage Three Score</th>
                    <th>Total Score</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td><c:out value = "${row.rnum}"/></td>
                        <td><c:out value = "${row.companyname}"/></td>
                        <td><c:out value = "${row.stageone}"/></td>
                        <td><c:out value = "${row.stagetwo}"/></td>
                        <td><c:out value = "${row.stagethree}"/></td>
                        <td><c:out value = "${row.total}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />