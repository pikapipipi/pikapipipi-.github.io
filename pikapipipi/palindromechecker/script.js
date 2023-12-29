/*The input form*/
const inputForm = document.getElementById('input-form');
const input = document.getElementById('text-input');
const button = document.getElementById('check-btn');
const resultText = document.getElementById('result');

/*For calculation*/
let text = "";
let textArr = [];
let result = "";

/*For palindrome, 0 is NOT Palindrome*/
const imgPalindrome= ["0.png","1.png","2.png","3.png"] 

inputForm.addEventListener("submit", function (e) {
  e.preventDefault();

  //resetDisplay();
  // Get input value
  text = input.value;
  if(text.trim()!==""){
  // Clean up text and assign to textArr
  textArr = cleanUpText(text);
  // Check for palindrome
  checkPalindrome(textArr);
  }else{
      alert(`Please input a value`)
  }

});

// Clean up the input first, ignoring punctuation, case, and spacings as requested.
function cleanUpText(text) {
//  return text.toLowerCase().replace(/\W+/g, " ").split(/\s+/).filter((word) => word !== "");
    return text.toLowerCase().replace(/[^a-z0-9]/g, "").trim().split("").filter((char) => char !== "");
};

// Check for palindrome
function checkPalindrome(textArr) {
  let middle = Math.floor((textArr.length + 1) / 2);

  for (let i = 0; i < middle; ++i) {
    if (textArr[i] !== textArr[textArr.length - 1 - i]) {
      result = `<b>${text}</b> is not a palindrome`;
      resultText.innerHTML = result;
	resultText.insertAdjacentHTML('beforeend', `<br><br><img id="girafarig" src="0.png">`)
      return; // Return immediately once it's not a palindrome
    };
  };

result = `<b>${text}</b> is a palindrome`;
resultText.innerHTML = result;

let n = Math.floor(Math.random() * (3 - 1) + 1);
let imgHTML = `<br><br><img id="girafarig" src="${n}.png">`
resultText.insertAdjacentHTML('beforeend', imgHTML);
console.log(result);

};

function resetDisplay(){
  resultText.textContent = "";
  const imgGirafarig = document.getElementById('girafarig');
  if (imgGirafarig) girafarig.remove();
};
