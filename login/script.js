// Function to validate login form
function validateForm(event) {
    // Prevent form from submitting
    event.preventDefault();

    // Clear any previous error message
    document.getElementById('errorMessage').textContent = "";

    // Get values from the form fields
    const loginName = document.getElementById('loginName').value;
    const password = document.getElementById('password').value;

    // Regular expression to check if login name is valid (alphanumeric + underscore)
    const loginNameRegex = /^[a-zA-Z0-9_]{1,10}$/;
    // Regular expression to check if password is valid (between 6 and 10 characters, at least 1 digit and 1 uppercase letter)
    const passwordRegex = /^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,10}$/;

    // Validate login name
    if (!loginName.match(loginNameRegex)) {
        document.getElementById('errorMessage').textContent = "Login name must be alphanumeric or contain underscores and not exceed 10 characters.";
        return;
    }

    // Validate password
    if (!password.match(passwordRegex)) {
        document.getElementById('errorMessage').textContent = "Password must be between 6 to 10 characters, contain at least one digit and one uppercase letter.";
        return;
    }

    // If all validations pass, show success message or process the form (for example, submit)
    document.getElementById('errorMessage').textContent = "Form submitted successfully!";
    document.getElementById('errorMessage').style.color = "green";
    // Form submission could be done here if needed
    // document.getElementById('loginForm').submit();
}

// Attach validateForm function to the form's submit event
document.getElementById('loginForm').addEventListener('submit', validateForm);
