import UIKit

func toplama(sayi1: Int, sayi2: Int){
    print(sayi1 + sayi2)
}
toplama(sayi1: 3, sayi2: 4)


func carpma(n1: Int, n2: Int) -> Int {
    return n1 * n2 // Eğer fonksiyon tek satır ise return demeden de çıktı alabiliriz.
}

print(carpma(n1: 3, n2: 5))

let sonuc = carpma(n1: 4, n2: 6)

print(sonuc)

func carpma2(_ n3: Int, _ n4: Int) -> Int { // Eğer fonksiyonun paremetresini yani "n1" gibi görmek istemiyorsak _ alt tire
    return n3 * n4 // Eğer fonksiyon tek satır ise return demeden de çıktı alabiliriz.
}

let yeniSonuc = carpma2(3, 5) // Burada direkt rakamları yazdık.

print(yeniSonuc)
