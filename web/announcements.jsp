<%-- 
    Document   : about
    Created on : Mar 27, 2018, 5:51:59 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<% String title = "Tender Announcements";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/navbar.jsp" />

<main>
    <sql:setDataSource var = "tenders" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${tenders}" var = "result">
        SELECT * FROM tenders;
    </sql:query>
    <center><div class="teal-text" style="font-size: 30; margin-top: 8px"><b>TENDER ANNOUNCEMENTS</b></div></center>
    <div id="table_stats" class="container z-depth-2">
        <table class="striped">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Open Date</th>
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
                        <td><a class="waves-effect waves-light btn modal-trigger red" href="#modal3">Bidding</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div id="modal3" class="modal modal-fixed-footer">
        <div class="modal-content">
            <h5>Register Your Account To Submit Bid</h5>
            <div class="row">
                <form class="col s12" method="POST" action="<%=response.encodeURL("ControllerServlet")%>" id="register" name="register" onsubmit="return validateform()">
                    <b><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span></b>
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">person_outline</i>
                            <input id="firstName" name="firstname" type="text" class="validate">
                            <label for="firstName">First Name</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="lastName" name="lastname" type="text" class="validate">
                            <label for="lastName">Last Name</label>
                        </div>
                    </div>
                    <input type="hidden" name="source" value= "supregister">
                    <input type="hidden" name="department" value= "Supplier">
                    <input type="hidden" name="role" value= "Supplier">
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">email</i>
                            <input id="email" name="email" type="email" class="validate">
                            <label for="email">Email</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="username" name="username" type="text" class="validate">
                            <label for="username">Username</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s3">
                            <i class="material-icons prefix">lock_outline</i>
                            <input id="password" name="password" type="password" class="validate">
                            <label for="password">Password</label>
                        </div>
                        <div class="input-field col s3">
                            <input id="confirmpassword" name="cpassword" type="password" class="validate">
                            <label for="confirmpassword">Confirm Password</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix">phone</i>
                            <input id="contact" name="contact" type="text" class="validate">
                            <label for="contact">Contact</label>
                        </div>
                    </div>
                    <div><b><a href="<%=response.encodeURL("login.jsp")%>" class="pink-text right">Already have an account? Click here to Login</a></b></div>
                </form>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" form="register" class="waves-effect waves-teal btn" name='editdetails' onclick="return validateform()">Submit</button>
            <a class="modal-action modal-close waves-effect waves-teal btn">close</a>
        </div>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />
