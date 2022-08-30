for i in 1...10 { // 10 dahil olmasın 1..<10
    print(i)
}

var a = 1

while a < 10 {
    print("Rakamlar \(a)")
    a += 1 // arttırmak için yoksa sürekli aynı rakam tekrar ederdi
}

var sayilar  = [4,8,12,16,23,42]

for (indexNumber, sayi) in sayilar.enumerated() {
    print("\(indexNumber) - \(sayi)")
}