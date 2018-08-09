<%-- 
    Document   : stageone
    Created on : Jul 26, 2018, 10:22:18 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "Stage Three";%>
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
    String fineval = request.getParameter("fineval");
    String techeval = request.getParameter("techeval");

    if (bidid == null) {
        response.sendRedirect("evaluation.jsp");
    }
    
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("LOGIN_USER")) {
                userName = cookie.getValue();
            }
        }
    }

    String hiddenid = null;

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
        String sql = "SELECT committee.committeeid FROM committee INNER JOIN users ON committee.userid=users.userid WHERE users.username='" + userName + "' AND committee.tenderid='" + tenderid + "'";

        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            hiddenid = resultSet.getString("committeeid");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<main id="maindash">
    <jsp:include page="./includes/comdashnav.jsp" />
    <sql:setDataSource var = "bids" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${bids}" var = "result">
        SELECT company.companyname, bids.bidprice FROM bids INNER JOIN company ON bids.companyid=company.companyid WHERE bids.bidid=<%=bidid%>;
    </sql:query>
    <c:forEach var = "row" items = "${result.rows}">
        <center>
            <div>
                <div class="teal-text" style="font-size: 28; margin-top: 8px">Stage Three Evaluation</div>
                <div class="container" style="padding: 32px 30px 0px 30px; border: 1px solid #EEE; background: whitesmoke">
                    <form class="col s12" name="company" action="<%=response.encodeURL("ControllerServlet")%>" method="post" enctype="multipart/form-data">
                        <table>
                            <tr>
                                <td class="teal-text"><b>Company Name</b></td>
                                <td style="width: 200px"><c:out value = "${row.companyname}"/></td>
                            </tr>
                            <tr><td></td></tr>
                            <input type="hidden" name="bidid" value= "<%=bidid%>">
                            <input type="hidden" name="tenderid" value= "<%=tenderid%>">
                            <input type="hidden" name="hiddenid" value= "<%=hiddenid%>">
                            <input type="hidden" name="pincert" value= "<%=pincert%>">
                            <input type="hidden" name="taxcomp" value= "<%=taxcomp%>">
                            <input type="hidden" name="finhist" value= "<%=finhist%>">
                            <input type="hidden" name="techspec" value= "<%=techspec%>">
                            <input type="hidden" name="fineval" value= "<%=fineval%>">
                            <input type="hidden" name="techeval" value= "<%=techeval%>">
                            <input type="hidden" name="source" value= "evaluation">
                            <sql:query  dataSource = "${bids}" var = "result">
                                SELECT bidprice, (SELECT SUM(bidprice) FROM bids WHERE bids.tenderid=<%=tenderid%>) AS total, (SELECT COUNT(*) FROM bids WHERE bids.bidprice <= ${row.bidprice} AND bids.tenderid=<%=tenderid%>) AS position FROM bids WHERE bidprice = ${row.bidprice};
                            </sql:query>
                            <c:forEach var = "row" items = "${result.rows}">
                                <tr>
                                    <td class="teal-text"><b>Bid Price</b></td>
                                    <td><c:out value = "${row.bidprice}"/></td>
                                </tr>
                                <input type="hidden" name="bidprice" value= "${row.bidprice}">
                                <input type="hidden" name="totalbidprice" value= "${row.total}">
                                <tr>
                                    <td class="teal-text"><b>Bid Price Position From Lowest Bid Price To Highest Bid Price</b></td>
                                    <td><c:out value = "${row.position}"/></td>
                                </tr>
                                <tr><td></td><td><button class="btn waves-effect waves-light red right" type="submit" name="action">Submit</button></td></tr>
                            </c:forEach>
                        </table>
                    </form>
                </div>
            </div>
        </center>

    </c:forEach>
</main>

<jsp:include page="./includes/footer.jsp" />