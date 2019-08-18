<header class="page-topbar">
    <div class="navbar-fixed">
        <nav class="white" role="navigation">
            <div class="nav-wrapper">
                <a href="<%=response.encodeURL("home.jsp")%>" class="brand-logo teal-text"><img src="./images/EGERTON-UNI.jpg" alt="Logo"></a>

                <ul class="nav right hide-on-med-and-down">
                    <li><a href="<%=response.encodeURL("announcements.jsp")%>" class="waves-effect waves-teal teal-text">Announcements</a></li>
                    <li><a href="<%=response.encodeURL("login.jsp")%>" class="waves-effect waves-teal btn green">Login</a></li>
                </ul>

                <ul id="slide-out" class="nav side-nav">
                    <li><a href="<%=response.encodeURL("announcements.jsp")%>" class="waves-effect waves-teal teal-text">Announcements</a></li>
                    <li><a href="<%=response.encodeURL("login.jsp")%>" class="waves-effect waves-teal btn green">Login</a></li>
                </ul>
                <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
            </div>
        </nav>
    </div>
</header>