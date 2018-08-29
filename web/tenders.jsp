<%-- 
    Document   : tenders
    Created on : Jul 4, 2018, 9:58:22 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<% String title = "Tenders";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<main id="maindash">
    <jsp:include page="./includes/mandashnav.jsp" />
    <center><div class="green-text" style="font-size: 20; margin-top: 8px"><b>TENDER MANAGEMENT</b><a class="waves-effect waves-light btn modal-trigger right red" id="butt_stats" href="#modal2"><i class="material-icons right">person_add</i>add tender</a><br></div></center>
    <div id="modal2" class="modal modal-fixed-footer">
        <div class="modal-content">
            <h5>Fill in form to add new tender</h5>
            <div class="row">
                <form class="col s12" method="POST" action="<%=response.encodeURL("ControllerServlet")%>" id="tender" name="tender" enctype="multipart/form-data">
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="title" name="title" type="text" class="validate" required>
                            <label for="title">Title</label>
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
                    <input type="hidden" name="source" value= "tenders">
                    <div class="row">
                        <div class="input-field col s3">
                            <input id="opendate" name="opendate" type="text" class="datepicker" required>
                            <label for="opendate">Opening Date</label>
                        </div>
                        <div class="input-field col s3">
                            <input id="closingdate" name="closingdate" type="text" class="datepicker" required>
                            <label for="closingdate">Closing Date</label>
                        </div>
                        <div class="file-field input-field col s6">
                            <div class="btn orange"><span>Add File</span><input type="file" name="tenderdocs"></div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" id="tenderdocs" name="tenderdocs" type="text" placeholder="Upload Tender Documents">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <textarea id="description" name="description" class="materialize-textarea"></textarea>
                            <label for="description">Brief Description</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" form="tender" class="waves-effect waves-teal btn green" name='tender' onclick="return validateTender()">Submit</button>
            <a class="modal-action modal-close waves-effect waves-teal btn red">close</a>
        </div>
    </div>
    <br>
    <sql:setDataSource var = "tenders" driver = "org.postgresql.Driver"
                       url = "jdbc:postgresql://localhost:5432/opms"
                       user = "postgres"  password = "1234"/>
    <sql:query  dataSource = "${tenders}" var = "result">
        SELECT * FROM tenders;
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
                    <th>Title</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Opening Date</th>
                    <th>Closing Date</th>
                    <th>Status</th>
                    <th>Tender Documents</th>
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
                        <td><c:out value = "${row.status}"/></td>
                        <td><a class="waves-effect waves-light btn orange" href="download?source=tender&id=${row.tenderid}">Download</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />