<%-- 
    Document   : stageone
    Created on : Jul 26, 2018, 10:22:18 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "Stage Two";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    
    String bidid = request.getParameter("bidid");
    String tenderid = request.getParameter("tenderid");
    String pincert = request.getParameter("pincert");
    String taxcomp = request.getParameter("taxcomp");
    String finhist = request.getParameter("finhist");
    String techspec = request.getParameter("techspec");
    
    if(bidid==null){
        response.sendRedirect("evaluation.jsp");
    }
%>
<main id="maindash">
    <jsp:include page="./includes/comdashnav.jsp" />
    <sql:setDataSource var = "bids" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${bids}" var = "result">
        SELECT company.companyname FROM bids INNER JOIN company ON bids.companyid=company.companyid WHERE bids.bidid=<%=bidid%>;
    </sql:query>
    <center>
        <div>
            <div class="teal-text" style="font-size: 28; margin-top: 8px">Stage Two Evaluation</div>
            <div class="container" style="padding: 32px 30px 0px 30px; border: 1px solid #EEE; background: whitesmoke">
                <form class="col s12" name="stagetwo" id="stagetwo" action="<%=response.encodeURL("stagethree.jsp")%>" method="get" enctype="multipart/form-data" onsubmit="return validateStageTwo()">
                    <table>
                        <tr>
                            <td class="teal-text"><b>Company Name</b></td>
                            <c:forEach var = "row" items = "${result.rows}">
                                <td style="width: 200px"><c:out value = "${row.companyname}"/></td>
                            </c:forEach>
                        </tr>
                        <tr><td></td></tr>
                        <tr>
                            <td class="red-text" style="background-color: lightgray"><b>Evaluation Criteria</b></td>
                            <td class="red-text" style="background-color: lightgray"><b>File</b></td>
                            <td class="red-text" style="background-color: lightgray"><b>Score</b></td>
                        </tr>
                        <tr>
                            <td class="teal-text"><b>Financial History</b></td>
                            <td><a class="waves-effect waves-light btn green" href="<%=response.encodeURL("download")%>?source=bid&source2=fin&id=<%=bidid%>">Download</a></td>
                            <td>
                                <input name="fineval" id="verygood" type="radio" class="with-gap" value="50">
                                <label for="verygood">Very Good</label>
                                <input name="fineval" id="good" type="radio" class="with-gap" value="40">
                                <label for="good">Good</label>
                                <input name="fineval" id="fair" type="radio" class="with-gap" value="30">
                                <label for="fair">Fair</label>
                                <input name="fineval" id="poor" type="radio" class="with-gap" value="20">
                                <label for="poor">Poor</label>
                                <input name="fineval" id="verypoor" type="radio" class="with-gap" value="10">
                                <label for="verypoor">Very Poor</label>
                                <input name="fineval" id="nodocument" type="radio" class="with-gap" value="0">
                                <label for="nodocument">No Financial History Document Provided</label>
                            </td>
                        </tr>
                        <input type="hidden" name="bidid" value= "<%=bidid%>">
                        <input type="hidden" name="tenderid" value= "<%=tenderid%>">
                        <input type="hidden" name="pincert" value= "<%=pincert%>">
                        <input type="hidden" name="taxcomp" value= "<%=taxcomp%>">
                        <input type="hidden" name="finhist" value= "<%=finhist%>">
                        <input type="hidden" name="techspec" value= "<%=techspec%>">
                        <tr>
                            <td class="teal-text"><b>Technical Specification</b></td>
                            <td><a class="waves-effect waves-light btn green" href="<%=response.encodeURL("download")%>?source=bid&source2=tech&id=<%=bidid%>">Download</a></td>
                            <td>
                                <input name="techeval" id="all" type="radio" class="with-gap" value="50">
                                <label for="all">All Specifications Met</label>
                                <input name="techeval" id="most" type="radio" class="with-gap" value="40">
                                <label for="most">Most Specifications Met</label>
                                <input name="techeval" id="some" type="radio" class="with-gap" value="30">
                                <label for="some">Some Specifications Met</label>
                                <input name="techeval" id="none" type="radio" class="with-gap" value="10">
                                <label for="none">No Specifications Met</label>
                                <input name="techeval" id="no_document" type="radio" class="with-gap" value="0">
                                <label for="no_document">No Specification Document Provided</label>
                            </td>
                        </tr>
                        <tr><td></td><td></td><td><button class="btn waves-effect waves-light red right" type="submit" name="action">Proceed<i class="material-icons right">send</i></button></td></tr>
                    </table>
                </form>
            </div>
        </div>
    </center>
</main>

<jsp:include page="./includes/footer.jsp" />