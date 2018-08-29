<%-- 
    Document   : forgotpass
    Created on : Mar 30, 2018, 7:08:37 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String title = "Forgot Password?";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/navbar.jsp" />

<main>
    <br>
    <center>
        <div class="green-text"><b>Enter Your Email To Reset Password</b></div><br>
        <div class="container">
            <div class="container">
                <div class="container">
                    <div class="row z-depth-2" style="padding: 32px 30px 0px 30px; border: 1px solid #EEE;">
                        <form class="col s12" name="resetpass" method="post" action="<%=request.getContextPath()%>/EmailServlet">
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">email</i>
                                    <input id="email" name="email" type="email" class="validate" required>
                                    <label for="email">Enter Your Email</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <button class="btn col s12 waves-effect waves-light green" type="submit" name="reset">submit</button>
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
