<%-- 
    Document   : home
    Created on : Aug 8, 2019, 8:50:13 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String title = "Home";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/navbar.jsp" />

<main>
    <div id="index-banner" class="parallax-container">
        <div class="section no-pad-bot">
            <div class="container">
                <br><br>
                <h1 class="header center white-text text-lighten-2">Egerton University Procurement Management System</h1>
                <div class="row center">
                    <h5 class="header col s12 light"></h5>
                </div>
                <div class="row center">
                    <a href="<%=response.encodeURL("login.jsp")%>" id="download-button" class="btn-large waves-effect waves-light green lighten-1">Get Started</a>
                </div>
                <br><br>

            </div>
        </div>
        <div class="parallax"><img src="images/logo.jpg" alt="Unsplashed background img 1"></div>
    </div>


    <div class="container">
        <div class="section">

            <!--   Icon Section   -->
            <div class="row">
                <div class="col s12 m4">
                    <div class="icon-block">
                        <h2 class="center teal-text"><i class="material-icons">money_off</i></h2>
                        <h5 class="center">Spend Control</h5>

                        <p class="light center">Optimize spend with tailor made rules and approval process. A solution that helps organisations to streamline and automate processes and obtain best value and control on procurement.</p>
                    </div>
                </div>

                <div class="col s12 m4">
                    <div class="icon-block">
                        <h2 class="center teal-text"><i class="material-icons">bubble_chart</i></h2>
                        <h5 class="center">Smart Dashboard</h5>

                        <p class="light center">Display actionable insights to take data driven decisions. Answer each of your concerns and more very elegantly so that you and your officers have full control over their domains and only on their domains anywhere, anytime and in realtime.</p>
                    </div>
                </div>

                <div class="col s12 m4">
                    <div class="icon-block">
                        <h2 class="center teal-text"><i class="material-icons">assignment_turned_in</i></h2>
                        <h5 class="center">Quick Approvals</h5>

                        <p class="light center">Speed up decision making with automated workflow and alerts. Having a quick approval process in place helps you save much needed time</p>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <div class="parallax-container valign-wrapper">
        <div class="section no-pad-bot">
            <div class="container">
                <div class="row center">
                    <h5 class="header col s12 light">The Procurement System enables the Suppliers to download the Tender Schedule free of cost and then submit the bids online through this portal</h5>
                </div>
            </div>
        </div>
        <div class="parallax"><img src="images/background1.png" alt="Unsplashed background img 2"></div>
    </div>

    <div class="container">
        <div class="section">

            <div class="row">
                <div class="col s12 center">
                    <h3><i class="mdi-content-send brown-text"></i></h3>
                    <h4>What About The System?</h4>
                    <p class="light center">Approving purchase requisitions, creating purchase orders, selecting and managing vendors, collecting delivered goods, reviewing invoices, and paying for them. It handles all these activities electronically. Ease down the administrative burden and improve long-term cost savings.</p>
                </div>
            </div>

        </div>
    </div>


    <div class="parallax-container valign-wrapper">
        <div class="section no-pad-bot">
            <div class="container">
                <div class="row center">
                    <h5 class="header col s12 light"></h5>
                </div>
            </div>
        </div>
        <div class="parallax"><img src="images/background2.jpg" alt="Unsplashed background img 3"></div>
    </div>
</main>

<jsp:include page="./includes/footer.jsp" />
