/*The input form*/
const inputForm = document.getElementById('input-form');
const input = document.getElementById('number');
const button = document.getElementById('convert-btn');
const resultText = document.getElementById('output');

inputForm.addEventListener("submit", function (e) {
  e.preventDefault();
  //parseInt parse a string and convert to an integer.
  let arabic = parseInt(input.value);

  if (Number.isInteger(arabic) && arabic > 0 && arabic < 4000) {
   convertToRoman(arabic);
  } else if (arabic <= 0) {
    resultText.innerHTML = `Please enter a number greater than or equal to 1`;
  } else if (arabic >= 4000) {
    resultText.innerHTML = `Please enter a number less than or equal to 3999`;
  } else {
    resultText.innerHTML = `Please enter a valid number`;
  }
});



//calculation
const table = {
  "M": 1000,
  "D": 500,
  "C": 100,
  "L": 50,
  "X": 10,
  "V": 5,
  "I": 1
};

function findKeyByValue(objTable, value) {
  const key = Object.keys(objTable).find(key => objTable[key] === value);
  return key || null;
}

function convertToRoman(num) {
  let len = num.toString().length;
  let digit = 1;
  let roman = "";

  for (let i = len - 1; i >= 0; i--) {
    let current = +num.toString()[i]; // Convert to number
    let remain = (current % 5);

    if (remain === 4) { // IV or IX
      if (current<5 ) { // IV 4
        roman = findKeyByValue(table, 1 * digit) + findKeyByValue(table, 5 * digit) + roman;
      } else { //IX 9
        roman = findKeyByValue(table, 1 * digit) + findKeyByValue(table, 5 *2* digit) + roman;
      }
    } else { //

      for (let j = 1; j <= remain; ++j) { //Add  I 
        roman = findKeyByValue(table, digit) + roman;
      }
        if (current >= 5) { //Add a V 
        roman = findKeyByValue(table, 5 * digit) + roman;
      }
    }

    digit *= 10;
  }
resultText.innerHTML = roman;
  return roman;
}

// Example usage:
//console.log(convertToRoman(99)); // Output: MMMDXLIX

