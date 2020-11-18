//////////////
// For-In
//////////////

//en un array
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

//en un diccionario
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

//por rango
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//si no necesitamos variable de control
for _ in 1...3 {
    print("ole tu!")
}

let minutes = 60
//No incluye el ultimo valor
for tickMark in 0..<minutes {
    print(tickMark)//hasta el 59
}

//un for clasico como en java(desde, hasta y salto)
//OJO! Con "to" NO incluye el último valor
let minuteInterval = 5
var result = [Int]()
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    result.append(tickMark)
}
print(result)

//Con "through" SI incluye el último valor
result = []
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    result += [tickMark]
}
print(result)

//Si no queremos la variable de bucle
for _ in stride(from: 1, through: 5, by: 1){
    print("hola!")
}

//////////////
// While
//////////////
var number = 48
while ( number != 0) { // se pueden quitar los parentesis
    number = number - 1
}
print(number)

number = 48
//este es un do while de toda la vida
repeat {
    number = number - 1
} while number != 1
number

//////////////
// Continue
//////////////
//Cuando encuentra un "continue" dentro de un bucle, deja de
//ejecutar el codigo siguiente y vuelve al "for" incrementando
//la variable de control
for index in 0...5 {
    if index == 1 {
        continue
    }
    print(index)
}

//imprimir numeros del 1 al 10 menos los pares
for index in 1...10 {
    if(index % 2 == 0){
        continue
    }
    print(index)
}
print("")

//////////////
// Break
//////////////
//Cuando encuentra un "break" dentro de un bucle, deja de
//ejecutar el codigo siguiente y rompe la ejecucion del "for",
//saliendo inmediatamente de él
for index in 0...5 {
    if index == 1 {
        break
    }
    print(index)
}

//////////////
// If
//////////////

//como los de toda la vida
if 10 <= 32 {
    print("Pues si, pues si")
}

if (10 <= 5) {//podemos poner parentesis o no
    print("Pues no, pues no")
} else if 5 <= 10 {
    print("Pues si, pues si")
} else {
    print("pues tampoco va a ser")
}

var cadena : String? = "pepe"

//En caso de que "cadena" tenga valor distinto a nil
//entonces la constante "valor" coje el valor de "cadena"
//Si cadena apunta a nil entonces no entra por el if
if let valor = cadena {
    print(cadena)//se convierte en un optional
}else{
    print("Apunta a nil")
}

/* Equivalente a Java
if(persona != null){
    syso(persona.getNombre);
}*/

//////////////
// Switch
//////////////
//Estructra equivalente a if-else if-else
//admite string como opción a evaluar
//NO hace falta poner un break por cada case.
//solamente entramos en el case en caso de que sea igual
//en java tiene comportamiento en cascada, por lo tanto es diferente
let someCharacter: Character = "a"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

let anotherCharacter: Character = "B"
switch anotherCharacter {
//case "a":                 // Error!, en swift por lo menos tienen que contenter una linea
case "A":
    print("The letter A")
case "b", "B":              //Podemos valorar varios casos
    print("The letter B")
default:
    print("Not the letter A ni b ni B")
}

//también con rangos
let approximateCount = 100
let countedThings = "moons orbiting Saturn"
var naturalCount: String
//print(naturalCount)//Error porque no se ha inicializado
//OJO! Es buena praxix inicializar siempre las variables

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5://no se incluye el ultimo valor
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print(naturalCount)

/////////////
// Fallthrough
//////////////

//Si queremos un switch de toda la vida podemos usar fallthrough
//la filosofia cambia, si queremos ejecución en cascada hay que decirlo
//explicitamente, mientras que en java es su comportamiento por defecto
let diaDeLaSemana = "MARTES"
switch diaDeLaSemana {
case "LUNES":
    fallthrough
case "MARTES":
    fallthrough
case "MIERCOLES":
    fallthrough
case "JUEVES":
    fallthrough
case "VIERNES":
    print("Dia de la semana")
case "SABADO":
    fallthrough
case "DOMINGO":
    print("FINDE!!!! 😄")//iconos con ctrl+windows+espacio
default:
    print("No se ni en que día vivo :(")
}

//Podemos trabajar con tuplas en los swift
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0)://podemos decir que sea el punto X el que sea
    print("\(somePoint) is on the x-axis")
case (0, _)://(0,1) (0,2) (0,3)... son puntos validos
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2)://(1,1)
    print("\(somePoint) is inside the box")//se ejecuta este
default:
    print("\(somePoint) is outside of the box")
}

