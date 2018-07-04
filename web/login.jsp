<%-- 
    Document   : login
    Created on : Mar 27, 2018, 5:53:42 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String title = "Login";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/navbar.jsp" />

<main>
    <br>
    <center>
        <div class="teal-text"><b>Login to your account</b></div><br>
        <div class="container">
            <div class="container">
                <div class="container">
                    <div class="row z-depth-2" style="padding: 32px 30px 0px 30px; border: 1px solid #EEE;">
                        <form class="col s12" name="login" method="post" action="<%=request.getContextPath()%>/ControllerServlet">
                            <b><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span></b>
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">account_circle</i>
                                    <input id="username" name="username" type="text" class="validate">
                                    <label for="username">Enter Your Username</label>
                                </div>
                            </div>
                            <input type="hidden" name="source" value= "login">
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">lock_outline</i>
                                    <input id="password" name="password" type="password" class="validate">
                                    <label for="password">Enter Your Password</label>
                                </div>
                                <label style="float: right">
                                    <a class="pink-text" href="forgotpass.jsp" ><b>Forgot Password?</b></a>
                                </label>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <button class="btn col s12 waves-effect waves-light" type="submit" name="action">Login</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </center>
</main>

<jsp:include page="./includes/footer.jsp" />