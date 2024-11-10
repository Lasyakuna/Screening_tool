function calculateBMI() {
    // Get input values
    const height = parseFloat(document.getElementById('height').value) / 100;
    const weight = parseFloat(document.getElementById('weight').value);


    let hasError = false;
    if (isNaN(weight) || weight <= 0) {
        document.getElementById("weightError").innerText = "Please enter a valid weight in kg.";
        hasError = true;
    }
    if (isNaN(height) || height <= 0) {
        document.getElementById("heightError").innerText = "Please enter a valid height in cm.";
        hasError = true;
    }
    if (hasError) return;

    const bmi = (weight / (height * height)).toFixed(2);
    // Calculate BMI
    
    
    localStorage.setItem("bmi", bmi);
    // Display BMI
    document.getElementById('bmi').value = bmi;
}

document.getElementById('weight').addEventListener('input', function() {
    document.getElementById("weightError").innerText = "";
});
document.getElementById('height').addEventListener('input', function() {
    document.getElementById("heightError").innerText = "";
});

function calculateScore()
{
    let totalScore = 0;
    let bmiscore = 0;
    let weightLossscore = 0;
    let chronicDiseasescore = 0;
    let foodIntakescore = 0;
    let biochemicalscore = 0;
    let bmi = localStorage.getItem("bmi");

  
    if (bmi >= 18.50 && bmi < 25.00) {
        bmiscore = 0;
    } else if ((bmi >= 16.50 && bmi < 18.50) || (bmi >= 25.00 && bmi < 29.9)) {
        bmiscore = 1; 
    } else {
        bmiscore = 2; 
    }

    const Wyes = document.getElementById('weightLossYes');
    const Wno = document.getElementById('weightLossNo');
    if (!Wyes.checked && !Wno.checked) {
        document.getElementById('weightLossError').innerText = "Please select an option.";
    } else if (Wyes.checked) {
        weightLossscore = 1;
        document.getElementById('weightLossError').innerText = " "; // Clear the error message if selection is made
    } else {
        document.getElementById('weightLossError').innerText = " ";
    }

    const Cyes = document.getElementById('chronicDiseaseYes');
    const Cno = document.getElementById('chronicDiseaseNo');
    if (!Cyes.checked && !Cno.checked) {
        document.getElementById('chronicDiseaseError').innerText = "Please select an option.";
    } else if (Cyes.checked) {
        chronicDiseasescore = 1; 
        document.getElementById('chronicDiseaseError').innerText = " ";// Clear the error message if selection is made
    } else {
        document.getElementById('chronicDiseaseError').innerText = " ";
    }
    
    const Fyes = document.getElementById('foodIntakeYes');
    const Fno = document.getElementById('foodIntakeNo');
    if (!Fyes.checked && !Fno.checked) {
        document.getElementById('foodIntakeError').innerText = "Please select an option.";
    } else if (Fyes.checked) {
        foodIntakescore = 1;
        document.getElementById('foodIntakeError').innerText = " "; // Clear the error message if selection is made
    } else {
        document.getElementById('foodIntakeError').innerText = " ";
    }

    const Byes = document.getElementById('biochemicalYes');
    const Bno = document.getElementById('biochemicalNo');
    if (!Byes.checked && !Bno.checked) {
        document.getElementById('biochemicalError').innerText = "Please select an option.";
    } else if (Byes.checked) {
        biochemicalscore = 1;
        document.getElementById('biochemicalError').innerText = " "; // Clear the error message if selection is made
    } else {
        document.getElementById('biochemicalError').innerText = " ";
    }

    totalScore = bmiscore + weightLossscore + chronicDiseasescore + foodIntakescore + biochemicalscore;

    let riskLevel = '';

    if (totalScore === 0) {
        riskLevel = "Low risk (Repeat Rescreening)";
    } else if (totalScore === 1) {
        riskLevel = "Medium risk (Document dietary intake for three days / Screening after three days)";
    } else {
        riskLevel = "High risk (Initiate detailed nutritional assessment / Start nutrition care plan)";
    }
    localStorage.setItem("bmiscore", bmiscore);
    localStorage.setItem("weightLossscore", weightLossscore);
    localStorage.setItem("chronicDiseasescore", chronicDiseasescore);
    localStorage.setItem("foodIntakescore", foodIntakescore);
    localStorage.setItem("biochemicalscore", biochemicalscore);
    localStorage.setItem("totalScore", totalScore);
    localStorage.setItem("riskLevel", riskLevel);

    alert("Scores calculated and saved!");
                
}  



