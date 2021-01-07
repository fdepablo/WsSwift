//Tanto las clases como las estructuras y los enums, pueden definir subscripts, se definen como un atajo para acceder a un elemento de una colección, lista, secuencia...

/////////////////
// Sintaxis
/////////////////

struct Sample {
    subscript(index: Int) -> Int {
        get {
            return 0
        }
        set(newValue) {
            // perform a suitable setting action here
        }
    }
}

//read-only subscript
struct Sample2 {
    subscript(index: Int) -> Int {
        return index
    }
}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

//Acceso
let ejemplo2 = Sample2()
print(ejemplo2[5])
let threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable[6])

/////////////////
// Uso
/////////////////

//siempre los hemos usado, por ejemplo, en los diccionarios para acceder a los valores por clave
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

//nomalmente se utilizan como un atajo para acceder a un elemento de una colección, lista, secuencia, pero podemos usarlos para lo que nos de la gana. (SwiftyJSON)

/////////////////
// Uso
/////////////////

//pueden contener mas de un parámetro y ser de cualquier tipo y pueden devolver cualquier tipo de dato
struct Sample3 {
    subscript(key: String) -> String {
        return "ejemplo"
    }
}

let sample3 = Sample3()
print(sample3["clave"])

//podemos tener mas de un subscript -> sobrecarga

struct Sample4 {
    subscript(key: String) -> String {
        return "ejemplo"
    }
    
    subscript(index: Int) -> Int {
        return 10
    }
    
    subscript(key: String, index: Int) -> String {
        return "muchos parametros"
    }
}

//el propio sistema infiere el tipo y llama al subscript adeacuado
let sample4 = Sample4()
sample4["clave"]
sample4[5]
sample4["",5]

//Normalmente lo usamos con listas, mapas, etc
struct Trabajador {
    var nombre : String = "Curro"
    var apellidos : String = "Gomez"
    var festivosMes : [Int] = [8,12,17,22,30]
    
    subscript(indice: Int) -> Int {
        return festivosMes[indice]
    }
}

let trabajador = Trabajador()
print(trabajador[1])//dame el segundo día que libras

