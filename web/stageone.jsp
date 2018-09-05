<%-- 
    Document   : stageone
    Created on : Jul 26, 2018, 10:22:18 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "Stage One";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    String bidid = request.getParameter("bidid");
    String companyid = request.getParameter("companyid");
    String tenderid = request.getParameter("tenderid");
    
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
            <div class="teal-text" style="font-size: 28; margin-top: 8px">Stage One Evaluation</div>
            <div class="container" style="padding: 32px 30px 0px 30px; border: 1px solid #EEE; background: whitesmoke">
                <form class="col s12" name="stageone" id="stageone" action="<%=response.encodeURL("stagetwo.jsp")%>" method="get" enctype="multipart/form-data" onsubmit="return validateStageOne()">
                    <table>
                        <tr>
                            <td class="teal-text"><b>Company Name</b></td>
                            <c:forEach var = "row" items = "${result.rows}">
                                <td style="width: 200px"><c:out value = "${row.companyname}"/></td>
                            </c:forEach>
                        </tr>
                        <tr><td></td></tr>
                        <tr>
                            <td class="red-text" style="background-color: lightgray"><b>Task</b></td>
                            <td class="red-text" style="background-color: lightgray"><b>File</b></td>
                            <td class="red-text" style="background-color: lightgray"><b>Score</b></td>
                        </tr>
                        <tr>
                            <td class="teal-text"><b>Has Submitted Pin Certificate Document</b></td>
                            <td><a class="waves-effect waves-light btn green" href="<%=response.encodeURL("download")%>?source=bid&source2=pin&id=<%=companyid%>">Download</a></td>
                            <td>
                                <input class="with-gap" name="pincert" type="radio" id="submitpin" value="25"/>
                                <label for="submitpin">Submitted</label>
                                <input name="pincert" id="notsubmitpin" type="radio" class="with-gap" value="0"/>
                                <label for="notsubmitpin">Not Submitted</label>
                            </td>
                        </tr>
                        <tr>
                            <td class="teal-text"><b>Has Submitted Tax Compliance Document</b></td>
                            <td><a class="waves-effect waves-light btn green" href="<%=response.encodeURL("download")%>?source=bid&source2=tax&id=<%=bidid%>">Download</a></td>
                            <td>
                                <input class="with-gap" name="taxcomp" type="radio" id="submittax" value="25">
                                <label for="submittax">Submitted</label>
                                <input name="taxcomp" id="notsubmittax" type="radio" class="with-gap" value="0">
                                <label for="notsubmittax">Not Submitted</label>
                            </td>
                        </tr>
                        <input type="hidden" name="bidid" value= "<%=bidid%>">
                        <input type="hidden" name="tenderid" value= "<%=tenderid%>">
                        <tr>
                            <td class="teal-text"><b>Has Submitted Financial History Document</b></td>
                            <td><a class="waves-effect waves-light btn green" href="<%=response.encodeURL("download")%>?source=bid&source2=fin&id=<%=bidid%>">Download</a></td>
                            <td>
                                <input class="with-gap" name="finhist" type="radio" id="submitfin" value="25">
                                <label for="submitfin">Submitted</label>
                                <input name="finhist" id="notsubmitfin" type="radio" class="with-gap" value="0">
                                <label for="notsubmitfin">Not Submitted</label>
                            </td>
                        </tr>
                        <tr>
                            <td class="teal-text"><b>Has Submitted Technical Specification Document</b></td>
                            <td><a class="waves-effect waves-light btn green" href="<%=response.encodeURL("download")%>?source=bid&source2=tech&id=<%=bidid%>">Download</a></td>
                            <td>
                                <input class="with-gap" name="techspec" type="radio" id="submittech" value="25">
                                <label for="submittech">Submitted</label>
                                <input name="techspec" id="notsubmittech" type="radio" class="with-gap" value="0">
                                <label for="notsubmittech">Not Submitted</label>
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