<%-- 
    Document   : dptrequisitions
    Created on : Jun 23, 2018, 6:16:38 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "Evaluation";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<main id="maindash">
    <jsp:include page="./includes/comdashnav.jsp" />
    <sql:setDataSource var = "bids" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${bids}" var = "result">
        SELECT * FROM bids;
    </sql:query>
    <%
        String companyid = 
        String driverName = "org.postgresql.Driver";
        String connectionUrl = "jdbc:postgresql://localhost:5432/";
        String dbName = "opms";
        String userId = "postgres";
        String password = "1234";

        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DriverManager.getConnection(
                    connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql = "SELECT companyname FROM company WHERE companyid=";

            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                hiddenid = resultSet.getString("userid");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <div id="table_stats" class="container z-depth-2">
        <table class="striped">
            <thead>
                <tr>
                    <th>Company Name</th>
                    <th>Bidding Price</th>
                    <th>Technical Specs</th>
                    <th>Tax Compliance</th>
                    <th>Pin Certificate</th>
                    <th>FInancial History</th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td><c:out value = "${row.companyid}"/></td>
                        <td><c:out value = "${row.bidprice}"/></td>
                        <td><a class="btn waves-effect waves-teal" href="download?source=bid&source2=tech&id=${row.bidid}" >Download file</a></td>
                        <td><a class="btn waves-effect waves-teal" href="download?source=bid&source2=tax&id=${row.bidid}" >Download file</a></td>
                        <td><a class="btn waves-effect waves-teal" href="download?source=bid&source2=pin&id=${row.bidid}" >Download file</a></td>
                        <td><a class="btn waves-effect waves-teal" href="download?source=bid&source2=fin&id=${row.bidid}" >Download file</a></td>
                        <td><a class="btn red">Evaluate</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />