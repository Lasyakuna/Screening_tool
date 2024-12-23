document.getElementById("register-form").addEventListener("submit", function (e) {
    e.preventDefault();
  
    // Retrieve form values
    const PatientID = document.getElementById("patient-id").value;
    const age = document.getElementById("age").value;
    const gender = document.getElementById("gender").value;
    const addmissiondate = document.getElementById("addmissiondate").value;
    const diagnosis = document.getElementById("diagnosis").value;
    const lifestyle = document.getElementById("lifestyle").value;
    

    alert(`Registration Successful!\nFor Patient ID: ${PatientID}`);
    window.location.href = "/home"; // Redirect to login page
  
});
const today = new Date().toISOString().split('T')[0];
addmissiondate.setAttribute('max',today);


        