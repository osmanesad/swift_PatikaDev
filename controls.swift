var password = "1316"

if password == "1316" {
    print("Şifre doğru")
    } if password == "123" else {
    print("Şifreniz çok zayıf, yeniden deneyin.")
} else {
    print("Şifreniz uyuşmuyor.")
}

switch password {
case "1234":
print("Şifreniz çok zayıf, yeniden deneyin.")
case "1316":
print("Şifreniz güçlü değil. Şifre doğru. Hoşgeldiniz.")
    
default:
print("Şifreniz uyuşmuyor.")
}


enum PassworOption {
    case zayif
    case dogru
    case uyusmuyor
}

var PassworTwo: PassworOption = .zayif

switch PassworTwo {
    case .zayif: 
    print("Şifreniz çok zayıf, yeniden deneyin.")
    case .dogru:
    print("Şifreniz güçlü değil. Şifre doğru. Hoşgeldiniz.")
    case .uyusmuyor:
    print("Şifreniz uyuşmuyor.")
} // defult belirtmeden bitirebilirz.