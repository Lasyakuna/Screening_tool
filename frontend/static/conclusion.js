const bmi = localStorage.getItem("bmi");
const bmiscore = localStorage.getItem("bmiscore");
const weightLossscore = localStorage.getItem("weightLossscore");
const chronicDiseasescore = localStorage.getItem("chronicDiseasescore");
const foodIntakescore = localStorage.getItem("foodIntakescore");
const biochemicalscore = localStorage.getItem("biochemicalscore");
const totalScore = localStorage.getItem("totalScore");
const riskLevel = localStorage.getItem("riskLevel");

    // Display values on the conclusion page
document.getElementById("bmiscore").innerText = bmiscore || "Not Available";
document.getElementById("weightLossscore").innerText = weightLossscore || "Not Available";
document.getElementById("chronicDiseasescore").innerText = chronicDiseasescore || "Not Available";
document.getElementById("foodIntakescore").innerText = foodIntakescore || "Not Available";
document.getElementById("biochemicalscore").innerText = biochemicalscore || "Not Available";
document.getElementById("totalScore").innerText = totalScore || "Not Available";
document.getElementById("riskLevel").innerText = riskLevel || "Not Available";