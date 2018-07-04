<ul id="slide-out" class="side-nav nav fixed z-depth-2">
    <li class="center no-padding">
        <div class="darken-2 white-text" style="height: 64px;">
            <div class="row">
                <a href="<%=response.encodeURL("mandash.jsp")%>" class="brand-logo teal-text"><img src="./images/logo.png" alt="Logo"></a>
            </div>
        </div>
    </li>

    <li id="dash_dashboard"><a class="waves-effect waves-teal teal-text" href="<%=response.encodeURL("mandash.jsp")%>"><i class="material-icons teal-text">home</i><b>Dashboard</b></a></li>

    <ul id="accordion" class="collapsible" data-collapsible="accordion">
        <li id="dash_module">
            <div id="dash_module_header" class="collapsible-header waves-effect waves-teal teal-text"><i class="material-icons teal-text">add_shopping_cart</i><b>Requisitions</b></div>
            <div id="dash_module_body" class="collapsible-body">
                <ul>
                    <li id="module_supplier">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("requisitions.jsp")%>">Manage Requisitions</a>
                    </li>

                    <li id="module_employee">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="#">Delivered Requisitions</a>
                    </li>
                </ul>
            </div>
        </li>
        <li id="dash_module">
            <div id="dash_module_header" class="collapsible-header waves-effect waves-teal teal-text"><i class="material-icons teal-text">add_shopping_cart</i><b>Tenders</b></div>
            <div id="dash_module_body" class="collapsible-body">
                <ul>
                    <li id="module_supplier">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("requisitions.jsp")%>">Manage Requisitions</a>
                    </li>

                    <li id="module_employee">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="#">Delivered Requisitions</a>
                    </li>
                </ul>
            </div>
        </li>
        <li id="dash_module">
            <div id="dash_module_header" class="collapsible-header waves-effect waves-teal teal-text"><i class="material-icons teal-text">add_shopping_cart</i><b>Tender Bids</b></div>
            <div id="dash_module_body" class="collapsible-body">
                <ul>
                    <li id="module_supplier">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("requisitions.jsp")%>">Manage Requisitions</a>
                    </li>

                    <li id="module_employee">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="#">Delivered Requisitions</a>
                    </li>
                </ul>
            </div>
        </li>
        <li id="dash_module">
            <div id="dash_module_header" class="collapsible-header waves-effect waves-teal teal-text"><i class="material-icons teal-text">add_shopping_cart</i><b>Evaluation Committee</b></div>
            <div id="dash_module_body" class="collapsible-body">
                <ul>
                    <li id="module_supplier">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("requisitions.jsp")%>">Manage Requisitions</a>
                    </li>

                    <li id="module_employee">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="#">Delivered Requisitions</a>
                    </li>
                </ul>
            </div>
        </li>
        <li id="dash_module">
            <div id="dash_module_header" class="collapsible-header waves-effect waves-teal teal-text"><i class="material-icons teal-text">view_carousel</i><b>Modules</b></div>
            <div id="dash_module_body" class="collapsible-body">
                <ul>
                    <li id="module_supplier">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=response.encodeURL("users.jsp")%>">User Management</a>
                    </li>
                </ul>
            </div>
        </li>
        <%
            String user = null;
            if (!(session.getAttribute("admin") == null)) {
                user = (String) session.getAttribute("admin");
            } else if (!(session.getAttribute("manager") == null)) {
                user = (String) session.getAttribute("manager");
            } else if (!(session.getAttribute("committee") == null)) {
                user = (String) session.getAttribute("committee");
            } else if (!(session.getAttribute("supplier") == null)) {
                user = (String) session.getAttribute("supplier");
            } else if (!(session.getAttribute("userdpt") == null)) {
                user = (String) session.getAttribute("userdpt");
            }
        %>
        <li id="dash_profile" class="hide-on-large-only">
            <div id="dash_profile_header" class="collapsible-header waves-effect waves-teal teal-text"><i class="material-icons teal-text">account_circle</i><b><%=user%></b></div>
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