$(document).ready(function() {
    // Email validation function
    function validateEmail() {
        let email = $('#email').val();
        let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (emailRegex.test(email)) {
            $('#email').css('border-color', 'green');
            $('#emailError').hide();
            return true;
        } else {
            $('#email').css('border-color', 'red');
            $('#emailError').show().text('Please enter a valid email address');
            return false;
        }
    }

    // Password validation function
    function validatePassword() {
        let password = $('#password').val();
        let passwordRegex = /^(?=.[a-z])(?=.\d)[a-z\d]{6}$/;
        if (passwordRegex.test(password)) {
            $('#password').css('border-color', 'green');
            $('#passwordError').hide();
            return true;
        } else {
            $('#password').css('border-color', 'red');
            $('#passwordError').show().text('Password must be 6 characters long and include at least one lowercase letter and one number');
            return false;
        }
    }

    // Validate on focus out and on focus in for real-time validation
    $('#email').on('focusout', validateEmail);
    $('#email').on('input', validateEmail);
    
    $('#password').on('focusout', validatePassword);
    $('#password').on('input', validatePassword);

    // Form submission validation
    $('#loginForm').on('submit', function(event) {
        event.preventDefault(); // Prevent form submission for demonstration
        let isEmailValid = validateEmail();
        let isPasswordValid = validatePassword();
        
        if (isEmailValid && isPasswordValid) {
            alert('Form submitted successfully!');
        } else {
            alert('Please correct the errors before submitting.');
        }
    });
});