document.getElementById('searchPatientBtn').addEventListener('click', function() {
    const patientIdInput = document.getElementById('patientIdInput').value;
    const searchResult = document.getElementById('searchResult');
    const patientInfo = document.getElementById('patientInfo');
    const patientName = document.getElementById('patientName');
    const patientId = document.getElementById('patientId');

    // Clear previous results
    searchResult.classList.add('d-none');
    patientInfo.style.display = 'none';
    
    // Mockup patient data
    const patients = [
        { id: 'PAT-001', name: 'John Doe' },
        { id: 'PAT-002', name: 'Jane Smith' }
    ];
    
    const patient = patients.find(p => p.id === patientIdInput);

    if (patient) {
        // Display the patient information
        patientName.textContent = patient.name;
        patientId.textContent = patient.id;
        patientInfo.style.display = 'block';
    } else {
        // Display error message if patient not found
        searchResult.classList.remove('d-none');
        searchResult.textContent = 'Patient not found!';
    }
});
