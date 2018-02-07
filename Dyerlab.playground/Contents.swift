//: Playground - noun: a place where people can play

import Cocoa

var vals = [0.75,0.25]

print(vals)

let val = 1-vals.map{$0*$0}.reduce(0,+)
print(val)


let raw = "un    94    2_32    A    C    .    PASS    NS=155;AF=0.016;locori=p    GT:DP:AD    0/0:11:11,0    0/0:5:5,0    0/0:15:15,0    0/0:19:19,0"


extension String {
    var condensedWhitespace: String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}

let trimmedString = raw.condensedWhitespace.components(separatedBy: " ")


let c = raw.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }

print(c)

let alleles = ["A", "C"]
let idx = [0,0]
print( alleles[idx])
