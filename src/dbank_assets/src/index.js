import {dbank} from "../../declarations/dbank"; //import this from the declarations

window.addEventListener("load", async function(){
    // console.log("Finished Loading....");

    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerHTML= currentAmount;
});