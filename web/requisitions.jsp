<%-- 
    Document   : requisitions
    Created on : Jun 28, 2018, 11:07:28 AM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "Requisitions";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<main id="maindash">
    <jsp:include page="./includes/mandashnav.jsp" />
    <sql:setDataSource var = "requisition" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${requisition}" var = "result">
        SELECT * FROM requisitions;
    </sql:query>
    <div id="table_stats" class="container z-depth-2">
        <table class="striped">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Measure Units</th>
                    <th>Rate(Ksh)</th>
                    <th>Quantity</th>
                    <th>Total Price(Ksh)</th>
                    <th>Category</th>
                    <th>Supplier</th>
                    <th>Description File</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr id="user-${row.user_id}">
                        <td><c:out value = "${row.item}"/></td>
                        <td><c:out value = "${row.units}"/></td>
                        <td><c:out value = "${row.priceperunit}"/></td>
                        <td><c:out value = "${row.quantity}"/></td>
                        <td><c:out value = "${row.totalprice}"/></td>
                        <td><c:out value = "${row.category}"/></td>
                        <td><c:out value = "${row.supplier}"/></td>
                        <td><a class="btn orange waves-effect waves-teal" href="download?source=requisition&id=${row.requisitionid}" >Download</a></td>
                        <td><a class="btn green waves-effect waves-teal" href="<%=response.encodeURL("tenders.jsp")%>" onclick="return ConfirmSubmit()">Approve</a></td>
                        <td><a class="btn red">Decline</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />