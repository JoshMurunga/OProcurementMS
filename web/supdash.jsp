<%-- 
    Document   : supdash
    Created on : Jul 8, 2018, 3:08:58 PM
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
<% String title = "Supplier Home";%>
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
    String style = null;
    String style2 = null;
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
    <sql:setDataSource var = "dataset" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <%
        try {
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql = "SELECT * FROM company WHERE userid='" + id + "'";

            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                hiddenid = resultSet.getString("companyid");
                ++count;
            }

            if (count == 0) {
                style = "none";
                style2 = "block";
            } else {
                style = "block";
                style2 = "none";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
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
                        <a href="<%=response.encodeURL("opentenders.jsp")%>" class="green-text">View Details<i class="material-icons right">send</i></a>
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
                        <a href="<%=response.encodeURL("closedtenders.jsp")%>" class="red-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card green z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">done_all</i>
                        <sql:query  dataSource = "${dataset}" var = "result">
                            SELECT * FROM awardtender WHERE companyid=<%=hiddenid%> AND status='accepted';
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Granted Tenders!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="<%=response.encodeURL("accaward.jsp")%>" class="green-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card red z-depth-2">
                    <div class="card-content white-text">
                        <i class="material-icons medium">announcement</i>
                        <sql:query  dataSource = "${dataset}" var = "result">
                            SELECT * FROM awardtender WHERE status='pending' AND companyid=<%=hiddenid%>;
                        </sql:query>
                        <span class="right">
                            <p style="font-size: 40">${result.rowCount}</p><br>
                            <p>Notifications!</p>
                        </span>
                    </div>
                    <div class="card-action white">
                        <a href="<%=response.encodeURL("award.jsp")%>" class="red-text">View Details<i class="material-icons right">send</i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <center>
        <% String message = (String) request.getAttribute("errMessage");
            if (message == null) {
                message = "";
            } else {
        %>
        <script type="text/javascript"> Materialize.toast("<%=message%>", 4000);</script>
        <% }%>
        <div class="container" style="display: <%= style2%>">
            <div class="teal-text"><b>Please complete company profile in order to submit bid</b></div><br>
            <div class="container">
                <form class="col s12" name="company" id="company" action="<%=request.getContextPath()%>/ControllerServlet" method="post" enctype="multipart/form-data" onsubmit="return validateComsProfile()">
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">work</i>
                            <input id="companyname" name="companyname" type="text" class="validate">
                            <label for="companyname">Company Name</label>
                        </div>
                    </div>
                    <input type="hidden" name="source" value= "company">
                    <input type="hidden" name="userid" value= "<%= id%>">
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">email</i>
                            <input id="email" name="email" type="email" class="validate">
                            <label for="email">Company Email</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix">phone</i>
                            <input id="contact" name="contact" type="text" class="validate">
                            <label for="contact">Company Contact</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">location_city</i>
                            <input id="location" name="location" type="text" class="validate">
                            <label for="location">Location</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="address" name="address" type="text" class="validate">
                            <label for="address">Postal Address</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="file-field input-field col s12">
                            <div class="btn red"><span>Add File</span><input type="file" name="pincertificate"></div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" id="pincertificate" name="pincertificate" type="text" placeholder="Upload Pin Certificate Documents">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <button class="btn col s12 waves-effect waves-light orange" type="submit" name="action">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </center>
    <sql:query  dataSource = "${dataset}" var = "result">
        SELECT * FROM tenders WHERE status = 'open';
    </sql:query>
    <div id="table_stats" style="display: <%= style%>" class="container z-depth-2">
        <center><div class="green-text" style="font-size: 20; margin-top: 8px"><b>TENDER ANNOUNCEMENTS</b></div></center>
        <table class="striped dataTabularized" id="clips_table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Opening Date</th>
                    <th>Closing Date</th>
                    <th>Tender Documents</th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td><c:out value = "${row.title}"/></td>
                        <td><c:out value = "${row.category}"/></td>
                        <td><c:out value = "${row.description}"/></td>
                        <td><fmt:formatDate type="date" value = "${row.opendate}"/></td>
                        <td><fmt:formatDate type="date" value = "${row.closingdate}"/></td>
                        <td><a class="waves-effect waves-light btn orange" href="download?source=tender&id=${row.tenderid}">Download</a></td>
                        <td><a class="waves-effect waves-light btn modal-trigger red" href="bidding.jsp?id=<%=hiddenid%>&tenid=${row.tenderid}">Bidding</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />