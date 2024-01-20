/*The input form*/
const inputForm = document.getElementById('input-form');
const cashInput = document.getElementById('cash');
const priceInput = document.getElementById('price');
const cidInput = document.getElementById('cid');
const button = document.getElementById('purchase-btn');
const resultText = document.getElementById('change-due');
const drawerTotalText = document.getElementById('drawerTotal');
const cidTable = document.getElementById('cidTable');
const resetBtnSpan = document.getElementById('reset-btnspan');

//console.log("Input", cashInput, priceInput);

//the requirenemt did not give intructions to input cid  
//cash 100 price 3.26 ; float problem cash 100 price 3.37
//let cid = [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100],];
//let cid = [["PENNY", 0.01], ["NICKEL", 0], ["DIME", 0], ["QUARTER", 0], ["ONE", 1], ["FIVE", 0], ["TEN", 0], ["TWENTY", 0], ["ONE HUNDRED", 0]];
//let cid = [["PENNY", 0.5], ["NICKEL", 0], ["DIME", 0], ["QUARTER", 0], ["ONE", 0], ["FIVE", 0], ["TEN", 0], ["TWENTY", 0], ["ONE HUNDRED", 0]];
//Edge case let's say diff= 0.31 cash=0.61 price=0.30; cash=0.61 price=0.06
//let cid = [["PENNY", 0.01], ["NICKEL", 0], ["DIME", 0.3], ["QUARTER", 0.25]]
//let cid = [["PENNY", 0.01], ["NICKEL", 0], ["DIME", 0.3], ["QUARTER", 0.25],["ONE", 1]]


button.addEventListener('click', function(e) {
    e.preventDefault();
    
    // Additional logging for debugging
    console.log("cashInput.value:", cashInput.value);
    console.log("priceInput.value:", priceInput.value);

    let cid = [];
    cid=   getParts(cidInput.value, '[', ']');
    //console.log("cid",cid)//return as string
    //console.log('cidStr', cid.toString())

    const cash = Number(cashInput.value.trim());
    const price = Number(priceInput.value.trim());

console.log("////START addEventListener // cash: ",cash," price: ",price, "//////////////")
    
    resultText.innerHTML = ``;

    if (checkInput(cash, price)) {
        return;
    };
    
    let resultArr = checkCashRegister(price, cash, cid);
        console.log(resultArr);
    // Update status messages
    resultText.innerHTML = `Status: ${resultArr.status}`;
    resultText.innerHTML += `<br>`;
    resultText.innerHTML += resultArr.change.map(([currency,value])=>{
        return `${currency} $${Number.isNaN(value) ? Number(value).toFixed(2) : parseFloat(value).toFixed(2)}
`;
    }
    ).join('<br/>');
    //console.log("sumAfter", result.sumAfter)

// Update Change in drawer
drawerTotalText.innerHTML = `Change in drawer:<br/>
&nbsp;$${resultArr.sumBefore.toFixed(2)}(Before)<br/>
${resultArr.status === "OPEN" ? `-$${parseFloat((cash - price).toFixed(2))}(Change to Customer)<br/>=$${resultArr.sumAfter.toFixed(2)}(After)` : ''}`;

    cidTable.innerHTML = `<table id="cidTable" class="tableDrawer">
<tr>
<th>Coin(s) / Note(s)</th>
<th>Number</th>
<th>Sub-total</th>
</tr>
</table>`;

    const cidTableTEXT = resultArr.cidAfter.map(([currency,amount,currencyValue,coinNum])=>{
        return `<tr><td>${currency}<br/>
$${parseFloat(currencyValue).toFixed(2)}</td>
<td>${coinNum}</td>
<td>$${Number.isNaN(amount) ? Number(amount).toFixed(2) : parseFloat(amount).toFixed(2)}</td></tr>`;
        // <td>$${amount}</td></tr>`;
    }
    ).join('');

    cidTable.insertAdjacentHTML('beforeend', cidTableTEXT);

    cidInput.value =
 resultArr.cidAfter.map(item => "[" + [item[0], item[1]].map(subItem => JSON.stringify(subItem)).join(", ") + "]").join(", ");

});//addEventListener

/*check Inputs*/
function checkInput(cash, price) {
    if (cashInput.value.trim() === '' || priceInput.value.trim() === '' || isNaN(cash) || isNaN(price) || cash <= 0 || price <= 0) {
        resultText.innerHTML = `Please enter valid numbers for cash and price`;
        //drawerTotalText.reset(); //to do .reset() is only a method on a HTMLFormElement
        return true;
    } else if (cash === price) {
        resultText.innerHTML = `No change due - customer paid with exact cash`;
        cashInput.value = '';
        priceInput.value = '';
        return true;
    } else if (cash < price) {
        alert('Customer does not have enough money to purchase the item');
        resultText.innerHTML = 'Customer does not have enough money to purchase the item';
        cashInput.value = '';
        return true;
    }
}

/*calculation helper*/
//https://stackoverflow.com/questions/14867835/get-substring-between-two-characters-using-javascript
function getParts(sentence, first, last) {
  let goodParts = [];

  let startIndex = sentence.indexOf(first);

  while (startIndex !== -1) {
    const endIndex = sentence.indexOf(last, startIndex + 1);

    if (endIndex !== -1) {
      try {
        const substring = sentence.substring(startIndex + 1, endIndex);
        const parsedArray = JSON.parse('[' + substring + ']');
        if (Array.isArray(parsedArray)) {
          goodParts.push(parsedArray);
        }
      } catch (error) {
        console.error('Error parsing array:', error);
      }

      startIndex = sentence.indexOf(first, endIndex + 1);
    } else {
      break;
    }
  }

  return goodParts;
}


const currency = {
    "PENNY": 0.01,
    "NICKEL": 0.05,
    "DIME": 0.10,
    "QUARTER": 0.25,
    "ONE": 1.00,
    "FIVE": 5.00,
    "TEN": 10.00,
    "TWENTY": 20.00,
    "ONE HUNDRED": 100.00,
}

// Deep copy function for arrays 
//.slice() still references to the same objects
function deepCopy(arr) {
    return arr.map(subArray=>[...subArray]);
}
// Declare in the outer scope so they can be takeaway
let cidCoins;
let diff;
let change;
let result;
let cidCopy; //quarterError
let changeDueCopy; //quarterError
let maxQcoinUsedNum; //quarterError
let loopdiff;
let loopchange;

/*calculation*/
function numberOfCoins(cid) {
    //let cidCoins = cid.slice();
    cidCoins = deepCopy(cid);
    return cidCoins.map(item=>[item[0], // currency name
    parseFloat(item[1]).toFixed(2), // total amount in drawer
    parseFloat(currency[item[0]]).toFixed(2), //currency value
    parseFloat(item[1] / currency[item[0]]).toFixed(0)// number of coins
    ]);
}

function checkCashRegister(price, cash, cid) {

    change = [];
    diff = parseFloat((cash - price).toFixed(2));
    cidCoins = numberOfCoins(deepCopy(cid));
    //console.log("Before switch diff", diff)
   
    //sum in drawer
    const sumcid = parseFloat(cidCoins.reduce((accumulator,item)=>accumulator + parseFloat(item[1]), 0).toFixed(2));

    let result = {
        status: "",
        change: [],
        cidBefore: deepCopy(cidCoins),
        sumBefore: sumcid,
        cidAfter: deepCopy(cidCoins),
        sumAfter: "",
    };

    switch (true) {
    case (sumcid < diff):
        //console.log("case (sumcid<diff)")
        result.status = "INSUFFICIENT_FUNDS";
        result.change = [];
        result.cidAfter = deepCopy(cidCoins);
        result.sumAfter = sumcid;
        break;

    case (sumcid == diff):
        //console.log("case (sumcid=diff)")
        result.status = "CLOSED";
        result.change = deepCopy(cid);
        result.cidAfter = result.cidAfter.map(([currency,amount,currencyValue,coinNum])=>{
        resetBtnSpan.innerHTML =  `<br><br><button id="reset-btn" style="border-radius: 8px">Restart</button>`;
            return [currency, 0, currencyValue, 0]
        }
        );
        // all become 0
        result.sumAfter = sumcid - (cash - price);
        //should be 0
        break;
////////////////////////////////////////////////////////////////////////////////////////////////////////////
            
    case (sumcid > diff):
        //console.log("case (sumcid>diff)")
        console.log("before loop diff", diff)    
        // loop for coins, sorted in highest to lowest order, large value coin have priority
        let loopRemains = loopDrawer(diff, change, deepCopy(cidCoins), deepCopy(cidCoins));
        //console.log('loopRemains', loopRemains)
        
        //if (Number(loopRemains) !== Number(0)) {
            if (loopRemains.status !== "OPEN") {
            //check any remains after looping the drawer because large value coin have priority
              console.log(`result inside if status !== "OPEN"`, loopRemains)  
    //diff = parseFloat((Number(cashInput.value.trim()) - Number(priceInput.value.trim())).toFixed(2));
            console.log("before reverse loop diff", diff)

            //loop from another side, lower value coins have priority
            console.log("//reverse loop")
            loopRemains = loopDrawer(diff, change, deepCopy(cidCoins).reverse(), deepCopy(cidCoins).reverse());

            //if (Number(loopRemains) !== Number(0)) {
            if (loopRemains.status !== "OPEN") {  
                console.log("diff !== 0 After ++i loop", loopRemains)
                console.log('diff !== 0 INSUFFICIENT_FUNDS')
                result.status = "INSUFFICIENT_FUNDS";
                result.change = [];
                result.cidAfter = deepCopy(cidCoins);
                result.sumAfter = sumcid;
            } else {
                //Update display
                console.log("diff !== 0 After ++i loop",diff !== 0)
                console.log("result.status === OPEN, reverse loop")
                result.status = "OPEN";
                result.change = change;
                result.sumAfter = parseFloat(result.cidAfter.reduce((accumulator,item)=>{
                return accumulator + parseFloat(item[1]);
                    }, 0).toFixed(2));
            }
            
        }else{
            result = loopRemains; //deepCopy(loopRemains)
            console.log("result.status === OPEN, NOT reverse loop", "result",result)

        }//if (Number(loopRemains) !== Number(0))
    }//switch

    return result;
}

// loop every coins in the drawer
function loopDrawer(loopdiff, loopchange, loopcidBefore, loopcidAfter) {

    let q = Number(1);
    let quarterCoinUsedNum = Number(0);  
    const quarterArray = loopcidBefore.find(item => item[0] === 'QUARTER');

// Check if 'QUARTER' was found and access the third item
if (quarterArray) {
    q = quarterArray[3];
    quarterCoinUsedNum = quarterArray[3];

} else {
    // Handle the case when 'QUARTER' is not found
    console.log("No 'QUARTER' found in loopcidBefore");
    q = 1;
}

// Using quarterCoinUsedNum counting how many looping for drawer 
for (let ii = q; ii >= 0; --ii) {
    console.log("// START Looping ii /////////////////////////////////////")
    console.log("ii Loop:", ii);   
        // reset
    console.log("ii Loop Reset");  
 
    result = {
        status: "",
        change: [],
        cidBefore: deepCopy(cidCoins),
        sumBefore: parseFloat(cidCoins.reduce((accumulator,item)=>accumulator + parseFloat(item[1]), 0).toFixed(2)),
        cidAfter: deepCopy(cidCoins),
        sumAfter: "",
    };
    //console.log("Before reset loopdiff", loopdiff)    
    loopcidBefore =result.cidBefore;
    loopcidAfter=result.cidAfter;
    loopdiff = Number((Number(cashInput.value.trim()) - Number(priceInput.value.trim())).toFixed(2));
    loopchange = [];
    console.log("loopcidBefore", loopcidBefore)
        //console.log("cash", cash,"price",price,"loopdiff", loopdiff)
        //diff = Number((Number(cashInput.value.trim()) - Number(priceInput.value.trim())).toFixed(2));
        console.log("after reset and before loop, diff", diff, "loopdiff", loopdiff)
    
    for (let i = loopcidBefore.length - 1; i >= 0; --i) {
    
        console.log(i, "-th_loopdiff" , loopdiff, ", looking for",loopcidAfter[i][0],Number(loopcidBefore[i][3]))
        if (loopdiff >= loopcidBefore[i][2]) { 
                //count for the coins //make sure enough coins 
            let coinUsedNum = Math.min(
               Number(Math.floor(Number(loopdiff*100) / Number(loopcidBefore[i][2]*100))),
               Number(loopcidBefore[i][3])
            ); 
              /*      console.log(coinUsedNum,
                                "coinUsedNum",
                                Number(Math.floor(Number(loopdiff*100) / Number(loopcidBefore[i][2]*100))),
                                Number(loopcidBefore[i][3]))
              */
                if(loopcidAfter[i][0] ==="QUARTER"){
                    //check quarter numnber
                    //console.log(loopcidAfter[i][0], '=="QUARTER"')
                    coinUsedNum = ii;
                    //console.log("QUARTER coinUsedNum", coinUsedNum)
                }//check quarter numnber
            
        console.log(loopcidAfter[i][0],' will use ', coinUsedNum)
            
        let coinUsedCurrency= parseFloat(loopcidBefore[i][2]).toFixed(2);   
   //Minus the coins form drawer
            if (coinUsedNum > 0) {

                let coinUsedValue = coinUsedNum * coinUsedCurrency;
                coinUsedValue = coinUsedValue.toFixed(2);
                loopdiff = parseFloat((loopdiff - coinUsedValue).toFixed(2));
                let pushCharge = [loopcidBefore[i][0], coinUsedValue];
                loopchange.push(pushCharge);
                loopcidAfter[i][1] -= coinUsedValue;
                //total amount in drawer
                //fixing. chatGPT Suggested it's better to format the values only when displaying them.//No, forgot it
                loopcidAfter[i][1] = Number(parseFloat(loopcidAfter[i][1]).toFixed(2));
                loopcidAfter[i][3] -= coinUsedNum;
                //number of coins
                console.log("loop_i_loopchange", i,  loopchange)
                console.log("loop_i_cidAfter", i, loopcidAfter[i][0], loopcidAfter[i][1], loopcidAfter[i][3])
                //console.log("loop_i_loopdiff_After", loopdiff)
   
            }//if (coinUsedNum> 0)         

            
            }//if (loopdiff >= loopcidBefore[i][2]) 
             if (Number(loopdiff) === Number(0)) {
                 result.status = "OPEN";
                 result.change = loopchange;
                 result.cidBefore = deepCopy(cidCoins);
                 result.cidAfter = loopcidAfter;
                 result.sumAfter = parseFloat(result.cidAfter.reduce((accumulator,item)=>{
                        return accumulator + parseFloat(item[1]);
                        }, 0).toFixed(2));
            console.log('break i', i)
            //console.log("result break i", result)
            break; //break if not remains 
            }else if(Number(loopdiff) < Number(0)){
                 console.log("Break i loop to next ii loop as loopdiff below zero" ,loopdiff)
                 break;
            }
        }//i loop
             if (Number(loopdiff) === Number(0)) {
            console.log('break ii', ii)
            //console.log("result break ii", result)
            break;  
             }//break if not remains   
}//ii loop     
    let remains = loopdiff;
    console.log("remains break i ii", result)
    return result; 
}
