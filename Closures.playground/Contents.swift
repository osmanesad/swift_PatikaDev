//Closures
let myFirstClosure = {
    print("Hello World")
}
myFirstClosure()

let topla: (Int, Int) -> Int = { num1, num2 in // İsim yerin $0 yani 1. değer ve $1 ikinci değer
    return num1 + num2
}

let result = topla(2,5)

print(result)

let sum: (Int, Int) -> Int = {return $0 + $1} // return zorunlu değil

let sonuc = sum(3,5)

print(sonuc)

let oddNumbers = [1,3,5,7,9,11]

let evenNumbers = oddNumbers.map {$0 - 1} // map Array içerisnde veri arıyor dönüyor.

print(evenNumbers)

let names = ["Osman","Ahmet","Engin","Ömer","Murat","Osman"]
//var isimler = [String]()
//
//for name in names {
//    if name == "Osman" {
//        isimler.append(name)
//    }
//}
//
//print(isimler.count)

let isimler = names.filter{$0 == "Osman"} // Daha kolay
print(isimler.count)



let didCounterValueChanged: (Int) -> Void = {newCounterValue in
    print(newCounterValue)
}

var counter: Int = 0 {
    didSet{
        didCounterValueChanged(counter)
    }
}

counter += 1
counter += 1
counter += 1
