//: Playground - noun: a place where people can play

import Cocoa

var n1 = Int(arc4random_uniform(15))
var n2 = Int(arc4random_uniform(15))
var n3 = Int(arc4random_uniform(15))
var n4 = Int(arc4random_uniform(15))


let str1 = String(n1, radix: 2)
print(str1)

let str2 = String(n2, radix: 2)
print(str2)

let str3 = String(n3, radix: 2)
print(str3)

let str4 = String(n4, radix: 2)
print(str4)

if(n1>n2){
    print(n1)
}
else{
print(n2)
    
}

if(n3>n4){
    print(n3)
}
else{
    print(n4)
}





