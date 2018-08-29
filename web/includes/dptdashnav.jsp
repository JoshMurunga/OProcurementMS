<ul id="slide-out" class="side-nav nav fixed z-depth-2">
    <li class="center no-padding">
        <div class="darken-2 white-text" style="height: 64px;">
            <div class="row">
                <a href="<%=response.encodeURL("dptdash.jsp")%>" class="brand-logo teal-text"><img src="./images/EGERTON-UNI.jpg" alt="Logo"></a>
            </div>
        </div>
    </li>

    <li id="dash_dashboard"><a class="waves-effect waves-teal green-text" href="<%=response.encodeURL("dptdash.jsp")%>"><i class="material-icons green-text">home</i><b>Dashboard</b></a></li>

    <ul id="accordion" class="collapsible" data-collapsible="accordion">
        <li id="dash_module">
            <div id="department_requisition_header" class="collapsible-header waves-effect waves-teal green-text"><i class="material-icons green-text">add_shopping_cart</i><b>Requisitions</b></div>
            <div id="department_requisition_body" class="collapsible-body">
                <ul>
                    <li id="department_requisition">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("dptrequisitions.jsp")%>">Department Requisitions</a>
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
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="#"><i class="material-icons">person_outline</i>Profile</a>
                    </li>
                    <li id="profile_profile">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("LogoutServlet")%>"><i class="material-icons">exit_to_app</i>Logout</a>
                    </li>
                </ul>
            </div>
        </li>
    </ul>
</ul>