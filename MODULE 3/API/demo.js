document.getElementById("searchButton").addEventListener("click", getWeather);

async function getWeather() {
    const city = document.getElementById("cityInput").value;
    const apiKey = '7f607e4f43b410c9bff4778e2a82d9e6'; 
    const apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=${apiKey}`;
    
    try {
        const response = await fetch(apiUrl);
        if (!response.ok) {
            throw new Error("City not found");
        }
        
        const data = await response.json();
        document.getElementById("cityName").textContent = data.name;
        document.getElementById("temperature").textContent = data.main.temp;
        document.getElementById("humidity").textContent = data.main.humidity;
        document.getElementById("weatherIcon").src = 'https://openweathermap.org/img/wn/${data.weather[0].icon}.png';
        document.getElementById("weatherDetails").style.display = "block";
        document.getElementById("errorMessage").textContent = "";
    } catch (error) {
        document.getElementById("errorMessage").textContent = error.message;
        document.getElementById("weatherDetails").style.display = "none";
    }
}