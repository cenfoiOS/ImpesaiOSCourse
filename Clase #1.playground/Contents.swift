//: Playground - noun: a place where people can play

import UIKit

// Como declarar una variable sin inicialización
var nameWithoutInitialization: String?

// Como declarar una variable con inicialización
var nameWithInitialization = "Name"


// Como declarar una constante
let nameConstant = "Name"

nameWithoutInitialization = "Variable opcional"

// La manera correcta de hacer un unwrap de un opcional es usando un if let
if let nameWithoutInitialization = nameWithoutInitialization{
    print("La variable tiene \(nameWithoutInitialization.characters.count) caracteres")
}

//la forma no segura y no recomendada(solo si se sabe que el valor no es nil) de usar un unwrap de un opcional es la siguiente:
print("La variable tiene \(nameWithoutInitialization!.characters.count) caracteres")


func explicacionDeUnGuard(value: String?) -> Bool{
    guard let value = value else {
        return false
    }
    print(value)
    return true
}


enum CampoFaltante: Int {
    case primero = 1, segundo
}

func validarCampos(campo1: String?, campo2: String?) -> CampoFaltante?{
    guard let _ = campo1 else {
        return CampoFaltante.primero
    }
    guard let _ = campo2 else {
        return CampoFaltante.segundo
    }
    return nil
}

validarCampos(campo1: nil, campo2: "LLENO")
validarCampos(campo1: "LLENO", campo2: nil)
validarCampos(campo1: nil, campo2: nil)
validarCampos(campo1: "LLENO", campo2: "LLENO")




















