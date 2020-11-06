
////////////
// Parámetros
////////////

//Requieren que se indique el tipo de los parámetros y de retorno
func suma(a: Int, b: Int) -> Int {
    return a + b //estos son internos & externos
}

let sum = suma(a: 3, b: 6)
//el orden importa
//sum = suma(b: 5, a: 11) //error!

//Pueden tener parámetros internos y externos.
func resta(primerParametroExterno parametroInternoA: Int, segundoParametroExterno parametroInternoB: Int) -> Int {
    return parametroInternoA - parametroInternoB //estos son internos
}

let rest = resta(primerParametroExterno: 4, segundoParametroExterno: 2) //estos son externos

//o mezclarlos
func sumPlus(a: Int, b: Int, thenMultiplyBy c: Int) -> Int {
    return (a + b) * c
}
let sumMul = sumPlus(a: 3, b: 4, thenMultiplyBy: 5)

//Parámetros por referencia
//en una función, todos los parámetros son constantes, no se pueden cambiar
func holamundoValor(a: String) {
    //a = a + "hola" //Error!
    print(a)
}

var variableValor = "mundo"
holamundoValor(a: variableValor)

//Tenemos que decirlo explicitamente si queremos
var parametro = "hola"
func holamundo(a: inout String) {
    a = a + " mundo"
}
//y poner un &
holamundo(a: &parametro)
parametro

//Casi mejor hacerlo así
func holaMundoRetornando(a: String) -> String{
    return a + " mundo";
}

holaMundoRetornando(a: "Hola")

////////////
//Valores por defecto
////////////

//omisión del parámetro externo
func sinParametroExterno(_ a: String) -> Void {
    print("hacemos cosas... " + a)
}
sinParametroExterno("hola")

//valores por defecto en los parametros
func addSuffixTo(a: String, suffix: String = "of the Storm") -> String {
    return a + suffix
}

addSuffixTo(a: "Heroes ")
addSuffixTo(a: "Objective", suffix: " C")

func addPrefix(prefix: String = "Harry", a: String) -> String {
    return prefix + a
}
addPrefix(a: "Potter")
addPrefix(prefix: "Objective", a: " C")

//podemos indicar que admiten 0 o mas valores en los parámetros
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    
    //prevenimos de que no entren parametros
    if(numbers.count == 0){
        return 0
    }
    
    for number in numbers {
        total += number
    }
    let media : Double = total / Double(numbers.count);
    return media;
}
arithmeticMean(1)
arithmeticMean(5,5,5)
arithmeticMean(3, 8.25, 18.75)//10
arithmeticMean()

////////////
// Valores de retorno
////////////

//un solo tipo
func returnAlwaysTrue() -> Bool {
    return true
}
returnAlwaysTrue()

//las funciones pueden devolver tuplas
func namesOfNumbers(a: Int) -> (Int, String, String) {
    var val: (Int, String, String)
    
    switch a {
    case 1:
        val = (1, "one", "uno")
    case 2:
        val = (2, "two", "dos")
    default:
        val = (a, "Go to Google!", "Vete a Google!")
    }
    
    return val
}

var (numero, en, es) = namesOfNumbers(a: 2)
numero
en
es

//Otro ejemplo
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
bounds.min
bounds.max
