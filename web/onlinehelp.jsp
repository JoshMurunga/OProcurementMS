<%-- 
    Document   : onlinehelp
    Created on : Sep 2, 2018, 1:58:07 PM
    Author     : Josh Murunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="css/materialicons.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="css/datatables.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="css/style.css"  media="screen,projection"/>

        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/datatables.min.js"></script>
        <script type="text/javascript" src="js/newjavascript.js"></script>
        <script type="text/javascript" src="js/init.js"></script>
        <meta name="viewport" http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0">
        <title>Online Help</title>
    </head>
    <body>
        <header>
            <div class="navbar-fixed">
                <nav class="white" role="navigation">
                    <div class="nav-wrapper">
                        <a class="brand-logo teal-text"><img src="./images/EGERTON-UNI.jpg" alt="Logo"></a>
                    </div>
                </nav>
            </div>
        </header>

        <main>
            <center><div class="green-text" style="font-size: 30; margin-top: 8px"><b>WELCOME TO THE ONLINE HELP</b></div></center>
            <div id="table_stats" class="container z-depth-2">
                <table class="dataTabularized" id="clips_table">
                    <thead>
                        <tr>
                            <th>Click on the topics you want help. Alternatively, search key words on the search bar to filter results</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>
                                <ul class="collapsible">
                                    <li>
                                        <div class="collapsible-header"><b>01.0 NAVIGATION</b></div>
                                        <div class="collapsible-body"><span>Users can navigate through the system using the top navigation bar by clicking on the links available and also using the side panel on the left side of the screen once they login to their accounts. The side panel have one or more tabs which are clickable that are used to categorize some sections of the system. when you click on one tab, it reveals/displays one or more links under the specified category. Clicking on the links redirects users to the pages which they wish to visit. The links have clear names with clear meanings and reflect the page which the user wants to visit. Beside the top and side navigation, all user home pages have display cards with some user sensitive data that can be directly accessed by clicking on the ‘view details’ links. There is also a table available with clickable links just below the display cards except for the supplier account</span></div>
                                    </li> 
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="collapsible">
                                    <li>
                                        <div class="collapsible-header"><b>02.0 REGISTRATION</b></div>
                                        <div class="collapsible-body"><span><b>SUPPLIER</b><br>
                                                i)	Open the recommended browser and access the system through its URL which takes you to the welcome page.<br>
                                                ii)	At the top of the web page lies a navigation bar with a couple of navigation links. The supplier should click on the “Announcements” tab to view the tender announcements.<br>
                                                iii)	The suppliers can search through the available open tenders, download the tender document by clicking on the download button and should they wish to proceed with bidding, click on the bidding button.<br>
                                                iv)	This will give the supplier a registration form which they should fill in with valid details. The system will display a message of success upon successful registration or a corresponding message of failure if any details were wrongly provided<br><br>
                                                <b>USER DEPARTMENT AND EVALUATION COMMITTEE MEMBERS</b><br>
                                                i)	The system is rolled out with a predefined procurement manager account. The procurement manager can access the system through the login page using the right credentials.<br>
                                                ii)	Upon login, the procurement manager is provisioned with an interface that includes a side navigation panel appearing on the left side of the screen.<br>
                                                iii)	The procurement manager should click on the modules tab, which will reveal the user management link which they should click on.<br>
                                                iv)	This link will redirect the procurement manager to the user management area, where a visible red button on the right side of the screen indicating “Add User” should be clicked to add a new user to the system.<br>
                                                v)	The procurement manager will then fill in the details of the user they wish to add to the system. These details will be used by the respective users to access the system.<br>

                                            </span></div>
                                    </li> 
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="collapsible">
                                    <li>
                                        <div class="collapsible-header"><b>03.0 LOGIN</b></div>
                                        <div class="collapsible-body"><span>i)	To login to the system from the home page, there is a login button on the top navigation which the user can click on to be redirected to the login area.<br>
                                                ii)	Enter the username and password that you used while registering.<br>
                                                iii)	Click on the login button. Authenticated users will be given access to the system based on their role.<br>
                                            </span></div>
                                    </li> 
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="collapsible">
                                    <li>
                                        <div class="collapsible-header"><b>04.0 REQUISITION</b></div>
                                        <div class="collapsible-body"><span><b>USER DEPARTMENT</b><br>
                                                i)	Upon successful login, the user department is provisioned with an interface that includes a side navigation panel on the left side of the screen with various links.<br>
                                                ii)	The user should click on the requisition tab that will display other links, department requisitions, approved requisitions and declined requisitions.<br>
                                                iii)	The user should click on the department requisitions, which will redirect them to the department requisitions area.<br>
                                                iv)	To add a new requisition, the user should click on the visible red button at the right side of the screen indicating “Add New Requisition” and fill in the necessary details and hit the submit button<br><br>
                                                <b>PROCUREMENT MANAGER</b><br>
                                                i)	Upon successful login, the procurement manager is provisioned with an interface that includes a side navigation panel on the left side of the screen with various links.<br>
                                                ii)	The procurement manager should click on the requisition tab which will display the manage requisitions and approved requisitions tab.<br>
                                                iii)	The user should click on the manage requisitions link which will redirect them to the requisition management area.<br>
                                                iv)	The procurement manager is presented with a list of all department where he/she can download the description file by clicking the download button.<br>
                                                v)	The procurement manager can then decide whether to approve or decline the requisition which will reflect accordingly to the respective user department accounts.<br>
                                            </span></div>
                                    </li> 
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="collapsible">
                                    <li>
                                        <div class="collapsible-header"><b>05.0 TENDERS</b></div>
                                        <div class="collapsible-body"><span>i)	This can be accessed when the procurement manager approves a user department requisition and it immediately redirects the procurement manager to the tender management area.<br>
                                                ii)	It can also be accessed through the navigation links on the side panel, under the tenders’ tab through the manage tenders link.<br>
                                                iii)	Once in the tender management area, the procurement manager can add a tender by clicking on the visible button located on the right side of the screen which indicated “Add Tender”.<br>
                                                iv)	This will provide the procurement manager a form which they will fill in the tender details and click on the submit button to add the tender.<br>
                                                v)	All tenders are visible to suppliers provided they are within the date range. Tenders past the set opening date and closing date are not visible to suppliers.<br>
                                                vi)	Tenders can be edited by clicking on the compose icon which will give the user a form with pre-filled fields and they can edit as required.<br>
                                                vii)	Tenders can be deleted/removed by clicking on the trash icon that will completely remove the tender from the system.<br>
                                            </span></div>
                                    </li> 
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="collapsible">
                                    <li>
                                        <div class="collapsible-header"><b>06.0 BIDDING</b></div>
                                        <div class="collapsible-body"><span>i)	Upon successful registration and login, the supplier is presented with a company profile form that they should fill in, giving the required valid information and necessary documents.<br>
                                                ii)	Once the company profile has been submitted, it is only then that the supplier can be able to bid on a particular tender.<br>
                                                iii)	A table will be containing all the open tender announcements will be displayed. The supplier should click on the bidding button to proceed with the bidding process.<br>
                                                iv)	The button will redirect the user to the bidding area, where they are expected to fill in the bidding form with the appropriate information and submit.<br>
                                                v)	To prevent the user from bidding more than once on the same tender, this particular tender will no longer be visible for the supplier to bid again.<br>
                                            </span></div>
                                    </li> 
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="collapsible">
                                    <li>
                                        <div class="collapsible-header"><b>07.0 EVALUATION</b></div>
                                        <div class="collapsible-body"><span><b>PROCUREMENT MANAGER</b><br>
                                                i)	On the procurement manager dashboard/side navigation panel, click on the evaluation committee tab that will display the add committee member link.<br>
                                                ii)	Click on this link to be redirected to the add evaluation committee member area.<br>
                                                iii)	This will display a list of all available tenders that have already been created by the procurement manager.<br>
                                                iv)	To assign an evaluation committee member, click on the add button that is beside each tender.<br>
                                                v)	This will redirect you to an area where you can select the committee member from a drop down list, add the expertise of the member and submit the form.<br>
                                                vi)	A couple of committee members can be added but no committee member can be assigned more than once to the same tender<br><br>
                                                <b>EVALUATION COMMITTEE MEMBER</b><br>
                                                i)	Upon successful login, the evaluation committee member is provisioned with an interface that includes a side navigation panel on the left side of the screen with various links.<br>
                                                ii)	The user should click on the bids tab to display the available links.<br>
                                                iii)	Click on the evaluate bids link which will redirect you to the evaluation area.<br>
                                                iv)	A list of all assigned tender bids is displayed and each bid can be evaluated by clicking on the evaluate button beside each bid.<br>
                                                v)	The button will redirect the user to the first stage of evaluation where they are required to select some inputs before proceeding to the next stage.<br>
                                                vi)	After selecting the appropriate values, click on the proceed button which will redirect you to the second evaluation stage.<br>
                                                vii)	Pretty much the same as the first stage except this time around a score is selected before clicking on the proceed button.<br>
                                                viii)	The third stage is an automated stage and therefore no action is required except for clicking on the submit button which will feed the system with the final evaluation.<br>
                                                ix)	The bid cannot be evaluated more than once and will therefore be removed from the tender bid evaluation list.<br>
                                            </span></div>
                                    </li> 
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="collapsible">
                                    <li>
                                        <div class="collapsible-header"><b>08.0 PUBLISHING & AWARD</b></div>
                                        <div class="collapsible-body"><span><b>PROCUREMENT MANAGER</b><br>
                                                i)	On the procurement manager dashboard/side navigation panel, click on the tender bids tab that will display various links.<br>
                                                ii)	Click on the evaluated tender bids link that will redirect you to the evaluated bids area, displaying the list of all evaluated tenders.<br>
                                                iii)	Click the view button under the view and publish column to be redirected to the publishing area.<br>
                                                iv)	Once there, a list of ranked bids with the final outcome is displayed.<br>
                                                v)	At the top right corner just above the table, there is a “publish” button that you should click on in order to publish the final result and be viewable to the suppliers.<br>
                                                vi)	System automation causes a notification of award to be sent to the supplier ranked the first in the final evaluation.<br><br>
                                                <b>SUPPLIER</b><br>
                                                i)	On the supplier dashboard/side navigation panel, click on the bidding tab that will display various links.<br>
                                                ii)	Click on the tender bid outcome link. This will redirect you to the tender bids outcome area.<br>
                                                iii)	A list of all evaluated and published tenders are displayed. To view the outcome, click on the view button under the view outcome column.<br>
                                                iv)	Tender winners have a notification displayed on the home page where they can click on view details link to view the award. Alternatively, they can navigate the side panel to the tender awards tab and click on the award notification area.<br>
                                                v)	If the supplier has indeed won a tender, an award message with the corresponding tender is indicated and the supplier is required to either accept or decline the tender.<br>
                                                vi)	This can be done by clicking on the accept award or decline award buttons that come alongside the tender award message.<br>
                                            </span></div>
                                    </li> 
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="collapsible">
                                    <li>
                                        <div class="collapsible-header"><b>09.0 PROFILE</b></div>
                                        <div class="collapsible-body"><span>i)	Access the user profile area by clicking on the username at the top right corner of the screen on the top navigation bar.<br>
                                                ii)	A dropdown will appear with two options, profile and logout. Select logout<br>
                                                iii)	This link will redirect you to the profile area where the user information is displayed.<br>
                                                iv)	Click on the edit button to make any necessary changed to your profile and hit the submit button.<br>
                                                v)	The user password can also be changed by clicking on change password button, entering the old/current password, the new password and a confirmation of the new password and submit.<br>
                                            </span></div>
                                    </li> 
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="collapsible">
                                    <li>
                                        <div class="collapsible-header"><b>10.0 ADDED FUNCTIONALITIES</b></div>
                                        <div class="collapsible-body"><span><b>PRINTING</b><br>
                                                All tables with some form of data have the functionality of printing where reports can be generated. At the top left corner of each table includes print button where once clicked, a printing form appears and a print dialog pops up for the user to choose how they want to print the generated document filled with data from the respective table.<br><br>
                                                <b>SEARCHING</b><br>
                                                All tables with some form of data have a search functionality that can help the user find the exact data that they need. The user can click on the search field and search for any information regardless of the column. The table will automatically filter out the unnecessary data and display the required data to the user. This functionality can be used in conjunction with the printing functionality where the user can filter out the unnecessary data and click on the print button to print the result.<br><br>
                                                <b>PASSWORD RESET</b><br>
                                                If the users have forgotten their passwords, they can reset them. This functionality is available through the login page where the user can click on the forgot password link. The link will alternatively redirect the users to a page asking them to enter the email address in which they registered with to the system. If the email address does not exist, an error message will popup indicating that the email address does not exist in the system. If the email address exists, an email will be sent to the user, with the password reset link. From the email, the user can click on the link and will be redirected to a page where they will enter their new password. This password can now be used to authenticate the user who wants to access the system.<br><br>
                                                <b>ALL USER LOGOUT</b><br>
                                                Once done with using the functionalities of the system, users can logout of the system by simply clicking at their username at the top right corner of the screen on the top navigation bar and selecting ‘Logout’ once the dropdown appears.<br>
                                            </span></div>
                                    </li> 
                                </ul>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </main>

        <footer class="page-footer green">
            <%@page import="java.util.*" %>
            <%
                GregorianCalendar date = new GregorianCalendar();
                int year = date.get(Calendar.YEAR);
            %>

            <div id="copyright" class="footer-copyright">
                <div class="container">Copyright &copy; <%= year%>. Egerton Procurement Management System. All rights reserved</div>
            </div>

        </footer>
    </body>
</html>
