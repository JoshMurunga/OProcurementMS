<%-- 
    Document   : dptdash
    Created on : Jun 23, 2018, 2:54:43 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "User Department";%>
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
        String sql = "SELECT * FROM users WHERE username='" + userName + "'";

        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            hiddenid = resultSet.getString("userid");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<main id="maindash">
    <jsp:include page="./includes/dptdashnav.jsp" />
    <sql:setDataSource var = "dataset" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <div id="cards_stats">
        <div class="row">
            <div class="col s12 m6 l3">
                <div class="card green z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">remove_red_eye</i>
                        <sql:query  dataSource = "${dataset}" var = "result">
                            SELECT * FROM requisitions WHERE userid=<%= hiddenid%> AND status = 'pending';
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Pending Checking!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="<%=response.encodeURL("dptrequisitions.jsp")%>" class="green-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card red z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">cancel</i>
                        <sql:query  dataSource = "${dataset}" var = "result">
                            SELECT * FROM requisitions WHERE userid=<%= hiddenid%> AND status = 'declined';
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Declined Requisitions!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="<%=response.encodeURL("decreq.jsp")%>" class="red-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card green z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">done_all</i>
                        <sql:query  dataSource = "${dataset}" var = "result">
                            SELECT * FROM requisitions WHERE userid=<%= hiddenid%> AND status = 'approved';
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Approved Requisites!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="<%=response.encodeURL("appreq.jsp")%>" class="green-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card red z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">done</i>
                        <sql:query  dataSource = "${dataset}" var = "result">
                            SELECT * FROM requisitions WHERE userid=<%= hiddenid%> AND status = 'pending';
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Pending Approval!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="<%=response.encodeURL("dptrequisitions.jsp")%>" class="red-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="coll_stats" class="container z-depth-2">
        <div class="collection">
            <sql:query  dataSource = "${dataset}" var = "result">
                SELECT * FROM requisitions WHERE userid=<%= hiddenid%> AND status = 'pending';
            </sql:query>
            <a href="<%=response.encodeURL("dptrequisitions.jsp")%>" class="collection-item"><span class="badge">${result.rowCount}</span>Pending Checking</a>
            <sql:query  dataSource = "${dataset}" var = "result">
                SELECT * FROM requisitions WHERE userid=<%= hiddenid%> AND status = 'declined';
            </sql:query>
            <a href="<%=response.encodeURL("decreq.jsp")%>" class="collection-item"><span class="badge">${result.rowCount}</span>Declined Requisitions</a>
            <sql:query  dataSource = "${dataset}" var = "result">
                SELECT * FROM requisitions WHERE userid=<%= hiddenid%> AND status = 'approved';
            </sql:query>
            <a href="<%=response.encodeURL("appreq.jsp")%>" class="collection-item"><span class="badge">${result.rowCount}</span>Approved Requisitions</a>
            <sql:query  dataSource = "${dataset}" var = "result">
                SELECT * FROM requisitions WHERE userid=<%= hiddenid%> AND status = 'pending';
            </sql:query>
            <a href="<%=response.encodeURL("dptrequisitions.jsp")%>" class="collection-item"><span class="badge">${result.rowCount}</span>Pending Approval</a>
        </div>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />