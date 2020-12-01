
////////////
// FUNCIONES
// Parámetros
////////////

//Requieren que se indique el tipo de los parámetros de entrada y
//de salida
func suma(numero1: Int, numero2: Int) -> Int {//a y b serian entrada, y devolvemos un Int
    return numero1 + numero2 //estos son internos & externos, es decir se llaman igual tanto dentro como fuera de la funcion
}

let sum = suma(numero1: 3, numero2: 6)
//En java sería
//suma(3,6), cual es el numero1 y cual el 2? y que representa?

//el orden importa
//sum = suma(numero1: 5, numero2: 11) //error!

//Pueden tener parámetros internos y externos.
//Dentro de la funcion el parametro se llamara "parametroInternoA"
//Fuera de la funcion el parametro se llamara "primerParametroExterno"
func resta(primerParametroExterno parametroInternoA: Int, segundoParametroExterno parametroInternoB: Int) -> Int {
    return parametroInternoA - parametroInternoB //estos son internos
}

let rest = resta(primerParametroExterno: 4, segundoParametroExterno: 2) //estos son externos

func dividir(dividendo a : Int, divisor b: Int) -> Int{
    return a / b
}

let resultadoDivision = dividir(dividendo: 10, divisor: 2)
print(resultadoDivision)

//Podemos mezclar externos con internos
func sumPlus(a: Int, b: Int, thenMultiplyBy c: Int) -> Int {
    return (a + b) * c
}
let sumMul = sumPlus(a: 3, b: 4, thenMultiplyBy: 5)

//Omisión del parámetro externo, para darle un comportamiento como
//las funciones y metodos de java, es decir, que cuando invoquemos
//la funcion no tengamos que poner el nombre del parametro externo
func sinParametroExterno(_ a: String) -> Void {//Con Void no devolvemos nada
    print("hacemos cosas... " + a)
}
sinParametroExterno("hola")//ahora invocas la funcion como en java

//Parámetros por referencia y valor
//Referencia pasamos una "referencia" del objeto, es decir, si cambias el objeto se cambia fuera de la funcion
//Valor lo que pasamos es una copia del objeto, es decir, si lo cambiamos dentro no se cambia fuera de la funcion
//En una función, todos los parámetros son constantes, no se pueden cambiar
func holaMundoValor(a: String) {
    //a = a + "hola" //Error!
    print(a)
}

var variableValor = "mundo"
holaMundoValor(a: variableValor)

//Tenemos que decirlo explicitamente si queremos cambiar el valor
//usando "inout"
var parametro = "hola"
func holaMundo(a: inout String) {
    a = a + " mundo"//ahora si podemos cambiarlo
}
//OJO! 🤓, al invocar el metodo debemos de poner un "&" delante del
//parametro
holaMundo(a: &parametro)
print(parametro)

//Casi mejor hacerlo así, devolviendo el nuevo valor
func holaMundoRetornando(a: String) -> String{
    return a + " mundo retornado";
}

print(holaMundoRetornando(a: "Hola"))


////////////
//Valores por defecto
////////////
//En caso de que Suffix le pasemos un valor, tomará dicho valor
//en caso de que no le pasemos nada, tomara "of the Storm"
func addSuffixTo(a: String, suffix: String = "of the Storm") -> String {
    return a + suffix
}

//ahora podemos invocar la funcion de dos maneras
print(addSuffixTo(a: "Heroes "))//en este caso suffix tomara "of the storm"
print(addSuffixTo(a: "Objective", suffix: " C"))
print(addSuffixTo(a: "Objective "))

func addPrefix(prefix: String = "Harry", a: String) -> String {
    return prefix + a
}
print(addPrefix(a: "Potter"))
print(addPrefix(prefix: "Objective", a: " C"))

//Podemos indicar que admiten 0 o mas valores en los parámetros
//de entrada, en este caso el valor de entrada se convertiria
//en un Array
//En este caso quiero calcular la media de una serie de parametros
//parametros de entrada
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    
    //prevenimos de que no entren parametros
    if(numbers.count == 0){
        return 0
    }
    
    //numbers seria un array
    for number in numbers {
        total += number
    }
    
    let media : Double = total / Double(numbers.count);
    return media;
}

print(arithmeticMean(1))
print(arithmeticMean(5,5,5))
print(arithmeticMean(3, 8.25, 18.75,20,55,100))//10
print(arithmeticMean())

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
print(numero)
print(en)
print(es)

//Otro ejemplo con nombres en la tupla
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
print(bounds.min)
print(bounds.max)
