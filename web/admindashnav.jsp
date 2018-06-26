<ul id="slide-out" class="side-nav nav fixed z-depth-2">
    <li class="center no-padding">
        <div class="darken-2 white-text" style="height: 64px;">
            <div class="row">
                <a href="admindash.jsp" class="brand-logo teal-text"><img src="./images/logo.png" alt="Logo"></a>
            </div>
        </div>
    </li>

    <li id="dash_dashboard"><a class="waves-effect waves-teal teal-text" href="admindash.jsp"><i class="material-icons teal-text">home</i><b>Dashboard</b></a></li>

    <ul id="accordion" class="collapsible" data-collapsible="accordion">
        <li id="dash_procurement">
            <div id="dash_procurement_header" class="collapsible-header waves-effect waves-teal teal-text"><i class="material-icons teal-text">shopping_cart</i><b>Procurement</b></div>
            <div id="dash_procurement_body" class="collapsible-body">
                <ul>
                    <li id="procurement_tender">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="tenders.jsp">Tenders</a>
                    </li>

                    <li id="procurement_contracts">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="contracts.jsp">Contracts</a>
                    </li>

                    <li id="procurement_purchase">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="purchase.jsp">Purchase</a>
                    </li>
                </ul>
            </div>
        </li>

        <li id="dash_module">
            <div id="dash_module_header" class="collapsible-header waves-effect waves-teal teal-text"><i class="material-icons teal-text">view_carousel</i><b>Modules</b></div>
            <div id="dash_module_body" class="collapsible-body">
                <ul>
                    <li id="module_department">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="deportal.jsp">Department Portal</a>
                    </li>

                    <li id="module_supplier">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="suportal.jsp">Supplier Portal</a>
                    </li>

                    <li id="module_employee">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="emportal.jsp">Employee Portal</a>
                    </li>
                </ul>
            </div>
        </li>

        <li id="dash_profile" class="hide-on-large-only">
            <div id="dash_profile_header" class="collapsible-header waves-effect waves-teal teal-text"><i class="material-icons teal-text">account_circle</i><b><%=request.getAttribute("username") %></b></div>
            <div id="dash_profile_body" class="collapsible-body">
                <ul>
                    <li id="profile_profile">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="profile.jsp"><i class="material-icons">person_outline</i>Profile</a>
                    </li>
                    <li id="profile_profile">
                        <a class="waves-effect waves-teal" style="text-decoration: none;" href="<%=request.getContextPath()%>/LogoutServlet"><i class="material-icons">exit_to_app</i>Logout</a>
                    </li>
                </ul>
            </div>
        </li>
    </ul>
</ul>