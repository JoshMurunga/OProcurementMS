        <footer class="page-footer teal">
            <%@page import="java.util.*" %>
            <%
                GregorianCalendar date = new GregorianCalendar();
                int year = date.get(Calendar.YEAR);
            %>

            <div id="copyright" class="footer-copyright">
                <div class="container">Copyright &copy; <%= year%>. Organizational Procurement Management System. All rights reserved</div>
            </div>

        </footer>        
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/init.js"></script>
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
                }  else if (contact == null || contact == "") {
                    alert("Please Enter Contact");
                    return false;
                } else if (isNaN(contact)) {
                    alert("Contact has to be a numerical value");
                    return false;
                } else if (contact.length < 10 || contact.length > 10) {
                    alert("The Contact Is Either Less Than or More Than 10 Digits");
                    return false;
                } else if (department == null || department == "") {
                    alert("Please Enter Department");
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
            
            function ConfirmSubmit(){
		var x=confirm("Are you sure you want to Approve This Requisition?");
		if(x)
                    return true;
		else
                    return false;
            }
        </script>
    </body>
</html>
