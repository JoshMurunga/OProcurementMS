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
                        <sql:query  dataSource = "${dataset}" var = "result">
                            SELECT * FROM tenders WHERE status='open';
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Open Tenders!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="<%=response.encodeURL("tenders.jsp")%>" class="green-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card red z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">folder</i>
                        <sql:query  dataSource = "${dataset}" var = "result">
                            SELECT * FROM tenders WHERE status='closed';
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Closed Tenders!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="<%=response.encodeURL("tenders.jsp")%>" class="red-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card green z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">style</i>
                        <sql:query  dataSource = "${dataset}" var = "result">
                            SELECT tenders.tenderid, tenders.title, tenders.description, tenders.opendate, tenders.closingdate, tenders.tenderdocs FROM tenders INNER JOIN evaluationlot ON tenders.tenderid = evaluationlot.tenderid WHERE evaluationlot.publish = false GROUP BY tenders.tenderid;
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Pending Publishing!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="<%=response.encodeURL("tenderbids.jsp")%>" class="green-text">View Details<i class="material-icons right">send</i></a>
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
                        <a href="<%=response.encodeURL("requisitions.jsp")%>" class="red-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="coll_stats" class="container z-depth-2">
        <div class="collection">
            <sql:query  dataSource = "${dataset}" var = "result">
                SELECT * FROM users WHERE role='Supplier';
            </sql:query>
            <a href="<%=response.encodeURL("users.jsp")%>" class="collection-item"><span class="badge">${result.rowCount}</span>Suppliers</a>
            <sql:query  dataSource = "${dataset}" var = "result">
                SELECT * FROM awardtender;
            </sql:query>
            <a href="<%=response.encodeURL("tenderawards.jsp")%>" class="collection-item"><span class="badge">${result.rowCount}</span>Tender Awards</a>
            <sql:query  dataSource = "${dataset}" var = "result">
                SELECT tenders.tenderid, tenders.title, tenders.description, tenders.opendate, tenders.closingdate, tenders.tenderdocs FROM tenders INNER JOIN evaluationlot ON tenders.tenderid = evaluationlot.tenderid WHERE evaluationlot.publish = true GROUP BY tenders.tenderid;
            </sql:query>
            <a href="<%=response.encodeURL("publishedbids.jsp")%>" class="collection-item"><span class="badge">${result.rowCount}</span>Published Tender Results</a>
            <sql:query  dataSource = "${dataset}" var = "result">
                SELECT * FROM requisitions WHERE status='approved';
            </sql:query>
            <a href="<%=response.encodeURL("approvedrequisitions.jsp")%>" class="collection-item"><span class="badge">${result.rowCount}</span>Approved Requisitions</a>
            
        </div>
    </div>
</main>
<jsp:include page="./includes/footer.jsp" />