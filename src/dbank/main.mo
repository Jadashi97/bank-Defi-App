import Debug "mo:base/Debug" //this imports the Debug module from motoko library

actor DBANK {
  var currentValue = 300; //create variable
  currentValue := 100; //change variable

  let id = 245345435636; //to set immutable variables

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
    currentValue -= amount;

    Debug.print(debug_show (currentValue));
  };

  // topUp();
};
