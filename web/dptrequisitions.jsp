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
    <a class="waves-effect waves-light btn modal-trigger right red" id="butt_stats" href="#modal1"><i class="material-icons right">add</i>add new requisition</a><br>
    <div id="modal1" class="modal modal-fixed-footer">
        <div class="modal-content">
            <h5>Fill in form to add new requisition</h5>
            <div class="row">
                <form class="col s12" method="POST" action="<%=response.encodeURL("ControllerServlet")%>" id="editinfo" name="editinfo">
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="item" name="item" type="text" class="validate" required>
                            <label for="item">Item</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="category" name="category" type="text" class="validate" required>
                            <label for="category">Category</label>
                        </div>
                    </div>
                    <input type="hidden" name="source" value= "requisition">
                    <input type="hidden" name="userid" value="<%= hiddenid%>">
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="units" name="units" type="text" class="validate" required>
                            <label for="units">Units of Measure</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="unitprice" name="unitprice" type="text" class="validate" required>
                            <label for="unitprice">Price Per Unit</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="quantity" name="quantity" type="text" class="validate" required>
                            <label for="quantity">Quantity</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="totalprice" name="totalprice" type="text" class="validate" required>
                            <label for="totalprice">Total Price</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="supplier" name="supplier" type="text" class="validate" required>
                            <label for="supplier">Supplier</label>
                        </div>
                        <div class="file-field input-field col s6">
                            <div class="btn red"><span>Add File</span><input type="file"></div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" name="description" type="text" placeholder="Upload description file">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" form="editinfo" class="waves-effect waves-teal btn" name='editdetails'>Submit</button>
            <a href="#!" class="modal-action modal-close waves-effect waves-teal btn">close</a>
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
        <table class="striped">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Units</th>
                    <th>Rates</th>
                    <th>Qty</th>
                    <th>Total Price</th>
                    <th>Category</th>
                    <th>Supplier</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Action</th>
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
                        <td><c:out value = "${row.supplier}"/></td>
                        <td><c:out value = "${row.contact}"/></td>
                        <td><c:out value = "${row.contact}"/></td>
                        <td><c:out value = "${row.contact}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />