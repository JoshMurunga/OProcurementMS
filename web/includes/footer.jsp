        <footer class="page-footer green">
            <%@page import="java.util.*" %>
            <%
                GregorianCalendar date = new GregorianCalendar();
                int year = date.get(Calendar.YEAR);
            %>

            <div id="copyright" class="footer-copyright">
                <div class="container">Copyright &copy; <%= year%>. Egerton Procurement Management System. All rights reserved <span class="right"><a class="white-text" id="help" href="<%=response.encodeURL("onlinehelp.jsp")%>" target="_blank">help?</a></span></div>
            </div>

        </footer>        
        
        <script type="text/javascript">
            function validateform() {
                var firstname = document.register.firstname.value;
                var lastname = document.register.lastname.value;
                var email = document.register.email.value;
                var username = document.register.username.value;
                var password = document.register.password.value;
                var cpassword = document.register.cpassword.value;
                var contact = document.register.contact.value;
                var department = document.register.department.value;
                var role = document.register.role.value;
                var letters = /^[A-Za-z]+$/;
                var valpass = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,})$/;
                var emailreg = /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/;

                if (firstname == null || firstname == "") {
                    alert("Please Enter First Name");
                    return false;
                } else if (!firstname.match(letters)) {
                    alert("First name should contain alphabetic characters only");
                    return false;
                } else if (firstname.length < 3 || firstname.length > 15) {
                    alert("First name should be between 4-15 characters");
                    return false;
                } else if (lastname == null || lastname == "") {
                    alert("Please Enter Last Name");
                    return false;
                } else if (!lastname.match(letters)) {
                    alert("Last name should contain alphabetic characters only");
                    return false;
                } else if (lastname.length < 3 || lastname.length > 15) {
                    alert("Last name should be between 4-15 characters");
                    return false;
                } else if (email == null || email == "") {
                    alert("Please Enter Email");
                    return false;
                } else if (!email.match(emailreg)) {
                    alert("Please Enter A Valid Email");
                    return false;
                } else if (username == null || username == "") {
                    alert("Please Enter Username");
                    return false;
                } else if (!username.match(letters)) {
                    alert("Username should contain alphabetic characters only");
                    return false;
                } else if (username.length < 3 || username.length > 15) {
                    alert("Username should be between 4-15 characters");
                    return false;
                } else if (department == null || department == "") {
                    alert("Please Enter Department");
                    return false;
                } else if (contact == null || contact == "") {
                    alert("Please Enter Contact");
                    return false;
                } else if (isNaN(contact)) {
                    alert("Contact has to be a numerical value");
                    return false;
                } else if (contact.length < 10 || contact.length > 10) {
                    alert("The Contact Is Either Less Than or More Than 10 Digits");
                    return false;
                } else if (role == null || role == "") {
                    alert("Please Select Role");
                    return false;
                } else if (password == null || password == "") {
                    alert("Please Enter Password");
                    return false;
                } else if (!password.match(valpass)) {
                    alert(" The Password should have at least 8 characters including an Uppercase letter, a Lowercase letter and a digit");
                    return false;
                } else if (password == cpassword) {
                    return true;
                } else {
                    alert("Passwords Do Not Match");
                    return false;
                }
            }
            
            function validateEditPass(){
                var password = document.editpass.password.value;
                var newpassword = document.editpass.newpassword.value;
                var cpassword = document.editpass.cpassword.value;
                var valpass = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,})$/;
                
                if (password == null || password == "") {
                    alert("Please Enter Your Old Password");
                    return false;
                } else if (newpassword == null || newpassword == "") {
                    alert("Please Enter Your New Password");
                    return false;
                } else if (!newpassword.match(valpass)) {
                    alert(" The Password should have at least 8 characters including an Uppercase letter, a Lowercase letter and a digit");
                    return false;
                } else if (newpassword == cpassword) {
                    return true;
                } else {
                    alert("Passwords Do Not Match");
                    return false;
                }
            }
            
            function newPassword(){
                var newpassword = document.passreset.newpassword.value;
                var cpassword = document.passreset.cpassword.value;
                var valpass = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,})$/;
                
                if (newpassword == null || newpassword == "") {
                    alert("Please Enter Your New Password");
                    return false;
                } else if (!newpassword.match(valpass)) {
                    alert(" The Password should have at least 8 characters including an Uppercase letter, a Lowercase letter and a digit");
                    return false;
                } else if (newpassword == cpassword) {
                    return true;
                } else {
                    alert("Passwords Do Not Match");
                    return false;
                }
            }
            
            function validateUser(){
                var firstname = document.editUser.firstname.value;
                var lastname = document.editUser.lastname.value;
                var email = document.editUser.email.value;
                var username = document.editUser.username.value;
                var department = document.editUser.department.value;
                var contact = document.editUser.contact.value;
                var role = document.editUser.role.value;
                var letters = /^[A-Za-z]+$/;
                var emailreg = /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/;
                
                if (firstname == null || firstname == "") {
                    alert("Please Enter First Name");
                    return false;
                } else if (!firstname.match(letters)) {
                    alert("First name should contain alphabetic characters only");
                    return false;
                } else if (firstname.length < 3 || firstname.length > 15) {
                    alert("First name should be between 4-15 characters");
                    return false;
                } else if (lastname == null || lastname == "") {
                    alert("Please Enter Last Name");
                    return false;
                } else if (!lastname.match(letters)) {
                    alert("Last name should contain alphabetic characters only");
                    return false;
                } else if (lastname.length < 3 || lastname.length > 15) {
                    alert("Last name should be between 4-15 characters");
                    return false;
                } else if (email == null || email == "") {
                    alert("Please Enter Email");
                    return false;
                } else if (!email.match(emailreg)) {
                    alert("Please Enter A Valid Email");
                    return false;
                } else if (username == null || username == "") {
                    alert("Please Enter Username");
                    return false;
                } else if (!username.match(letters)) {
                    alert("Username should contain alphabetic characters only");
                    return false;
                } else if (username.length < 3 || username.length > 15) {
                    alert("Username should be between 4-15 characters");
                    return false;
                } else if (department == null || department == "") {
                    alert("Please Enter Department");
                    return false;
                } else if (contact == null || contact == "") {
                    alert("Please Enter Contact");
                    return false;
                } else if (isNaN(contact)) {
                    alert("Contact has to be a numerical value");
                    return false;
                } else if (contact.length < 10 || contact.length > 10) {
                    alert("The Contact Is Either Less Than or More Than 10 Digits");
                    return false;
                } else if (role == null || role == "") {
                    alert("Please Select Role");
                    return false;
                }
            }
            
            function validateEditInfo(){
                var firstname = document.editinfo.firstname.value;
                var lastname = document.editinfo.lastname.value;
                var email = document.editinfo.email.value;
                var username = document.editinfo.username.value;
                var contact = document.editinfo.contact.value;
                var letters = /^[A-Za-z]+$/;
                var emailreg = /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/;
                                
                if (firstname == null || firstname == "") {
                    alert("Please Enter First Name");
                    return false;
                } else if (!firstname.match(letters)) {
                    alert("First name should contain alphabetic characters only");
                    return false;
                } else if (firstname.length < 3 || firstname.length > 15) {
                    alert("First name should be between 4-15 characters");
                    return false;
                } else if (lastname == null || lastname == "") {
                    alert("Please Enter Last Name");
                    return false;
                } else if (!lastname.match(letters)) {
                    alert("Last name should contain alphabetic characters only");
                    return false;
                } else if (lastname.length < 3 || lastname.length > 15) {
                    alert("Last name should be between 4-15 characters");
                    return false;
                } else if (contact == null || contact == "") {
                    alert("Please Enter Contact");
                    return false;
                } else if (isNaN(contact)) {
                    alert("Contact has to be a numerical value");
                    return false;
                } else if (contact.length < 10 || contact.length > 10) {
                    alert("The Contact Is Either Less Than or More Than 10 Digits");
                    return false;
                } else if (username == null || username == "") {
                    alert("Please Enter Username");
                    return false;
                } else if (!username.match(letters)) {
                    alert("Username should contain alphabetic characters only");
                    return false;
                } else if (username.length < 3 || username.length > 15) {
                    alert("Username should be between 4-15 characters");
                    return false;
                } else if (email == null || email == "") {
                    alert("Please Enter Email");
                    return false;
                } else if (!email.match(emailreg)) {
                    alert("Please Enter A Valid Email");
                    return false;
                }
            }
            
            function ConfirmSubmita(){
		var x=confirm("Are you sure you want to Approve This Requisition?");
		if(x)
                    return true;
		else
                    return false;
            }
            
            function confirmAccept(){
		var x=confirm("Are you sure you want to Accept This Tender Award?");
		if(x)
                    return true;
		else
                    return false;
            }
            
            function confirmDecline(){
		var x=confirm("Are you sure you want to Decline This Tender Award?");
		if(x)
                    return true;
		else
                    return false;
            }
            
            function ConfirmSubmitd(){
		var x=confirm("Are you sure you want to Decline This Requisition?");
		if(x)
                    return true;
		else
                    return false;
            }
            
            function publisher(){
		var x=confirm("Are you sure you want to publish the results of this tender? The company ranked first will be automatically awarded the tender.");
		if(x)
                    return true;
		else
                    return false;
            }
            
            function deleter(){
		var x=confirm("Are you sure you want to Delete This User?");
		if(x)
                    return true;
		else
                    return false;
            }
            
            function tenDeleter(){
		var x=confirm("Are you sure you want to Delete This Tender?");
		if(x)
                    return true;
		else
                    return false;
            }
            
            function remover(){
		var x=confirm("Are you sure you want to Delete This Requisition?");
		if(x)
                    return true;
		else
                    return false;
            }
            
            function validateTender(){
                var title = document.tender.title.value;
                var category = document.tender.category.value;
                var opendate = document.tender.opendate.value;
                var closingdate = document.tender.closingdate.value;
                var description = document.tender.description.value;
                var status = document.tender.status.value;
                
                if (title == null || title == "") {
                    alert("Please Enter The Tender Title");
                    return false;
                } else if (title.length > 100) {
                    alert("Title is too long");
                    return false;
                } else if (category == null || category == "") {
                    alert("Please Select The Category");
                    return false;
                } else if (opendate == null || opendate == "") {
                    alert("Please Select The Tender Opening Date");
                    return false;
                } else if (closingdate == null || closingdate == "") {
                    alert("Please Select The Tender Closing Date");
                    return false;
                } else if (!document.getElementById('tenderdocs').value) {
                    alert("Please Add The Tender Document");
                    return false;
                } else if (description == null || description == "") {
                    alert("Please Add a brief description");
                    return false;
                } else if (status == null || status == "") {
                    alert("Please Select the tender status");
                    return false;
                }
            }
            
            function validateEditTender(){
                var title = document.edittender.title.value;
                var category = document.edittender.category.value;
                var opendate = document.edittender.opendate.value;
                var closingdate = document.edittender.closingdate.value;
                var description = document.edittender.description.value;
                var status = document.edittender.status.value;
                
                if (title == null || title == "") {
                    alert("Please Enter The Tender Title");
                    return false;
                } else if (title.length > 100) {
                    alert("Title is too long");
                    return false;
                } else if (category == null || category == "") {
                    alert("Please ReSelect The Category");
                    return false;
                } else if (opendate == null || opendate == "") {
                    alert("Please Select The Tender Opening Date");
                    return false;
                } else if (closingdate == null || closingdate == "") {
                    alert("Please Select The Tender Closing Date");
                    return false;
                } else if (!document.getElementById('edittenderdocs').value) {
                    alert("Please Reupload The Tender Document");
                    return false;
                } else if (description == null || description == "") {
                    alert("Please Add a brief description");
                    return false;
                } else if (status == null || status == "") {
                    alert("Please Reselect the status");
                    return false;
                }
            }
            
            function validateMember(){
                var userid = document.member.userid.value;
                var expertise = document.member.expertise.value;
                var letters = /^[A-Za-z]+$/;
                
                if (userid == null || userid == "") {
                    alert("Please Select Committee Member");
                    return false;
                } else if (expertise == null || expertise == "") {
                    alert("Please Enter the member expertise or just specify they are a member");
                    return false;
                } else if (!expertise.match(letters)) {
                    alert("No Numericals and spaces allowed");
                    return false;
                }  else if (expertise.length > 20) {
                    alert("The Entered Value is too long");
                    return false;
                }
            }
            
            function validateReq(){
                var item = document.requisitionform.item.value;
                var category = document.requisitionform.category.value;
                var units = document.requisitionform.units.value;
                var unitprice = document.requisitionform.unitprice.value;
                var quantity = document.requisitionform.quantity.value;
                var totalprice = document.requisitionform.totalprice.value;
                var letters = /^[A-Za-z]+$/;
                
                if (item == null || item == "") {
                    alert("Please enter the item name");
                    return false;
                } else if (item.length > 20) {
                    alert("The item name is too long");
                    return false;
                } else if (category == null || category == "") {
                    alert("Please Select The Category");
                    return false;
                } else if (units == null || units == "") {
                    alert("Please enter the units of measure");
                    return false;
                } else if (!units.match(letters)) {
                    alert("Please enter a valid units of measure");
                    return false;
                } else if (units.length > 5) {
                    alert("unit value is too long");
                    return false;
                } else if (unitprice == null || unitprice == "") {
                    alert("Please enter the unit price");
                    return false;
                } else if (isNaN(unitprice)) {
                    alert("unit price has to be a numerical value");
                    return false;
                } else if (quantity == null || quantity == "") {
                    alert("Please enter the quantity");
                    return false;
                } else if (isNaN(quantity)) {
                    alert("quantity has to be a numerical value");
                    return false;
                } else if (totalprice == null || totalprice == "") {
                    alert("Please enter the total price");
                    return false;
                } else if (isNaN(totalprice)) {
                    alert("total has to be a numerical value");
                    return false;
                } else if (!document.getElementById('description').value) {
                    alert("Please add the item description file");
                    return false;
                }
            }
            
            function validateEditReq(){
                var item = document.editreqform.item.value;
                var category = document.editreqform.category.value;
                var units = document.editreqform.units.value;
                var unitprice = document.editreqform.unitprice.value;
                var quantity = document.editreqform.quantity.value;
                var totalprice = document.editreqform.totalprice.value;
                var letters = /^[A-Za-z]+$/;
                
                if (item == null || item == "") {
                    alert("Please enter the item name");
                    return false;
                } else if (item.length > 20) {
                    alert("The item name is too long");
                    return false;
                } else if (category == null || category == "") {
                    alert("Please Reselect The Category");
                    return false;
                } else if (units == null || units == "") {
                    alert("Please enter the units of measure");
                    return false;
                } else if (!units.match(letters)) {
                    alert("Please enter a valid units of measure");
                    return false;
                } else if (units.length > 5) {
                    alert("unit value is too long");
                    return false;
                } else if (unitprice == null || unitprice == "") {
                    alert("Please enter the unit price");
                    return false;
                } else if (isNaN(unitprice)) {
                    alert("unit price has to be a numerical value");
                    return false;
                } else if (quantity == null || quantity == "") {
                    alert("Please enter the quantity");
                    return false;
                } else if (isNaN(quantity)) {
                    alert("quantity has to be a numerical value");
                    return false;
                } else if (totalprice == null || totalprice == "") {
                    alert("Please enter the total price");
                    return false;
                } else if (isNaN(totalprice)) {
                    alert("total has to be a numerical value");
                    return false;
                } else if (!document.getElementById('eddescription').value) {
                    alert("Please reupload description file");
                    return false;
                }
            }
            
            function validateComsProfile(){
                var companyname = document.company.companyname.value;
                var email = document.company.email.value;
                var contact = document.company.contact.value;
                var location = document.company.location.value;
                var address = document.company.address.value;
                var emailreg = /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/;
                
                if (companyname == null || companyname == "") {
                    alert("Please enter the company name");
                    return false;
                } else if (companyname.length > 50) {
                    alert("The company name entered is too long");
                    return false;
                } else if (email == null || email == "") {
                    alert("Please Enter Company Email");
                    return false;
                } else if (!email.match(emailreg)) {
                    alert("Please Enter A Valid Email");
                    return false;
                } else if (contact == null || contact == "") {
                    alert("Please Enter Contact");
                    return false;
                } else if (isNaN(contact)) {
                    alert("Contact has to be a numerical value");
                    return false;
                } else if (contact.length < 10 || contact.length > 10) {
                    alert("The Contact Is Either Less Than or More Than 10 Digits");
                    return false;
                } else if (location == null || location == "") {
                    alert("Please enter the company name");
                    return false;
                } else if (location.length > 50) {
                    alert("The location name entered is too long");
                    return false;
                } if (address == null || address == "") {
                    alert("Please enter the company name");
                    return false;
                } else if (address.length > 20) {
                    alert("The address value entered is too long");
                    return false;
                } else if (!document.getElementById('pincertificate').value) {
                    alert("Please Upload Company Pin Certificate Documents");
                    return false;
                }
            }
            
            function validateBids(){
                var bidprice = document.bids.bidprice.value;
                
                if (bidprice == null || bidprice == "") {
                    alert("Please enter the company's bidding price");
                    return false;
                } else if (isNaN(bidprice)) {
                    alert("The bidding price has to be numerical");
                    return false;
                } else if (!document.getElementById('techspecs').value) {
                    alert("Please Upload Technical Specification Documents of your bid");
                    return false;
                } else if (!document.getElementById('taxcompliance').value) {
                    alert("Please Upload Company Tax Compliance Documents");
                    return false;
                } else if (!document.getElementById('financialhistory').value) {
                    alert("Please Upload Company Financial History Documents");
                    return false;
                }
            }
            
            function validateStageOne(){
                var pincert = document.stageone.pincert.value;
                var taxcomp = document.stageone.taxcomp.value;
                var finhist = document.stageone.finhist.value;
                var techspec = document.stageone.techspec.value;
                
                if (pincert == null || pincert == "") {
                    alert("Please confirm whether the bidder has submitted or not submitted the Pin Certificate document");
                    return false;
                } else if (taxcomp == null || taxcomp == "") {
                    alert("Please confirm whether the bidder has submitted or not submitted the Tax Compliance document");
                    return false;
                } else if (finhist == null || finhist == "") {
                    alert("Please confirm whether the bidder has submitted or not submitted the Financial History document");
                    return false;
                } else if (techspec == null || techspec == "") {
                    alert("Please confirm whether the bidder has submitted or not submitted the Technical Specification document");
                    return false;
                }
            }
            
            function validateStageTwo(){
                var fineval = document.stagetwo.fineval.value;
                var techeval = document.stagetwo.techeval.value;
                
                if (fineval == null || fineval == "") {
                    alert("Please select the financial history evaluation score");
                    return false;
                } else if (techeval == null || techeval == "") {
                    alert("Please select the technical scpecification evaluation score");
                    return false;
                }
            }
            
            function validateStageThree(){
		var x=confirm("Are you sure you want to submit the final evaluation?");
		if(x)
                    return true;
		else
                    return false;
            }
        </script>
    </body>
</html>
