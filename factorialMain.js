document.addEventListener('DOMContentLoaded', function () {
    const computeButton = document.querySelector('#triggerButton');
    const displayResult = document.querySelector('#output');

    // Check if Web Workers are supported
    if (window.Worker) {
        const factorialWorker = new Worker('factorialWorker.js');
        
        // Listen for the message from the worker
        factorialWorker.onmessage = function(event) {
            const factorials = event.data;
            displayFactorialsInTable(factorials); // Display factorials in a table
        };
        
        computeButton.addEventListener('click', () => {
            const inputValue = document.querySelector('#numInput').value;
            const num = parseInt(inputValue, 10);
            if (!num || num < 1) {
                displayResult.innerHTML = '<p>Please enter a valid integer greater than 0.</p>';
            } else {
                factorialWorker.postMessage(num); // Send input to worker
            }
        });
    } else {
        displayResult.innerHTML = '<p>Sorry, your browser doesn\'t support Web Workers.</p>';
    }
});

// Function to display factorial results in a table
function displayFactorialsInTable(factorials) {
    const table = document.createElement('table');
    table.style.width = '100%';
    table.setAttribute('border', '1');
    
    const headerRow = table.insertRow();
    headerRow.insertCell().textContent = 'Number';
    headerRow.insertCell().textContent = 'Factorial';
    
    factorials.forEach((fact, index) => {
        const row = table.insertRow();
        row.insertCell().textContent = `${index + 1}`;
        row.insertCell().textContent = fact;
    });
    
    const displayResult = document.querySelector('#output');
    displayResult.innerHTML = ''; // Clear previous results
    displayResult.appendChild(table); // Add the table to the display
}
