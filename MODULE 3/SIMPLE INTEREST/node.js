function calculateInterest() 
{

    let principal = parseFloat(document.getElementById('principal').value);
    let rate = parseFloat(document.getElementById('rate').value);
    let time = parseFloat(document.getElementById('time').value);
    let additionalInfo="base Intrest";

    if (principal < 500 || principal > 10000) 
       {
          alert("Principal amount must be between 500 and 10000.");
       return;
       } 
    if (principal < 1000) {
      rate = 5;
    } 
    else if (principal >= 1000 && principal <= 5000) 
    {
      rate = 7;

    } else {
      rate = 10;
    }
  
    
    if (time > 5) {
      rate += 2;
      additionalInfo = 'An additional 2% has been added for a time period greater than 5 years.';
    }
  
    
    let interest = (principal * rate * time) / 100;
    let totalAmount = principal + interest;
    console.log(interest);
    console.log(totalAmount);
   
    document.getElementById('interest').innerHTML = interest.toFixed(2);
    document.getElementById('totalAmount').innerHTML = totalAmount.toFixed(2);
    document.getElementById('additionalInfo').innerHTML = additionalInfo;
  
  }