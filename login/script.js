function validateForm() {
    const loginName = document.getElementById("loginName").value.trim();
    const password = document.getElementById("password").value;
    const errorMsg = document.getElementById("errorMsg");
    errorMsg.textContent = "";
  
    const loginRegex = /^[A-Za-z0-9_]+$/;
    if (!loginRegex.test(loginName)) {
      errorMsg.textContent = "Login name must be alphanumeric or underscore only.";
      return false;
    }
    if (loginName.length > 10) {
      errorMsg.textContent = "Login name must not exceed 10 characters.";
      return false;
    }
  
    if (password.length < 6 || password.length > 10) {
      errorMsg.textContent = "Password must be between 6 to 10 characters.";
      return false;
    }
  
    if (!/[A-Z]/.test(password)) {
      errorMsg.textContent = "Password must contain at least one uppercase letter.";
      return false;
    }
  
    if (!/[0-9]/.test(password)) {
      errorMsg.textContent = "Password must contain at least one digit.";
      return false;
    }
  
    alert("Form submitted successfully!");
    return true;
  }
  
