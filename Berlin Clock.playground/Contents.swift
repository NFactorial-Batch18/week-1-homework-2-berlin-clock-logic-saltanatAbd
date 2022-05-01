import UIKit
import Darwin


let inputTime:String = "23:59:59"
    let arrStr = Array(inputTime)
    let hours = arrStr[0..<2]
    let hoursInt = Int(String(hours))
    let minutes = arrStr[3..<5]
    let minInt = Int(String(minutes))
    let seconds = arrStr[6...7]
    let secInt = Int(String(seconds))

extension Int: Sequence{
    public func makeIterator() -> CountableRange<Int>.Iterator{
        return (0..<self).makeIterator()
    }
}

func findTopHours(hoursInt:Int)->String{
    return getOnOff(lamps: 4, onSigns: (hoursInt/5))
}

func findBottomHours(hoursInt:Int)->String{
    return getOnOff(lamps: 4, onSigns: (hoursInt%5))
}

func findTopMinutes(minInt:Int)->String{
    return (getOnOff(lamps: 11, onSigns: (minInt/11), onSign: "YYR"))
}

func findBottomMinutes(minInt:Int) -> String{
    return (getOnOff(lamps: 4, onSigns: (minInt%5), onSign: "Y"))
}

func findSeconds()->String{
    if (secInt!)%2==0{
        return " R"}
    else {return " O"}
}

func getOnOff(lamps: Int, onSigns: Int) -> String{
    return getOnOff(lamps: lamps, onSigns: onSigns, onSign: "R")
}

func getOnOff(lamps: Int, onSigns: Int, onSign: String)->String{
    var out = " "
    for _ in onSigns{
        out += onSign
    }
    for _ in (lamps-onSigns){
        out += "O"
    }
    return out
}

print(findSeconds())
print((findTopHours(hoursInt: hoursInt!)))
print(findBottomHours(hoursInt: hoursInt!))
print(findTopMinutes(minInt: minInt!))
print(findBottomMinutes(minInt: minInt!))




