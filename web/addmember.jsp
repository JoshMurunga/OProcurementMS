<%-- 
    Document   : addmember
    Created on : Jul 25, 2018, 9:58:34 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<% String title = "Assign Member Tender";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    
    String tenderid = request.getParameter("id");
    String tentitle = null;
    String description = null;
    
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
        String sql = "SELECT * FROM tenders WHERE tenderid='" + tenderid + "'";

        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            tentitle = resultSet.getString("title");
            description = resultSet.getString("description");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<main id="maindash">
    <jsp:include page="./includes/mandashnav.jsp" />
    <sql:setDataSource var = "tenders" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${tenders}" var = "result">
        select * from users where not exists (select 1 from committee where userid = users.userid and tenderid=<%= tenderid %>) and role='CommitteeMember';
    </sql:query>
    <br>
    <center>
        <div class="container">
            <div class="teal-text"><b>Select Committee Member to Assign Bids of The Following Tender</b></div><br>
            <div class="container" style="padding: 32px 30px 0px 30px; border: 1px solid #EEE; background: whitesmoke">
                <form class="col s12" name="member" action="<%=request.getContextPath()%>/ControllerServlet" method="post" enctype="multipart/form-data" onsubmit="return validateMember()">
                    <table>
                        <tr>
                            <td class="teal-text"><b>Tender Title</b></td>
                            <td><%= tentitle%></td>
                        </tr>
                        <tr>
                            <td class="teal-text"><b>Tender Description</b></td>
                            <td><%= description%></td>
                        </tr>
                        <tr>
                            <td class="teal-text"><b>Description File</b></td>
                            <td><a class="waves-effect waves-light btn red" href="<%=response.encodeURL("download")%>?source=tender&id=<%= tenderid %>">Download</a></td>
                        </tr>
                        <tr>
                        <input type="hidden" name="tenderid" value= "<%= tenderid %>">
                        <input type="hidden" name="source" value= "addmember">
                            <td class="teal-text"><b>Select committee Member</b></td>
                            <td>
                                <select name='userid'>
                                    <option value="" disabled selected>Select Member</option>
                                    <c:forEach var = "row" items = "${result.rows}">
                                        <option value="${row.userid}"><c:out value = "${row.username}"/></option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="teal-text"><b>Expertise</b></td>
                            <td><input id="expertise" name="expertise" type="text" class="validate"></td>
                        </tr>
                    </table>
                    <div class="row">
                        <div class="container">
                            <button class="btn col s12 waves-effect waves-light orange" type="submit" name="action">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </center>
</main>

<jsp:include page="./includes/footer.jsp" />