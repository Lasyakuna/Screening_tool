// document.getElementById("register-form").addEventListener("submit", function (e) {
//     e.preventDefault();
  
//     // Retrieve form values
//     const PatientID = document.getElementById("patient-id").value;
//     const age = document.getElementById("age").value;
//     const gender = document.getElementById("gender").value;
//     const addmissiondate = document.getElementById("addmissiondate").value;
//     const diagnosis = document.getElementById("diagnosis").value;
//     const lifestyle = document.getElementById("lifestyle").value;
    

//     alert(`Registration Successful!\nFor Patient ID: ${PatientID}`);
//     window.location.href = "home.html"; // Redirect to login page
  
// });
// const today = new Date().toISOString().split('T')[0];
// addmissiondate.setAttribute('max',today);


// Wait for the DOM to load
document.addEventListener('DOMContentLoaded', () => {
    // Get the form element
    const form = document.getElementById('register-form');

    // Add a submit event listener
    form.addEventListener('submit', async (event) => {
        event.preventDefault(); // Prevent the form from reloading the page

        // Collect form data
        const formData = {
            patient_id: document.getElementById('patient-id').value,
            age: document.getElementById('age').value,
            gender: document.getElementById('gender').value,
            date_of_admission: document.getElementById('addmissiondate').value,
            diagnosis: document.getElementById('diagnosis').value,
            lifestyle: document.getElementById('lifestyle').value
        };

        // Send data to the server
        try {
            const response = await fetch('http://127.0.0.1:5000/register', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(formData)
            });

            // Parse and handle the server's response
            const result = await response.json();

            if (response.ok) {
                alert('Patient registered successfully!');
            } else {
                alert(`Error: ${result.error || 'Unable to register patient.'}`);
            }
        } catch (error) {
            console.error('Error:', error);
            alert('An error occurred while connecting to the server.');
        }
    });
});
