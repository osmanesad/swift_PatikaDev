var arr = ["Kitap","Kalem","Mürekkep"] // Favori 1

var arr2 = [Int]() // Favori 2

var arr3: Array<Float> = []

arr2.append(3) // Diziye eleman ekleme.

print(arr2)

arr3.append(1.0)

print(arr3)

arr2.removeAll() // Array içini boşalttık.

arr3.remove(at: 0) // Indexte kaçıncı elemanı silmek istiyoersak

arr2.removeLast() // Son eleman ne ise onu siler, daha güvenli.
arr2.removeFirst()

arr2.popLast() // Son değeri silip yeniden getiriyor?

var dict = ["Ali": 3, "Murat": 48, "Cihan": 56]

var dict2 = [String: Float]()

var dict3: Dictionary<String,Double>

dict2["Pi"] = 3.14

dict2.removeValue(forKey: "Pi") //Sil
dict2["Pi"] = nil // Boşalt

print(dict2.count) // Kaç tane değer var.

print(dict2["Pi"])