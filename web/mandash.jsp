<%-- 
    Document   : mandash
    Created on : Jun 25, 2018, 8:16:58 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "Procurement Manager";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<main id="maindash">
    <jsp:include page="./includes/mandashnav.jsp" />
    <sql:setDataSource var = "dataset" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <div id="cards_stats">
        <div class="row">
            <div class="col s12 m6 l3">
                <div class="card green z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">folder_open</i>
                        <span class="right">
                            <p style="font-size: 40">60</p><br>
                            <p>Open Tenders!</p>
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
                        <i class="material-icons medium">folder</i>
                        <span class="right">
                            <p style="font-size: 40">10</p><br>
                            <p>Closed Tenders!</p>
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
                        <i class="material-icons medium">style</i>
                        <sql:query  dataSource = "${dataset}" var = "result">
                            SELECT * FROM bids;
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Bids!</p>
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
                        <i class="material-icons medium">fiber_new</i>
                        <sql:query  dataSource = "${dataset}" var = "result">
                            SELECT * FROM requisitions WHERE status='pending';
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>New Requisitions!</p>
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
            <a href="#!" class="collection-item"><span class="badge">70</span>Suppliers</a>
            <a href="#!" class="collection-item"><span class="new badge">4</span>Active Contracts</a>
            <a href="#!" class="collection-item"><span class="badge">50</span>Pending Purchase Orders</a>
            <a href="#!" class="collection-item"><span class="badge">14</span>Confirmed Purchase Orders</a>
            <a href="#!" class="collection-item"><span class="badge">2</span>Declined Purchase Orders</a>
        </div>
    </div>
</main>
<jsp:include page="./includes/footer.jsp" />