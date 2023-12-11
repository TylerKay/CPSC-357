//import UIKit
//
//print("Welcome to Swift2");
//
//var x = 10
//
//for index in 1...20 {
//    let y = index * x
//    x -= 1
//    print(y);
//}
//
////: Rich text comment. Top right and click show documentation





//let x : Int;
//
//x = 10;
//print(x);


//var myString:String? = nil; // myString can be a string
//var myString:String? = "IOS Course";
//
//if myString != nil {
//    print(myString!);
//} else {
//    print("myString has a nil value")
//}


//print((1, "zebra") < (2, "apple"))
//print((3, "apple") < (3, "bird"))
//print((4, "dog") == (4, "dog"))


enum Temperature {
    case hot
    case warm
    case cold
}

func displayTempInfo (temp: Temperature){
    switch temp {
        case.hot:
            print("Hot")
        case.warm:
            print("Warm")
        case.cold:
            print("Cold")
    }
}

displayTempInfo(temp: Temperature.cold)
