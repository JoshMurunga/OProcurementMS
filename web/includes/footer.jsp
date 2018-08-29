        <footer class="page-footer green">
            <%@page import="java.util.*" %>
            <%
                GregorianCalendar date = new GregorianCalendar();
                int year = date.get(Calendar.YEAR);
            %>

            <div id="copyright" class="footer-copyright">
                <div class="container">Copyright &copy; <%= year%>. Organizational Procurement Management System. All rights reserved</div>
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
            
            function ConfirmSubmita(){
		var x=confirm("Are you sure you want to Approve This Requisition?");
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
        </script>
    </body>
</html>
