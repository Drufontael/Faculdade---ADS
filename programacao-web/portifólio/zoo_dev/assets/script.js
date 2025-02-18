

let zodiacData = [];
fetch("./assets/zodiac.json")
    .then(response => response.json())
    .then(data => zodiacData = data);

const zodiacDates = [
    { name: "Armadillo", start: [1, 20], end: [2, 18] },
    { name: "Octopus", start: [2, 19], end: [3, 20] },
    { name: "Unicorn", start: [3, 21], end: [4, 19] },
    { name: "Beaver", start: [4, 20], end: [5, 20] },
    { name: "Magpie", start: [5, 21], end: [6, 20] },
    { name: "Wolf", start: [6, 21], end: [7, 22] },
    { name: "Lion", start: [7, 23], end: [8, 22] },
    { name: "Squirrel", start: [8, 23], end: [9, 22] },
    { name: "Chameleon", start: [9, 23], end: [10, 22] },
    { name: "Phoenix", start: [10, 23], end: [11, 21] },
    { name: "Rhino", start: [11, 22], end: [12, 21] },
    { name: "Koala", start: [12, 22], end: [1, 19] }
];

// Function to get zodiac sign by date
function getSignByDate(month, day) {
    return zodiacDates.find(sign => {
        const [startMonth, startDay] = sign.start;
        const [endMonth, endDay] = sign.end;

        return (month === startMonth && day >= startDay) ||
               (month === endMonth && day <= endDay) ||
               (month > startMonth && month < endMonth);
    });
}

// Event listener for form submission on index.html
document.getElementById("zodiacForm")?.addEventListener("submit", function(event) {
    event.preventDefault();
    const birthdate = new Date(document.getElementById("birthdate").value);
    const month = birthdate.getMonth() + 1;
    const day = birthdate.getDate();

    const userSign = getSignByDate(month, day);
    if (userSign) {
        const signData = zodiacData.find(sign => sign.name === userSign.name);
        localStorage.setItem("signData", JSON.stringify(signData));
        window.location.href = "result.html";
    }
});

// Populate result.html with zodiac information
if (window.location.pathname.includes("result.html")) {
    const signData = JSON.parse(localStorage.getItem("signData"));

    if (signData) {
        document.getElementById("signName").textContent = signData.name + " - "+signData.title;
        document.getElementById("signMantra").textContent = signData.mantra;
        document.getElementById("signDescription").textContent = signData.description;
        document.getElementById("signImage").src = signData.image;
    }
}
