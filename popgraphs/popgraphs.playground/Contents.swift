import Cocoa
import Foundation


let json = """
{
    "nodes": [
        {
            "name": "BaC",
            "size": 12.15881,
            "color": "#FDAE61",
            "Region": "1",
            "Latitude": 26.59,
            "Longitude": -111.79,
            "group": "All"
        },
        {
            "name": "Ctv",
            "size": 3.880886,
            "color": "#FDAE61",
            "Region": "1",
            "Latitude": 29.73,
            "Longitude": -114.72,
            "group": "All"
        }
    ],
    "links": [
        {
            "source": 0,
            "target": 1,
            "weight": 9.052676
        }
    ]
}
"""

print(json)

enum parseJSONError: Error {
    case cannotSerialize
    case noData
}

func JSONParseGraph( string: String ) -> [String:Any]?  {
    if let data = string.data(using: String.Encoding.utf8 ) {
        
        do {
            let array = try JSONSerialization.jsonObject(with: data,
            options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
            return array!
        } catch {
            print("Error caught")
        }
        
    }
    return nil
}


if let res  = JSONParseGraph(string: json) {
    print( res.keys )
    for key in res.keys {
        print("In: \(key)")
        let vals = res[key] as! [Any]
        for i in 0..<vals.count {
            print("Element \(i):")
            let d = vals[i] as! [String:Any]
            print( d.keys )
        }
    }
}





