//: Playground - noun: a place where people can play

import Cocoa

var x = [0.75,0.25]

print(x)

let val = 1-x.map{$0*$0}.reduce(0,+)
print(val)
