<%-- 
    Document   : bids
    Created on : Jul 30, 2018, 9:16:15 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<% String title = "Publish";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("LOGIN_USER")) {
                userName = cookie.getValue();
            }
        }
    }

    String companyid = null;
    String id = null;
    int count = 0;

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
        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
        statement = connection.createStatement();
        String sql = "SELECT * FROM users WHERE username='" + userName + "'";

        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            id = resultSet.getString("userid");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<main id="maindash">
    <jsp:include page="./includes/supdashnav.jsp" />
    <sql:setDataSource var = "tenders" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <%
        try {
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql = "SELECT * FROM company WHERE userid='" + id + "'";

            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                companyid = resultSet.getString("companyid");
                ++count;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <sql:query  dataSource = "${tenders}" var = "result">
        SELECT * FROM tenders where exists (select 1 from bids where tenderid = tenders.tenderid and companyid=<%=companyid%>);
    </sql:query>
    <div id="table_stats" class="container z-depth-2">
        <table class="striped dataTabularized" id="clips_table">
            <thead>
                <tr>
                    <th>Tender Title</th>
                    <th>Tender Description</th>
                    <th>Opening Date</th>
                    <th>Closing Date</th>
                    <th>Tender Documents</th>
                    <th>View Outcome</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td><c:out value = "${row.title}"/></td>
                        <td><c:out value = "${row.description}"/></td>
                        <td><fmt:formatDate type="date" value = "${row.opendate}"/></td>
                        <td><fmt:formatDate type="date" value = "${row.closingdate}"/></td>
                        <td><a class="waves-effect waves-light btn green" href="download?source=tender&id=${row.tenderid}">Download</a></td>
                        <td><a href="<%=response.encodeURL("outcome.jsp")%>?id=${row.tenderid}" class="btn red">View <i class="material-icons right">send</i></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />