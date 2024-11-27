// document.getElementById("register-form").addEventListener("submit", function (e) {
//   e.preventDefault();

//   // Retrieve form values
//   const nutritionistID = document.getElementById("nutritionist-id").value;
//   const name = document.getElementById("name").value;
//   const phone = document.getElementById("phone").value;
//   const email = document.getElementById("email").value;
//   const gender = document.getElementById("gender").value;
//   const role = document.getElementById("role").value;
//   const password = document.getElementById("password").value;
//   const confirmPassword = document.getElementById("confirm-password").value;

//   // Reset error messages
//   document.getElementById("id-error").innerText = "";
//   document.getElementById("password-error").innerText = "";

//   // Validate password and confirm password match
//   if (password !== confirmPassword) {
//     document.getElementById("password-error").innerText = "Passwords do not match!";
//     return;
//   }

//   // Example API POST request
//   const data = {
//     nutritionistID,
//     name,
//     phone,
//     email,
//     gender,
//     role,
//     password,
//   };

//   fetch("http://localhost:8000/register", {
//     method: "POST",
//     headers: {
//       "Content-Type": "application/json",
//     },
//     body: JSON.stringify(data),
//   })
//     .then((response) => {
//       if (response.ok) {
//         alert("Registration Successful!");
//         window.location.href = "/login"; // Redirect to login
//       } else if (response.status === 409) {
//         document.getElementById("id-error").innerText = "Nutritionist ID already exists!";
//       } else {
//         alert("An error occurred. Please try again.");
//       }
//     })
//     .catch((error) => {
//       console.error("API Error:", error);
//       alert("An error occurred. Please try again.");
//     });
// });

document.getElementById("register-form").addEventListener("submit", function (e) {
  e.preventDefault();

  // Retrieve form values
  const nutritionistID = document.getElementById("nutritionist-id").value;
  const name = document.getElementById("name").value;
  const phone = document.getElementById("phone").value;
  const email = document.getElementById("email").value;
  const gender = document.getElementById("gender").value;
  const role = document.getElementById("role").value;
  const password = document.getElementById("password").value;
  const confirmPassword = document.getElementById("confirm-password").value;

  // Reset error messages
  document.getElementById("id-error").innerText = "";
  document.getElementById("password-error").innerText = "";

  // Validate password and confirm password match
  if (password !== confirmPassword) {
    document.getElementById("password-error").innerText = "Passwords do not match!";
    return;
  }

  // Simulate registration success or failure

    alert(`Registration Successful!\nNutritonist ID: ${nutritionistID}/nName: ${name}`);
    window.location.href = "login.html"; // Redirect to login page
  
});
