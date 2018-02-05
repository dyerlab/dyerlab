//: Playground - noun: a place where people can play

import Cocoa

var vals = [0.75,0.25]

print(vals)

let val = 1-vals.map{$0*$0}.reduce(0,+)
print(val)
