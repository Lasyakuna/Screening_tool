function calculateBMI() {
    // Get input values
    const height = parseFloat(document.getElementById('height').value) / 100;
    const weight = parseFloat(document.getElementById('weight').value);

    // Calculate BMI
    const bmi = (weight / (height * height)).toFixed(2);
    
    localStorage.setItem("bmi", bmi);
    // Display BMI
    document.getElementById('bmi').value = bmi;
   
}

function calculateScore()
{
    let totalScore = 0;
    let bmiscore = 0;
    let weightLossscore = 0;
    let chronicDiseasescore = 0;
    let foodIntakescore = 0;
    let biochemicalscore = 0;
    let bmi = localStorage.getItem("bmi");

    // Calculate the score based on BMI without displaying it
    if (bmi >= 18.50 && bmi < 25.00) {
        bmiscore = 0; // Normal weight
    } else if ((bmi >= 16.50 && bmi < 18.50) || (bmi >= 25.00 && bmi < 29.9)) {
        bmiscore = 1; // Slightly underweight or overweight
    } else {
        bmiscore = 2; // Either very underweight (below 16.5) or obese (30 and above)
    }


    if (document.getElementById("weightLossYes").checked) {
        weightLossscore = 1;
    }
    if (document.getElementById("chronicDiseaseYes").checked) {
        chronicDiseasescore = 1;
    }
    if (document.getElementById("foodIntakeYes").checked) {
        foodIntakescore = 1;
    }
    if (document.getElementById("biochemicalYes").checked) {
        biochemicalscore = 1;
    }

    totalScore = bmiscore + weightLossscore + chronicDiseasescore + foodIntakescore + biochemicalscore;

    localStorage.setItem("bmiscore", bmiscore);
    localStorage.setItem("foodIntakescore", foodIntakescore);
    localStorage.setItem("weightLossscore", weightLossscore);
    localStorage.setItem("biochemicalscore", biochemicalscore);
    localStorage.setItem("chronicDiseasescore", chronicDiseasescore);
    localStorage.setItem("totalScore", totalScore);
                
}  

document.getElementById("foodIntakescore").innerText = localStorage.getItem("foodIntakescore");
document.getElementById("biochemicalscore").innerText = localStorage.getItem("biochemicalscore");
document.getElementById("chronicDiseasescore").innerText = localStorage.getItem("chronicDiseasescore");
document.getElementById("weightLossscore").innerText = localStorage.getItem("weightLossscore");
document.getElementById("totalScore").innerText = localStorage.getItem("totalScore");
document.getElementById("bmiscore").innerText = localStorage.getItem("bmiscore");