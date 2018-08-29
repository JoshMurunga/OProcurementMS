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
    <center><div class="green-text" style="font-size: 20; margin-top: 8px"><b>DEPARTMENT REQUISITIONS</b><a class="waves-effect waves-light btn modal-trigger right red" id="butt_stats" href="#modal1"><i class="material-icons right">add</i>add new requisition</a></div></center>
    <div id="modal1" class="modal modal-fixed-footer">
        <div class="modal-content">
            <h5>Fill in form to add new requisition</h5>
            <div class="row">
                <form class="col s12" method="POST" action="<%=response.encodeURL("ControllerServlet")%>" id="requisitionform" name="requisitionform" enctype="multipart/form-data" onsubmit="return validateReq()">
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="item" name="item" type="text" class="validate">
                            <label for="item">Item</label>
                        </div>
                        <div class="input-field col s6">
                            <select id="category" name="category" >
                                <option value="" disabled selected>Select Category</option>
                                <option value="Electronics">Electronics</option>
                                <option value="Funiture">Furniture</option>
                                <option value="Stationery">Stationery</option>
                                <option value="Construction">Construction</option>
                                <option value="Food and Nutrition">Food and Nutrition</option>
                                <option value="Sanitation">Sanitation</option>
                            </select>
                            <label for="category">Category</label>
                        </div>
                    </div>
                    <input type="hidden" name="source" value= "requisition">
                    <input type="hidden" name="hiddenid" value="<%= hiddenid%>">
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="units" name="units" type="text" class="validate">
                            <label for="units">Units of Measure</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="unitprice" name="unitprice" type="text" class="validate">
                            <label for="unitprice">Price Per Unit</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="quantity" name="quantity" type="text" class="validate">
                            <label for="quantity">Quantity</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="totalprice" name="totalprice" type="text" class="validate">
                            <label for="totalprice">Total Price</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="file-field input-field col s6">
                            <div class="btn red"><span>Add Description File</span><input type="file" name="description"></div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" id="description" name="description" type="text" placeholder="Upload description file">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" form="requisitionform" class="waves-effect waves-teal green btn" name='editdetails' onclick="return validateReq">Submit</button>
            <a class="modal-action modal-close waves-effect waves-teal red btn">close</a>
        </div>
    </div>

    <br>
    <sql:setDataSource var = "requisition" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${requisition}" var = "result">
        SELECT * FROM requisitions WHERE userid=<%= hiddenid%>;
    </sql:query>
    <div id="table_stats" class="container z-depth-2">
        <table class="striped dataTabularized" id="clips_table">
            <% String message = (String) request.getAttribute("errMessage");
                if (message == null) {
                    message = "";
                } else {
            %>
            <script type="text/javascript"> Materialize.toast("<%=message%>", 4000);</script>
            <% }%>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Units</th>
                    <th>Rates</th>
                    <th>Qty</th>
                    <th>Total Price</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td><c:out value = "${row.item}"/></td>
                        <td><c:out value = "${row.units}"/></td>
                        <td><c:out value = "${row.priceperunit}"/></td>
                        <td><c:out value = "${row.quantity}"/></td>
                        <td><c:out value = "${row.totalprice}"/></td>
                        <td><c:out value = "${row.category}"/></td>
                        <td><a class="btn waves-effect waves-teal green" href="download?source=requisition&id=${row.requisitionid}" >Download file</a></td>
                        <td><c:out value = "${row.status}"/></td>
                        <td><a id="delete_mat_button" onclick="return remover()" href="<%=response.encodeURL("ControllerServlet")%>?source=reqdel&id=${row.requisitionid}"><i class="material-icons">delete</i></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />