<%-- 
    Document   : bidding
    Created on : Jul 9, 2018, 6:24:39 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String title = "Supplier Home";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/dashnav.jsp" />
<%
    response.setHeader("Cache-Control", "no-cache, no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    String companyid = request.getParameter("id");
    String tenderid = request.getParameter("tenid");
%>
<main id="maindash">
    <jsp:include page="./includes/supdashnav.jsp" />
    <br>
    <center>
        <div class="container">
            <div class="teal-text"><b>Please complete company profile in order to submit bid</b></div><br>
            <div class="container">
                <form class="col s12" name="bids" action="<%=request.getContextPath()%>/ControllerServlet" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="bidprice" name="bidprice" type="text" class="validate">
                            <label for="bidprice">Bidding Price</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="file-field input-field col s12">
                            <div class="btn orange"><span>Add File</span><input type="file" name="techspecs"></div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" name="techspecs" type="text" placeholder="Upload Technical Specification Documents">
                            </div>
                        </div>
                    </div>
                    
                    <input type="hidden" name="source" value= "bids">
                    <input type="hidden" name="companyid" value= "<%=companyid %>">
                    <input type="hidden" name="tenderid" value= "<%=tenderid %>">
                    <div class="row">
                        <div class="file-field input-field col s12">
                            <div class="btn orange"><span>Add File</span><input type="file" name="taxcompliance"></div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" name="taxcompliance" type="text" placeholder="Upload Tax Compliance Documents">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="file-field input-field col s12">
                            <div class="btn orange"><span>Add File</span><input type="file" name="financialhistory"></div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" name="financialhistory" type="text" placeholder="Upload Financial History Documents">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <button class="btn col s12 waves-effect waves-light green" type="submit" name="action">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </center>
</main>

<jsp:include page="./includes/footer.jsp" />