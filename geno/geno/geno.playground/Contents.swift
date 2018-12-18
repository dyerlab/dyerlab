import Cocoa

var str = "Hello, playground"

var dict = [String:AnyObject]()
dict["Bob"] = Int( 23 ) as AnyObject
dict["Rob"] = Int( 42 ) as AnyObject
dict["Sue"] = String("Hello") as AnyObject

class Foo {
    public var value: Float
    
    init( val : Float ) {
        self.value = val
    }
}

dict["foo"] = Foo(val: 42) as AnyObject




print(dict)

let reduced = dict.compactMap {$0.value as? String}
print( reduced)

let customClass = dict.compactMap { $0.value as? Foo }
print( type(of: customClass ) )
print(customClass[0].value)




let line = "#CHROM    POS    ID    REF    ALT    QUAL    FILTER    INFO    FORMAT    PopA_15    PopA_16    PopA_17    PopA_18    PopA_20    PopA_21    PopA_22    PopA_23    PopA_24    PopA_25    PopA_26    PopA_27    PopA_28    PopA_29    PopA_30    PopA_31    PopA_32    PopA_33    PopA_34    PopA_35    PopA_36    PopA_37    PopA_38    PopA_39    PopA_40    PopA_41    PopA_42    PopA_43    PopB_01    PopB_02    PopE_01    PopE_02    PopE_03    PopE_04    PopE_05    PopE_06    PopE_07    PopE_08    PopE_09    PopE_10    PopE_11    PopE_12    PopE_13    PopE_14    PopE_15    PopE_16    PopE_17    PopE_18    PopE_19    PopE_20    PopF_01    PopF_02    PopF_03    PopF_04    PopF_05    PopF_06    PopF_07    PopF_08    PopF_09    PopF_10    PopF_11    PopF_12    PopF_13    PopG_01    PopG_02    PopG_03    PopG_04    PopG_05    PopG_06    PopG_07    PopG_08    PopG_09    PopH_01    PopH_02    PopH_03    PopH_04    PopH_05    PopH_06    PopH_07    PopH_08    PopH_09    PopH_10    PopH_11    PopH_12    PopH_13    PopJ_01    PopJ_02    PopJ_03    PopJ_04    PopJ_05    PopJ_06    PopJ_07    PopJ_08    PopJ_09    PopJ_10    PopJ_11    PopJ_12    PopJ_13    PopJ_14    PopJ_15    PopJ_16    PopJ_17    PopJ_18    PopJ_19    PopJ_20    PopJ_21    PopK_01    PopK_02    PopK_03    PopK_04    PopK_05    PopK_06    PopK_07    PopK_08    PopK_09    PopK_10    PopK_11    PopK_12    PopK_14    PopK_15    PopK_16    PopK_17    PopK_18    PopK_19    PopK_20    PopL_02    PopL_03    PopL_04    PopL_05    PopL_06    PopL_07    PopL_08    PopL_09    PopL_10    PopL_11    PopL_12    PopL_14    PopL_15    PopL_16    PopL_17    PopL_18    PopL_19    PopL_20    PopM_02    PopM_03    PopM_05    PopM_06    PopM_07    PopM_08    PopM_09    PopM_10    PopM_11    PopM_12    PopM_13    PopM_14    PopN_01    PopN_02    PopN_03    PopN_04    PopN_05    PopN_06    PopN_07    PopN_08    PopN_09    PopN_10    PopN_11    PopN_12    PopN_13    PopN_14    PopN_15    PopN_16    PopN_17    PopN_18    PopN_19    PopN_20    PopO_01    PopO_02    PopO_03    PopO_04    PopO_05    PopO_06    PopO_07    PopO_08"

print(line)

let vec = line.components(separatedBy: " ").filter {$0 != "" }
print(vec)

let startAt = vec.firstIndex(of: "FORMAT")?.advanced(by: 1)
print( "Genotypes start at: \(startAt ?? 0)")
