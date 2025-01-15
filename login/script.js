function validateForm() {
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;
    let errorMessage = document.getElementById("errorMessage");
    errorMessage.innerHTML = "";

    const usernameRegex = /^[a-zA-Z0-9_]{1,10}$/;
    if (!usernameRegex.test(username)) {
        errorMessage.innerHTML = "Username must only contain alphanumeric characters or underscores and be no more than 10 characters long.";
        return false;
    }

    if (password.length < 6 || password.length > 10) {
        errorMessage.innerHTML = "Password must be between 6 and 10 characters long.";
        return false;
    }

    const passwordRegex = /^(?=.*[A-Z])(?=.*\d)/;
    if (!passwordRegex.test(password)) {
        errorMessage.innerHTML = "Password must contain at least one digit and one uppercase letter.";
        return false;
    }

    return true;
}
