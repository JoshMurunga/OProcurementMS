<%-- 
    Document   : dptdash
    Created on : Jun 23, 2018, 2:54:43 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "User Department";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<main id="maindash">
    <jsp:include page="./includes/dptdashnav.jsp" />
    <div id="cards_stats">
        <div class="row">
            <div class="col s12 m6 l3">
                <div class="card green z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">remove_red_eye</i>
                        <sql:setDataSource var = "users" driver = "org.postgresql.Driver"
                                           url = "jdbc:postgresql://localhost:5432/opms"
                                           user = "postgres"  password = "1234"/>
                        <sql:query  dataSource = "${users}" var = "result">
                            SELECT * FROM users;
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Pending Checking!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="#" class="green-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card red z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">cancel</i>
                        <sql:setDataSource var = "users" driver = "org.postgresql.Driver"
                                           url = "jdbc:postgresql://localhost:5432/opms"
                                           user = "postgres"  password = "1234"/>
                        <sql:query  dataSource = "${users}" var = "result">
                            SELECT * FROM users;
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Declined Requisitions!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="#" class="red-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card green z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">done_all</i>
                        <sql:setDataSource var = "users" driver = "org.postgresql.Driver"
                                           url = "jdbc:postgresql://localhost:5432/opms"
                                           user = "postgres"  password = "1234"/>
                        <sql:query  dataSource = "${users}" var = "result">
                            SELECT * FROM users;
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Approved Requisites!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="#" class="green-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card red z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">done</i>
                        <sql:setDataSource var = "users" driver = "org.postgresql.Driver"
                                           url = "jdbc:postgresql://localhost:5432/opms"
                                           user = "postgres"  password = "1234"/>
                        <sql:query  dataSource = "${users}" var = "result">
                            SELECT * FROM users;
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Pending Approval!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="#" class="red-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="coll_stats" class="container z-depth-2">
        <div class="collection">
            <a href="#!" class="collection-item"><span class="badge">${result.rowCount}</span>Department Requisitions</a>
            <a href="#!" class="collection-item"><span class="badge">${result.rowCount}</span>Delivered Requisitions</a>
        </div>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />