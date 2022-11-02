import Debug "mo:base/Debug" //this imports the Debug module from motoko library

actor DBANK {
  // by adding the word stable infront of a var makes it othorgonally persistent(maintains the state of the variable)
  stable var currentValue = 300; //create variable

  // currentValue := 100; //change variable

  // let id = 245345435636; //to set immutable variables

  // Debug.print("hello Dunia")
  // Debug.print(debug_show (currentValue));

  // Debug.print(debug_show (id)); // prints out the immuntable set varible

  ///////FUNCTIONS
  // a function to increment using Candid
  public func topUp(amount : Nat) {
    currentValue += amount;

    Debug.print(debug_show (currentValue));
  };

  // a function to decrement using Candid

  public func withDraw(amount : Nat) {

    let tempValue : Int = currentValue - amount; //Int, include that so that it does not throw an error

    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("this number cannot compute");
    };
  };

  // this only reads the amount balance, it does this asynchronously without waiting for the rest of the page
  public query func checkBalance() : async Nat {
    return currentValue;
  };

  // topUp();
};
