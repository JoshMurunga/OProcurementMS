<%-- 
    Document   : passreset
    Created on : Mar 30, 2018, 7:08:57 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% String title = "Password Reset";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/navbar.jsp" />
<%
    String token = request.getParameter("token");
    String email = request.getParameter("email");

    if (token == null && email == null) {
        response.sendRedirect("login.jsp");
    }

    String hiddenid = null;
    String timestamp = null;
    String timenow = null;
    int timediff = 0;
    int count = 0;
    int newcount = 0;

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
        String sql = "SELECT *, now()::timestamp(0) as timenow, userid FROM passwordreset INNER JOIN users ON passwordreset.email=users.email WHERE token='" + token + "' and passwordreset.email='" + email + "'";

        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            timenow = resultSet.getString("timenow");
            timestamp = resultSet.getString("timestamp");
            hiddenid = resultSet.getString("userid");
            ++count;
        }

        if (count == 1) {
            String newsql = "select extract (epoch from (timestamp '" + timenow + "' - timestamp '" + timestamp + "'))::integer/60 as timediff";

            resultSet = statement.executeQuery(newsql);
            while (resultSet.next()) {
                timediff = Integer.parseInt(resultSet.getString("timediff"));
                ++newcount;
            }
            System.out.println(timediff);

            if (newcount == 1) {
                if (timediff > 600) {
                    response.sendRedirect("login.jsp");
                }
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<main>
    <br>
    <center>
        <div class="green-text"><b>Enter Your New Password</b></div><br>
        <div class="container">
            <div class="container">
                <div class="container">
                    <div class="row z-depth-2" style="padding: 32px 30px 0px 30px; border: 1px solid #EEE;">
                        <form class="col s12" name="passreset" id="passreset" method="post" action="<%=request.getContextPath()%>/ControllerServlet" onsubmit="return newPassword()">
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">lock_outline</i>
                                    <input id="newpassword" name="newpassword" type="password" class="validate" required>
                                    <label for="newpassword">Enter Your New Password</label>
                                </div>
                            </div>
                            <input type="hidden" name="source" value= "resetpass">
                            <input type="hidden" name="userid" value="<%= hiddenid%>">
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">lock_outline</i>
                                    <input id="cpassword" name="cpassword" type="password" class="validate" required>
                                    <label for="cpassword">Confirm Password</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <button class="btn col s12 waves-effect waves-light green" type="submit" name="action">Login</button>
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
