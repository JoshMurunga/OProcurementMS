<ul id="slide-out" class="side-nav nav fixed z-depth-2">
    <li class="center no-padding">
        <div class="darken-2 white-text" style="height: 64px;">
            <div class="row">
                <a href="<%=response.encodeURL("supdash.jsp")%>" class="brand-logo teal-text"><img src="./images/EGERTON-UNI.jpg" alt="Logo"></a>
            </div>
        </div>
    </li>

    <li id="dash_dashboard"><a class="waves-effect waves-teal green-text" href="<%=response.encodeURL("supdash.jsp")%>"><i class="material-icons green-text">home</i><b>Dashboard</b></a></li>

    <ul id="accordion" class="collapsible" data-collapsible="accordion">
        <li id="dash_module">
            <div id="dash_module_header" class="collapsible-header waves-effect waves-teal green-text"><i class="material-icons green-text">style</i><b>Bidding</b></div>
            <div id="dash_module_body" class="collapsible-body">
                <ul>
                    <li id="module_supplier">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("opentenders.jsp")%>">Open Tenders</a>
                    </li>
                    <li id="module_closed">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("closedtenders.jsp")%>">Closed Tenders</a>
                    </li>
                    <li id="module_employee">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("tenderoutcome.jsp")%>">Tender Bid Outcome</a>
                    </li>
                </ul>
            </div>
        </li>
        
        <li id="dash_module">
            <div id="module_notification_header" class="collapsible-header waves-effect waves-teal green-text"><i class="material-icons green-text">assignment</i><b>Tender Awards</b></div>
            <div id="module_notification_body" class="collapsible-body">
                <ul>
                    <li id="module_notification">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("award.jsp")%>">Awards Notification Area</a>
                    </li>

                    <li id="module_accept">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("accaward.jsp")%>">Accepted Awards</a>
                    </li>
                    
                    <li id="module_decline">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("decaward.jsp")%>">Declined Awards</a>
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
                        <a class="waves-effect waves-teal green-text" style="text-decoration: none;" href="<%=response.encodeURL("profile.jsp")%>"><i class="material-icons green-text">person_outline</i>Profile</a>
                    </li>
                    <li id="profile_profile">
                        <a class="waves-effect waves-teal green-text" style="text-decoration: none;" href="<%=response.encodeURL("LogoutServlet")%>"><i class="material-icons green-text">exit_to_app</i>Logout</a>
                    </li>
                </ul>
            </div>
        </li>
    </ul>
</ul>