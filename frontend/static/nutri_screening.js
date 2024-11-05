function calculateBMI() {
    // Get input values
    const height = parseFloat(document.getElementById('height').value) / 100;
    const weight = parseFloat(document.getElementById('weight').value);

    // Calculate BMI
    const bmi = (weight / (height * height)).toFixed(2);

    // Display BMI
    document.getElementById('bmi').value = bmi;
}
