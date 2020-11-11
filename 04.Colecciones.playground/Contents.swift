///////////
//Arrays
///////////

//almacena variables del mismo tipo en una lista ordenada (según añadimos). admite repetidos
//Dos formas equivalentes
var generictInts: Array<Int>
var someInts = [Int]()//Mejor manera, usar esta en general

//creandolo con valores por defecto
//repeating: numero a repetir
//count: numero de veces que lo repetimos
var threeDoubles = Array(repeating: 2, count: 3)
var cuatroVecesUnUno = Array(repeating: 1, count: 4)
print(threeDoubles)

//concatenando. Solo si tienen el mismo tipo
var arrayConcatenado = threeDoubles + cuatroVecesUnUno

//Vaciar un array, una de las dos
arrayConcatenado = []
arrayConcatenado.removeAll()

//crear array de strings don datos
var shoppingList: [String] = ["Eggs", "Milk"]
let shoppingList2 = ["Eggs", "Milk"] //lo mismo, infiere el tipo
//si ponemos let a un array, el array sera inmutable, sus elementos
//seran constantes

print("array con \(shoppingList.count) elementos.")

//compara si está vacío
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

//Podemos preguntar si contiene un elemento
print(shoppingList.contains("Bananas"))
print(shoppingList.contains("Eggs"))

//añadir elementos al final, formas equivalentes
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

//añadir elementos a una posicion
//se desplazan los demas elementos hacia la derecha
shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)

//Cambiando elementos
shoppingList[0] = "Six eggs"
print(shoppingList)

//cambiar un rango de elementos
//sustituimos del elemento 1 al 6 por Bananas y Apples
shoppingList[1...6] = ["Bananas", "Apples"] //aunque no coincida el rango se puede cambiar
print(shoppingList)

//acceder elementos
var firstItem = shoppingList[0]
print(firstItem)
print(shoppingList)

//eliminar elementos y nos devuelve el elemento si queremos
let eggs = shoppingList.remove(at: 0)//posicion
let butter = shoppingList.removeLast()//ultimo
print(shoppingList)


//iterando
for item in shoppingList {
    print("item -> \(item)")
}

//como si fuera un map
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//podemos ordenarlos alfabeticamente
for item in shoppingList.sorted() {
    print("\(item)")
}

///////////
//Set
///////////

//almacena variables del mismo tipo en una lista desordenada. Usamos un Set en vez de un Array si el orden de los elementos no es importante. No admite elementos repetidos.
var letters = Set<Character>()
letters.insert("a")
print(letters)
letters = [] //sigue siendo de tipo Set<Caracter>, pero vacio
print(letters)

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"] //infiriendo el tipo, pero el Set tenemos que ponerlo Si o Si, si no, cómo sabe que queremos un Set y no un Array?

//notese que si imprimimos esto varias veces, salen con un orden diferente
print(favoriteGenres)

//metodos
favoriteGenres.isEmpty
favoriteGenres.insert("Jazz")
favoriteGenres.contains("Rock")
//podemos borrar y nos devuelve el elemento que borramos
let removedGenre = favoriteGenres.remove("Rock")
print(favoriteGenres.contains("Rock"))

//iterando
for genre in favoriteGenres {
    print("\(genre)")
}

///////////
//Diccionarios
///////////
//almacena variables siempre con (clave: valor)
var namesOfIntegers = [Int: String]()//clave Int - Valor String
//add elementos
namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)
//vaciar un diccionario
namesOfIntegers = [:]
print(namesOfIntegers)

//declarando el tipo
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//infiriendo el tipo
airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

airports.isEmpty
//add elementos
airports["LHR"] = "London"
airports["APL"] = "Apple International"
airports["LHR"] = "London Heathrow"

//podemos modificar un valor, nos devuelve el valor viejo
let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB")
print(oldValue)

print(airports)
//eliminar, manera mas bruta
airports["APL"] = nil
print(airports)

//eliminar, manera mas elegante
let removedValue = airports.removeValue(forKey: "DUB")
print(airports)

//Iterando, solo quedan YYZ y LHR
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

//Iterar por clave
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

//iterar por valor
for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//Sacar todas las claves
let airportCodes = [String](airports.keys)
print(airportCodes)

//Sacar todos los valores
let airportNames = [String](airports.values)
print(airportNames)








