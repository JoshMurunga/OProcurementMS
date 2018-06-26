<header id="dashnav">
    <div class="navbar-fixed">
        <nav class="white" role="navigation">
            <div class="nav-wrapper">
                <ul class="dropdown-content" id="user_dropdown">
                    <li><a class="teal-text" href="profile.jsp"><i class="material-icons">person_outline</i>Profile</a></li>
                    <li><a class="teal-text" href="<%=response.encodeURL("LogoutServlet") %>"><i class="material-icons">exit_to_app</i>Logout</a></li>
                </ul>
                <%
                    String user = null;
                    if (!(session.getAttribute("admin") == null)){
                        user = (String) session.getAttribute("admin");
                    } else if (!(session.getAttribute("manager") == null)){
                        user = (String) session.getAttribute("manager");
                    } else if (!(session.getAttribute("committee") == null)){
                        user = (String) session.getAttribute("committee");
                    } else if (!(session.getAttribute("supplier") == null)){
                        user = (String) session.getAttribute("supplier");
                    } else if (!(session.getAttribute("userdpt") == null)){
                        user = (String) session.getAttribute("userdpt");
                    }
                %>
                <ul class="right hide-on-med-and-down">
                    <li>
                        <a class="dropdown-button teal-text" href="#" data-activates="user_dropdown"><%=user %><i class="material-icons teal-text right">account_circle</i></a>
                    </li>
                </ul>
                <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>    
        </nav>
    </div>
</header>