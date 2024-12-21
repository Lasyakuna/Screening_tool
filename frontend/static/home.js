document.getElementById('searchPatientBtn').addEventListener('click', function() {
    const patientIdInput = document.getElementById('patientIdInput').value.trim();
    const searchResult = document.getElementById('searchResult');
    const patientInfo = document.getElementById('patientInfo');
    const patientNameDisplay = document.getElementById('patientNameDisplay');
    const patientIdDisplay = document.getElementById('patientIdDisplay');

    // Clear previous results
    searchResult.classList.add('d-none');
    patientInfo.style.display = 'none';
    
    // Mockup patient data
    const patients = [
        { id: 'PAT-001', doa: '12/10/2024' },
        { id: 'PAT-002', doa: '10/12/2024' }
    ];
    
    // Find patient based on entered ID
    const patient = patients.find(p => p.id === patientIdInput);

    if (patient) {
        // Display patient details
        patientNameDisplay.textContent = patient.doa;
        patientIdDisplay.textContent = patient.id;
        patientInfo.style.display = 'block';
    } else {
        // Show error message if patient not found
        searchResult.classList.remove('d-none');
        searchResult.textContent = 'Patient not found!';
    }
});

// Placeholder for button click events
document.getElementById('editBtn').addEventListener('click', function() {
    alert('Edit button clicked!');
});

document.getElementById('progressBtn').addEventListener('click', function() {
    alert('Progress button clicked!');
});

// document.getElementById('screeningToolBtn').addEventListener('click', function() {
//     alert('Screening Tool button clicked!');
// });
