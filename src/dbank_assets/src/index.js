import {dbank} from "../../declarations/dbank"; //import this from the declarations


window.addEventListener("load", async function(){
    // console.log("Finished Loading....");

    upDate();
});

document.querySelector("form").addEventListener("submit", async function(event){
    event.preventDefault()
    // console.log("submitted");

    const button = event.target.querySelector("#submit-btn");

    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdraw-amount").value);

    button.setAttribute("disabled", true);

    // allows for a topUp onto currentAmount
    if(document.getElementById("input-amount").value.length != 0){
        await dbank.topUp(inputAmount); //apply topUp function from main.mo file
    }

    // allows for a withdraw onto currentAmount
    if(document.getElementById("withdraw-amount").value.length != 0){
        await dbank.withDraw(outputAmount); //apply withDraw function from main.mo file
    }

    // apply compound function from main.mo file
    await dbank.compound();
    
    upDate();

    document.getElementById("input-amount").value = "";
    document.getElementById("withdraw-amount").value = "";

    button.removeAttribute("disabled");
})

async function upDate(){
    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerHTML= currentAmount.toFixed(2);
}