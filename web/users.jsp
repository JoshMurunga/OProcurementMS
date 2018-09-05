<%-- 
    Document   : users
    Created on : Jun 29, 2018, 12:09:03 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "User Module";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<main id="maindash">
    <jsp:include page="./includes/mandashnav.jsp" />
    <center><div class="green-text" style="font-size: 20; margin-top: 8px"><b>USER MANAGEMENT</b><a class="waves-effect waves-light btn modal-trigger right red" id="butt_stats" href="#modal1"><i class="material-icons right">person_add</i>add user</a></div></center>
    <div id="modal1" class="modal modal-fixed-footer">
        <div class="modal-content">
            <h5>Fill in form to add new user</h5>
            <div class="row">
                <form class="col s12" method="POST" action="<%=response.encodeURL("ControllerServlet")%>" id="register" name="register" onsubmit="return validateform()">
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
                    <input type="hidden" name="source" value= "register">
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
                        <div class="input-field col s6">
                            <i class="material-icons prefix">work</i>
                            <input id="department" name="department" type="text" class="validate">
                            <label for="department">Department</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix">phone</i>
                            <input id="contact" name="contact" type="text" class="validate">
                            <label for="contact">Contact</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <select name="role" >
                                <option value="" disabled selected>Role</option>
                                <option value="CommitteeMember">Committee Member</option>
                                <option value="UserDepartment">User Department</option>
                            </select>
                            <label>Select User Role</label>
                        </div>
                        <div class="input-field col s3">
                            <i class="material-icons prefix">lock_outline</i>
                            <input id="password" name="password" type="password" class="validate">
                            <label for="password">Password</label>
                        </div>
                        <div class="input-field col s3">
                            <input id="confirmpassword" name="cpassword" type="password" class="validate">
                            <label for="confirmpassword">Confirm Password</label>
                        </div>
                    </div>

                </form>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" form="register" class="waves-effect waves-teal btn green" name='editdetails' onclick="return validateform()">Submit</button>
            <a class="modal-action modal-close waves-effect waves-teal btn red">close</a>
        </div>
    </div>

    <br>
    <sql:setDataSource var = "user" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${user}" var = "result">
        SELECT * FROM users WHERE role='UserDepartment' OR role='CommitteeMember' OR role='Supplier';
    </sql:query>
    <div id="table_stats" class="container z-depth-2">
        <% String message = (String) request.getAttribute("errMessage");
            if (message == null) {
                message = "";
            } else {
        %>
        <script type="text/javascript"> Materialize.toast("<%=message%>", 4000);</script>
        <% }%>
        <table class="striped dataTabularized" id="clips_table">
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Department</th>
                    <th>Role</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                        <td><c:out value = "${row.firstname}"/></td>
                        <td><c:out value = "${row.lastname}"/></td>
                        <td><c:out value = "${row.username}"/></td>
                        <td><c:out value = "${row.email}"/></td>
                        <td><c:out value = "${row.contact}"/></td>
                        <td><c:out value = "${row.department}"/></td>
                        <td><c:out value = "${row.role}"/></td>
                        <td><a id="edit_mat_button" class="modal-trigger tooltipped" data-position="bottom" data-tooltip="Edit" href="#modal6" data-userid="${row.userid}" data-firstname="${row.firstname}" data-lastname="${row.lastname}" data-email="${row.email}" data-username="${row.username}" data-contact="${row.contact}" data-department="${row.department}"><i class="material-icons ">edit</i></a></td>
                        <td><a id="delete_mat_button" class="tooltipped" data-position="bottom" data-tooltip="Remove" onclick="return deleter()" href="<%=response.encodeURL("ControllerServlet")%>?source=deluser&userid=${row.userid}"><i class="material-icons">delete</i></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div id="modal6" class="modal modal-fixed-footer">
        <div class="modal-content">
            <h5>Edit User Details</h5>
            <form class="col s12" method="POST" action="<%=response.encodeURL("ControllerServlet")%>" id="editUser" name="editUser" onsubmit="return validateUser()">
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">person_outline</i>
                        <input id="firstname" name="firstname" type="text" placeholder="name" class="validate">
                        <label for="firstname">First Name</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="lastname" name="lastname" type="text" placeholder="name" class="validate">
                        <label for="lastname">Last Name</label>
                    </div>
                </div>
                <input type="hidden" name="source" value= "editUserDetails">
                <input type="hidden" name="userid" >
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">email</i>
                        <input id="email" name="email" type="email" placeholder="name" class="validate">
                        <label for="email">Email</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="username" name="username" type="text" placeholder="name" class="validate">
                        <label for="username">Username</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">work</i>
                        <input id="department" name="department" type="text" placeholder="name" class="validate">
                        <label for="department">Department</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">phone</i>
                        <input id="contact" name="contact" type="text" placeholder="name" class="validate">
                        <label for="contact">Contact</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <select id="sucu_select">
                            <option value="" disabled selected>Select Role</option>
                            <option value="CommitteeMember">Committee Member</option>
                            <option value="UserDepartment">User Department</option>
                        </select>
                        <input type="hidden" name="role" id="sucu" />
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="submit" form="editUser" class="waves-effect waves-teal green btn" name='editdetails' onclick="return validateUser()">Submit</button>
            <a class="modal-action modal-close waves-effect waves-teal red btn">close</a>
        </div>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />