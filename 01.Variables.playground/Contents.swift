//Esto sería un comentario de una linea

/*
 Esto seria un comentario
 de varias lineas
*/

//XCODE seria el IDE de IOS. Seria equivalente al Eclipse
// Swift es un lenguaje orientado a objetos y que aporta
//mucho "azucar sintactico", es decir, el codigo es bastante
//agradable para los programadores

//Dentro de XCODE lo que escribamos se autoguarda

//Podemos declarar constantes con la palabra "let"
let maximoNumeroDeIntentos = 10;
//Podemos ver que no estamos poniendo el tipo de la variable
//Swift es un lenguaje TIPADO, es decir, las variables tienen
//un tipo de variable.
//El tipo de la variable es optitivo, si no lo ponemos el tipo
//swift hace lo que se llama "inferencia de tipos", es decir,
//en tiempo de ejecucion decide el tipo de la variable, y esa
//variable permanecera de ese tipo durante el resto del programa
//Notese la diferencia con JavaScript

//podemos ejecutar codigo pulsando el boton de play que hay
//sobre el numero de linea

//podemos declarar variables con la palabra "var"
var variable1 = 25;//esta variable es entera
variable1 = 45
//Esto de aqui abajo fallaria, variable1 es de tipo String
//variable1 = "Son goku";

//podemos decir el tipo de la variable al mismo tiempo
//que la declaramos
var variableString : String = "Esto sería una frase"
var numeroDouble = 70;//este numero seria un Int
var numeroDouble2 = 70.0//este numero SI que seria un double
var numeroDouble3 : Double = 70;//tambien seria un double

//una de las vetajas del "azucar" es que no hace falta poner ";"

print(maximoNumeroDeIntentos)
print(variable1)

//podemos concatenar Strings con "+"
print("El valor de la variable String  es: " + variableString)

//OJO esto no vale para otras variables que no sean String
//print("El valor de variable1 es: " + variable1)

//Podemos solucionarlo de dos maneras
//1- Convertir el entero en un String
print("El valor de la variable String es: " + String(variable1))

//2- Expandir la variable dentro del String
// Expandir la variable quiere decir que dentro de una cadena
// queremos obtener el valor de la variable
print("El valor de la variable String es: \(variable1)")

// Otras maneras
var x = 0.0, y = 1.0, z = 3.0

//fijaos que si pongo directamente un entero o double no
//hace falta convertirlo
print(x)

//Podemos decarlar tambien con tipo
var cadena1, cadena2, cadena3 : String

//para saber el tipo que guarda una variable, podemos usar
//type
type(of:cadena1)//String
print(type(of:cadena1))

//Para copiar pegar en maquina virtual "windows + c" y
//"windows + v"

print(type(of: variable1))//INT

//Si teneis instaladas las vmwaretools, podeis copiar text
// de esta maquina virtual la la maquina host
// Podeis pulsar "windows + c" en esta maquina virtual
// y pulsar "control + v" en la maquina anfitriona o host
// Tambien se puede a la inversa, de host a MV

//Podemos hacer alias sobre los tipos de las variables
//TYPEALIAS
typealias MiTipoEntero = Int //mote
var numero1 : MiTipoEntero = 56
var numero2 : MiTipoEntero;//MiTipoEntero - Int
numero1 = 67
print(numero1)

//Tuplas
//Son equivalentes a las estructuras de C.
//Lo que hacen es permitir agrupar objetos entre si
var tupla1 = (45, 37, 89)
//por ejemplo si queremos guardar nombre, apellidos, edad y peso
var tupla2 = ("Hommer","Simpson",38,100)
//Nombre, Apellidos, edad, peso, numero de hijos
var tupla3 = ("Marge", "Simpson",36,60,[3])

//Aceder a los valores
print(tupla1.0)//45
print(tupla2.0)//Hommer
print(tupla3.1)//Simpson

print(tupla2)

//Podemos cambiar el valor de una tupla
tupla2.2 = 40//edad de hommer a 40
print(tupla2)

//Podemos crear tuplas con tipos por defecto
var qq : (Int, String, Double) = (1,"Bart",45.5)
print(qq)

// Esto daría error
//qq = (2,"Marge","pepe")

//Algunas operaciones con tuplas
//Pattern Matching
//Asignacion de variable muy flexible, donde indicamos el patros al compilador
//y el compilador se las busca para encajar los valores donde sea posible

//fijemonos el la tupla de hommer
//estamos creando 4 variables nuevas y swift intenta encajar cada valor de la
//tupla2 a cada una de las variables nuevas
var (nombre,apellidos,edad, peso) = tupla2
print(nombre)
print(apellidos)
print(edad)
print(peso)

peso = 110
print(tupla2)
//para cambiar el peso de la tupla
tupla2.3 = peso
tupla2.3 = 110

//si quereis extraer solamente X valores de una tupla unas variables, podemos usar "_"
var (nombre2,_,edad2,_,_) = tupla3
print(nombre2)
print(edad2)

//Optionals
//Utilizaremos opcionales cuando una variable pueda no tener valor, es decir, apunte
//a nulo, en swift nulo se representa por "nil". En una variable normal, que no sea optional
//no podemos apuntarla a "nil
//var variableNula : String = nil //error porque es una variable normal, es decir, NO es optional

//Para crear un optinal tenemos varias maneras
//podemos usar ?, de esta manera ya podemos tener en una variable valores nulos (nil)
var variableNula : String?//se pone "?" despues del tipo
variableNula = nil
variableNula = "Valor de la variable"

//En swift todo es un objeto, por lo que si creamos una variable entera sufre
//la misma problematica con los optionals
var numeroNulo : Int?
numeroNulo = 34
numeroNulo = nil

var numero3 = 45;
//numero3 = nil //error porque por defecto las variables NO son optinal
print(type(of: numeroNulo))
print(type(of: numero3))

//El concepto de optinal esta muy ligado al concepto de "envoltorio" o en ingles
//tipo "wrapper". Un objeto tipo wrapper es un objeto que envuelve a otro objeto

//Podemos tener problemas en caso de que queramos trabajar con variables optionales y variables
//que no lo sean
var variableNormal : String = "Esto es un String"
//No podemos apuntar directamente desde una variable normal a una variable optional
//variableNormal = variableNula //Error
//Si que podemos apuntar con una variable optional a una variable normal
variableNula = variableNormal
//print(variableNula)

//Como podemos solucionarlo?
//Tenemos que hacer un "unwrapper" o "desenvolver la variable optional"
//poniendo "!" al final de la variable optional
variableNormal = variableNula!
print(variableNormal)
//ojo con valores nulos!
variableNula = nil
//la siguiente linea no daría error en tiempo de compilacion, pero si lo daria
//en tiempo de ejecucion, así ojo con los posibles nulos
//variableNormal = variableNula!

//Podemos hacer que los optionals hagan un "auto-unwrapper"
var variableAutoUnwrapper : String! = "Pepe" //hacemos un optional auto-unwrapper
variableNormal = variableAutoUnwrapper //ahora no tengo que hacer un wrapper especifico
                                    //lo hace de manera automatica
































