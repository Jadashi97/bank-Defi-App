import Debug "mo:base/Debug" //this imports the Debug module from motoko library

actor DBANK {
  var currentValue = 300; //create variable
  currentValue := 100; //change variable

  let id = 245345435636; //to set immutable variables

  // Debug.print("hello Dunia")
  // Debug.print(debug_show (currentValue));

  Debug.print(debug_show (id)); // prints out the immuntable set varible
};
