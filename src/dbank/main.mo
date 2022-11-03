import Debug "mo:base/Debug"; //this imports the Debug module from motoko library
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBANK {
  // by adding the word stable infront of a var makes it othorgonally persistent(maintains the state of the variable)
  stable var currentValue : Float = 300; //create variable
  // currentValue := 100; //change variable

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show (startTime));

  // let id = 245345435636; //to set immutable variables
  // Debug.print("hello Dunia")
  // Debug.print(debug_show (currentValue));
  // Debug.print(debug_show (id)); // prints out the immuntable set varible

  ///////FUNCTIONS
  // a function to increment using Candid
  public func topUp(amount : Float) {
    currentValue += amount;

    Debug.print(debug_show (currentValue));
  };

  // a function to decrement using Candid
  public func withDraw(amount : Float) {

    let tempValue : Float = currentValue - amount; //Int, include that so that it does not throw an error

    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("this number cannot compute");
    };
  };

  // this only reads the amount balance, it does this asynchronously without waiting for the rest of the page
  public query func checkBalance() : async Float {
    return currentValue;
  };

  // topUp();

  // below we will set a function to calculate the compound interest one is likely to save up using the formula
  // compound interest formula Cp = P(1 + r/n)^nt

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
};
