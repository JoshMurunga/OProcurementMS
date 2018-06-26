<%-- 
    Document   : index
    Created on : Feb 21, 2018, 11:22:45 AM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String title = "E-Procurement";%>
<jsp:include page="./includes/header.jsp"><jsp:param name="title" value="<%= title%>"/></jsp:include>
<jsp:include page="./includes/navbar.jsp" />

    <main>
        <div id="index-banner" class="parallax-container valign-wrapper">
            <div class="parallax">
                <img src="./images/parallax1.png" alt="Unsplashed background img 1">
            </div>
        </div>
        
        <div class="container">
            <div class="section">
                <div class="row">
                    <div class="col s12 center">
                        <h3><i class="mdi-content-send brown-text"></i></h3>
                        <h4 class="teal-text">What We Do</h4>
                        <p class="left-align light">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="parallax-container valign-wrapper">
            <div class="parallax">
                <img src="./images/parallax2.jpg" alt="Unsplashed background img 1">
            </div>
        </div>
        
        <div class="container">
            <div class="section">
                <div class="row">
                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center teal-text"><i class="material-icons medium">flash_on</i></h2>
                            <h5 class="center">Speeds up development</h5>
                            <p class="light">We did most of the heavy lifting for you to provide a default stylings that incorporate our custom components. Additionally, we refined animations and transitions to provide a smoother experience for developers.</p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center teal-text"><i class="material-icons medium">group</i></h2>
                            <h5 class="center">User Experience Focused</h5>
                            <p class="light">By utilizing elements and principles of Material Design, we were able to create a framework that incorporates components and animations that provide more feedback to users. Additionally, a single underlying responsive system across all platforms allow for a more unified user experience.</p>
                        </div>
                    </div>

                    <div class="col s12 m4">
                        <div class="icon-block">
                            <h2 class="center teal-text"><i class="material-icons medium">settings</i></h2>
                            <h5 class="center">Easy to work with</h5>
                            <p class="light">We have provided detailed documentation as well as specific code examples to help new users get started. We are also always open to feedback and can answer any questions a user may have about Materialize.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="parallax-container valign-wrapper">
            <div class="parallax">
                <img src="./images/parallax3.jpg" alt="Unsplashed background img 1">
            </div>
        </div>
        
        <div class="container">
            <div class="section">
                <div class="row">
                    <div class="col s12 center">
                        <h3><i class="mdi-content-send brown-text"></i></h3>
                        <h4 class="teal-text">What We Also Do</h4>
                        <p class="left-align light">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies eros. Maecenas eros justo, ullamcorper a sapien id, viverra ultrices eros. Morbi sem neque, posuere et pretium eget, bibendum sollicitudin lacus. Aliquam eleifend sollicitudin diam, eu mattis nisl maximus sed. Nulla imperdiet semper molestie. Morbi massa odio, condimentum sed ipsum ac, gravida ultrices erat. Nullam eget dignissim mauris, non tristique erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;</p>
                    </div>
                </div>
            </div>
        </div>
    </main>

<jsp:include page="./includes/footer.jsp" />