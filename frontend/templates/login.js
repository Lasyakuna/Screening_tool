document.getElementById('loginForm').addEventListener('submit', function (e) {
  e.preventDefault();

  const nutritionistId = document.getElementById('nutritionistId').value;
  const password = document.getElementById('password').value;

  if (nutritionistId && password) {
    // Simulating a login request (Replace with actual API request)
    if (nutritionistId === "123456" && password === "Root@123") {
      alert("Login Successful!");
      window.location.href = "home.html"; // Redirect on successful login
    } else {
      alert("Invalid Nutritionist ID or Password.");
    }
  } else {
    alert("Please fill out all fields correctly.");
  }
});
