<%-- 
    Document   : signup
    Created on : Jun 25, 2018, 5:45:04 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String title = "Sign Up";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/navbar.jsp" />

<main>
    <br>
    <center>
        <div class="teal-text"><b>Fill in form to Sign Up new user account</b></div><br>
        <div class="container">
            <div class="container">
                <div class="row z-depth-2" style="padding: 32px 30px 0px 30px; border: 1px solid #EEE; p">
                    <form class="col s12" name="register" action="<%=request.getContextPath()%>/ControllerServlet" method="post" onsubmit="return validateform()">
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
                        <input type="hidden" name="source" value= "register">
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">email</i>
                                <input id="email" name="email" type="email" class="validate">
                                <label for="email">Email</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="username" name="username" type="text" class="validate">
                                <label for="username">Username</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">lock_outline</i>
                                <input id="password" name="password" type="password" class="validate">
                                <label for="password">Password</label>
                            </div>
                            <div class="input-field col s6">
                                <input id="confirmpassword" name="cpassword" type="password" class="validate">
                                <label for="confirmpassword">Confirm Password</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">phone</i>
                                <input id="contact" name="contact" type="text" class="validate">
                                <label for="contact">Contact</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix">work</i>
                                <input id="department" name="department" type="text" class="validate">
                                <label for="department">Department</label>
                            </div>
                        </div>
                        <div class="input-field col s12">
                            <select name="role" >
                                <option value="" disabled selected>Role</option>
                                <option value="0">Administrator</option>
                                <option value="1">Procurement Manager</option>
                                <option value="2">Committee Member</option>
                                <option value="3">Supplier</option>
                                <option value="4">User Department</option>
                            </select>
                            <label>Select User Role</label>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <button class="btn col s12 waves-effect waves-light orange" type="submit" name="action">Sign Up</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </center>
</main>

<jsp:include page="./includes/footer.jsp" />
