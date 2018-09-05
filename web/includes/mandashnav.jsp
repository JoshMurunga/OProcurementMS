<ul id="slide-out" class="side-nav nav fixed z-depth-2">
    <li class="center no-padding">
        <div class="darken-2 white-text" style="height: 64px;">
            <div class="row">
                <a href="<%=response.encodeURL("mandash.jsp")%>" class="brand-logo green-text"><img src="./images/EGERTON-UNI.jpg" alt="Logo"></a>
            </div>
        </div>
    </li>

    <li id="dash_dashboard"><a class="waves-effect waves-teal green-text" href="<%=response.encodeURL("mandash.jsp")%>"><i class="material-icons green-text">home</i><b>Dashboard</b></a></li>

    <ul id="accordion" class=" nav collapsible" data-collapsible="accordion">
        <li id="dash_module">
            <div id="dash_module_header" class="nav collapsible-header waves-effect waves-teal green-text"><i class="material-icons green-text">add_shopping_cart</i><b>Requisitions</b></div>
            <div id="dash_module_body" class="collapsible-body">
                <ul>
                    <li id="module_supplier">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("requisitions.jsp")%>">Manage Requisitions</a>
                    </li>
                    <li id="module_approved">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("approvedrequisitions.jsp")%>">Approved Requisitions</a>
                    </li>
                </ul>
            </div>
        </li>
        <li id="dash_module">
            <div id="tender_manage_header" class="collapsible-header waves-effect waves-teal green-text"><i class="material-icons green-text">shopping_cart</i><b>Tenders</b></div>
            <div id="tender_manage_body" class="collapsible-body">
                <ul>
                    <li id="tender_manage">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("tenders.jsp")%>">Manage Tenders</a>
                    </li>
                </ul>
            </div>
        </li>
        <li id="dash_module">
            <div id="tender_bids_header" class="collapsible-header waves-effect waves-teal green-text"><i class="material-icons green-text">style</i><b>Tender Bids</b></div>
            <div id="tender_bids_body" class="collapsible-body">
                <ul>
                    <li id="tender_bids">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("tenderbids.jsp")%>">Manage Evaluated Bids</a>
                    </li>
                    <li id="published_bids">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("publishedbids.jsp")%>">Published Results</a>
                    </li>
                    <li id="tender_awards">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("tenderawards.jsp")%>">Tender Awards</a>
                    </li>
                </ul>
            </div>
        </li>
        <li id="dash_module">
            <div id="add_evaluation_header" class="collapsible-header waves-effect waves-teal green-text"><i class="material-icons green-text">person_outline</i><b>Evaluation Committee</b></div>
            <div id="add_evaluation_body" class="collapsible-body">
                <ul>
                    <li id="add_evaluation">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("addevcomm.jsp")%>">Add Committee Member</a>
                    </li>
                </ul>
            </div>
        </li>
        <li id="dash_module">
            <div id="user_manage_header" class="collapsible-header waves-effect waves-teal green-text"><i class="material-icons green-text">view_carousel</i><b>Modules</b></div>
            <div id="user_manage_body" class="collapsible-body">
                <ul>
                    <li id="user_manage">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("users.jsp")%>">User Management</a>
                    </li>
                </ul>
            </div>
        </li>
        <%
            String userName = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("LOGIN_USER")) {
                        userName = cookie.getValue();
                    }
                }
            }
        %>
        <li id="dash_profile" class="hide-on-large-only">
            <div id="dash_profile_header" class="collapsible-header waves-effect waves-teal green-text"><i class="material-icons green-text">account_circle</i><b><%=userName %></b></div>
            <div id="dash_profile_body" class="collapsible-body">
                <ul>
                    <li id="profile_profile">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("profile.jsp")%>"><i class="material-icons">person_outline</i>Profile</a>
                    </li>
                    <li id="profile_profile">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("LogoutServlet")%>"><i class="material-icons">exit_to_app</i>Logout</a>
                    </li>
                </ul>
            </div>
        </li>
    </ul>
</ul>