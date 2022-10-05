struct StructName {
    let someProperty: Int
    

    
    init(somePorperty: Int = 0){
        self.someProperty = somePorperty
    }
}

extension StructName{
    func getSomeProperty() -> Int {
        return someProperty
    }
}

class ClassNamae {
    var someProperty: String = ""
    
    func yourName() {
        print("My name is \(someProperty)")
    }
    
    init(someProperty: String = "ClassName"){
        self.someProperty = someProperty
    }
}

let className = ClassNamae(someProperty: "Osman Esad")
print(className.yourName())

let someStruct = StructName(somePorperty: 29)
someStruct.getSomeProperty()
print(someStruct.someProperty)
