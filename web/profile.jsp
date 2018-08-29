<%-- 
    Document   : profile
    Created on : Aug 11, 2018, 1:46:31 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "Procurement Manager";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if (session.getAttribute("LOGIN_USER") == null) {
        response.sendRedirect("login.jsp");
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
        String sql = "SELECT * FROM users WHERE username='" + userName + "'";

        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            hiddenid = resultSet.getString("userid");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<main>
    <sql:setDataSource var = "tenders" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${tenders}" var = "result">
        SELECT * FROM users WHERE userid=<%=hiddenid%>;
    </sql:query>
    <br>
    <center>
        <div class="container">
            <div class="teal-text"><b>Your User Profile</b></div><br>
            <div class="container" style="padding: 32px 30px 0px 30px; border: 1px solid #EEE; background: whitesmoke">
                <table>
                    <c:forEach var = "row" items = "${result.rows}">
                        <tr>
                            <td class="teal-text"><b>First Name</b></td>
                            <td><c:out value = "${row.firstname}"/></td>
                        </tr>
                        <tr>
                            <td class="teal-text"><b>Last Name</b></td>
                            <td><c:out value = "${row.lastname}"/></td>
                        </tr>
                        <tr>
                            <td class="teal-text"><b>Username</b></td>
                            <td><c:out value = "${row.username}"/></td>
                        </tr>
                        <tr>
                            <td class="teal-text"><b>Email</b></td>
                            <td><c:out value = "${row.email}"/></td>
                            <td><a class="btn red waves-effect waves-light btn modal-trigger" href="#modal4">Edit</a></td>
                        </tr>
                        <tr>
                            <td class="teal-text"><b>Password</b></td>
                            <td><a class="btn red orange waves-effect waves-light btn modal-trigger" href="#modal5">Change Password</a></td>
                        </tr>
                        <div id="modal4" class="modal modal-fixed-footer">
                            <div class="modal-content">
                                <h5>Fill in form to edit profile</h5>
                                <div class="row">
                                    <form class="col s12" method="POST" action="<%=response.encodeURL("ControllerServlet")%>" id="editinfo" name="editinfo" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input id="firstname" name="firstname" type="text" class="validate" value = "${row.firstname}" required>
                                                <label for="firstname">First Name</label>
                                            </div>
                                        </div>
                                        <input type="hidden" name="source" value= "update">
                                        <input type="hidden" name="userid" value="<%= hiddenid%>">
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input id="lastname" name="lastname" type="text" class="validate" value = "${row.lastname}" required>
                                                <label for="lastname">Last Name</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input id="username" name="username" type="text" class="validate" value = "${row.username}" required>
                                                <label for="username">Username</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input id="email" name="email" type="email" class="validate" value = "${row.email}" required>
                                                <label for="email">Email</label>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" form="editinfo" class="waves-effect waves-teal btn green" name='editdetails'>Submit</button>
                                <a href="#!" class="modal-action modal-close waves-effect waves-teal btn red">close</a>
                            </div>
                        </div>
                        <div id="modal5" class="modal modal-fixed-footer">
                            <div class="modal-content">
                                <h5>Change Password</h5>
                                <div class="row">
                                    <form class="col s12" method="POST" action="<%=response.encodeURL("ControllerServlet")%>" id="editpass" name="editpass" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="input-field col s11">
                                                <input id="password" name="password" type="password" class="validate" required>
                                                <label for="password">Old Password</label>
                                            </div>
                                        </div>
                                        <input type="hidden" name="source" value= "changepass">
                                        <input type="hidden" name="userid" value="<%= hiddenid%>">
                                        <div class="row">
                                            <div class="input-field col s11">
                                                <input id="newpassword" name="newpassword" type="password" class="validate" required>
                                                <label for="newpassword">New Password</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s11">
                                                <input id="cpassword" name="cpassword" type="password" class="validate" required>
                                                <label for="cpassword">Confirm Password</label>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" form="editpass" class="waves-effect waves-teal btn green" name='editdetails'>Submit</button>
                                <a href="#!" class="modal-action modal-close waves-effect waves-teal btn red">close</a>
                            </div>
                        </div>
                    </c:forEach>
                </table>
            </div>
        </div>
    </center>
</main>

<jsp:include page="./includes/footer.jsp" />