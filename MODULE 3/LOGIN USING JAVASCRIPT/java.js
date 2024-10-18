// Wait for the DOM to fully load
document.addEventListener('DOMContentLoaded', function () {

    // Email validation function
    function validateEmail() {
        const email = document.getElementById('email').value;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Simple email regex pattern

        if (emailRegex.test(email)) {
            document.getElementById('email').style.borderColor = 'green';
            document.getElementById('emailError').style.display = 'none';
            return true;
        } else {
            document.getElementById('email').style.borderColor = 'red';
            document.getElementById('emailError').style.display = 'block';
            document.getElementById('emailError').innerText = 'Please enter a valid email address';
            return false;
        }
    }

    // Password validation function (simplified)
    function validatePassword() {
        const password = document.getElementById('password').value;

        if (password.length === 6) { // Password should be exactly 6 characters
            document.getElementById('password').style.borderColor = 'green';
            document.getElementById('passwordError').style.display = 'none';
            return true;
        } else {
            document.getElementById('password').style.borderColor = 'red';
            document.getElementById('passwordError').style.display = 'block';
            document.getElementById('passwordError').innerText = 'Password must be exactly 6 characters';
            return false;
        }
    }

    // Real-time validation for email and password fields
    document.getElementById('email').addEventListener('input', validateEmail);
    document.getElementById('password').addEventListener('input', validatePassword);

    // Form submission validation
    document.getElementById('loginForm').addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent form submission for demonstration
        const isEmailValid = validateEmail();
        const isPasswordValid = validatePassword();

        if (isEmailValid && isPasswordValid) {
            alert('Form submitted successfully!');
        } else {
            alert('Please correct the errors before submitting.');
        }
    });
});