self.addEventListener('message', function(e) {
    const number = e.data;  // Get the number from the main thread
    const factorialResults = calculateFactorials(number);
    self.postMessage(factorialResults);  // Send results back to the main thread
}, false);

function calculateFactorials(n) {
    const resultArray = [];
    resultArray[0] = 1;  // 1! = 1
    
    // Calculate factorials
    for (let i = 1; i < n; i++) {
        resultArray[i] = resultArray[i - 1] * (i + 1);  // i + 1 because array index starts from 0
    }
    
    // Calculate the last factorial n!
    resultArray[n - 1] = resultArray[n - 2] * n;
    
    return resultArray;
}
