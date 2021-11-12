//Esto sería un comentario de una linea

/*
 Esto seria un comentario
 de varias lineas
*/

//Dentro de XCODE lo que escribamos se guarda automaticamente

//Podemos declarar constantes con la palabra "let"
let maximoNumeroDeIntentos = 10;

//Podemos ver que no estamos poniendo el tipo de la variable
//Swift es un lenguaje TIPADO, es decir, las variables tienen
//un tipo de variable.

//Poner el tipo de la variable es optativo, si no lo ponemos
//swift hace lo que se llama "Inferencia de tipos", es decir,
//en tiempo de ejecucion decide el tipo de la variable, y esa
//variable permanecera de ese tipo durante el resto del programa

//Podemos ejecutar codigo pulsando el boton de play que hay
//sobre el numero de linea

//Podemos declarar variables con la palabra "var"
var variable1 = 25;//Esta variable es entera
variable1 = 45

//Esto de aqui abajo fallaria, variable1 es de tipo String
//variable1 = "Steve Rogers";

//Podemos decir el tipo de la variable al mismo tiempo
//que la declaramos, es decir, en tiempo de compilacion
var variableString : String = "Esto sería una frase"

//Otras declaraciones
var numeroDouble = 70;//Este numero seria un Int
var numeroDouble2 = 70.0//Este numero SI que seria un double
var numeroDouble3 : Double = 70;//Tambien seria un double

//Una de las vetajas del "azucar sintactico" es que no hace falta poner ";"
print(maximoNumeroDeIntentos)
print(variable1)

//Podemos concatenar Strings con "+"
print("El valor de la variable String  es: " + variableString)

//OJO esto no vale para otras variables que no sean String
//print("El valor de variable1 es: " + variable1)

//Podemos solucionarlo de dos maneras
//1- Convertir el entero en un String
//En este caso estamos creando un objeto nuevo de tipo String. Notese que no se pone la palabra "new"
print("El valor de la variable String es: " + String(variable1))

//2- Expandir la variable dentro del String.
// Expandir la variable quiere decir que dentro de una cadena
// queremos obtener el valor de la variable
print("El valor de la variable String es: \(variable1)")

//3- Si lo que queremos hacer es imprimirlo por pantalla, tambien podemos poner comas ya que la funcion "print" admite varios parametros de entrada
print("El valor de la variable String es:",variable1)
print("El valor:",variable1,"y otra vez",variable1)

// Podemos declarar varias variables dentro de una misma linea
var x = 0.0, y = 1.0, z = 3.0

//Si ponemos directamente un entero o double no hace falta convertirlo
print(x)

//Podemos decarlar variables en una mima linea con tipo
var cadena1, cadena2, cadena3 : String

//Para saber el tipo que guarda una variable, podemos usar la funcion "type"
type(of:cadena1)//String
print(type(of:cadena1))
print(type(of: variable1))//INT

//La tecla "windows" es la tecla "cmd" en Mac
//Para copiar pegar en maquina virtual "windows + c" y "windows + v"

//Si teneis instaladas las "vmwaretools", podeis copiar text de esta maquina virtual la la maquina host. Podeis pulsar "windows + c" en esta maquina virtual y pulsar "control + v" en la maquina anfitriona o host. Tambien se puede a la inversa, de host a MV

//Podemos hacer alias sobre los tipos de las variables con la palabra reservada "TYPEALIAS"
//La utilidad es cuando tenemos clases muy grandes y quereis acortarlas en vuestro codigo
typealias ti = Int //mote, ti sera ahora "Int"
var numero1 : ti = 56
var numero2 : ti;//MiTipoEntero - Int
numero1 = 67
print(numero1)

//Tuplas
//Son equivalentes a las estructuras de C.
//Lo que hacen es permitir agrupar objetos entre si
var tupla1 = (45, 37, 89)
//Por ejemplo si queremos guardar nombre, apellidos, edad y peso
var tupla2 = ("Hommer","Simpson",38,100)
//Nombre, Apellidos, edad, peso, numero de hijos varones y hembras (array)
var tupla3 = ("Marge", "Simpson",36,60,[1,2])

//Aceder a los valores
print(tupla1.0)//45
print(tupla2.0)//Hommer
print(tupla3.1)//Simpson

print(tupla2)

//Podemos cambiar el valor de una tupla
tupla2.2 = 40//edad de hommer a 40
print(tupla2)

//Las tuplas no son como los arrays, no podemos ampliarlas una vez creadas. El siguiente codigo daria error
//tupla2.4 = 5

//Podemos crear tuplas con tipos por defecto en vez de inferidos
var tuplaDeclarada : (Int, String, Double) = (1,"Bart",45.5)
print(tuplaDeclarada)

// Esto daría error ya que
//tuplaDeclarada.2 = "45.5"

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

//Si queremos imprimir emoticonos, podemos hacerlo con
//ctrl+windows+espacio en la maquina virtual
print("💋")

//Optionals
//Utilizaremos opcionales cuando una variable pueda no tener valor, es decir, apunte a nulo, en swift nulo se representa por "nil". Las variables normales (vistas hasta ahora) no pueden apuntar a "nil"

//var variableNula : String = nil //Error porque es una variable normal, es decir, NO es Optional

//Para crear una varialbe como Optional tenemos varias maneras.

//1. Podemos usar el operador "?" al final el tipo de la variable. De esta manera ya podemos tener en una variable valores nulos (nil)
var variableNula : String?//Se pone "?" despues del tipo
variableNula = nil
variableNula = "Valor de la variable"

//En swift todo es un objeto, por lo que si creamos una variable entera sufre
//la misma problematica con los optionals
var numeroNulo : Int?
numeroNulo = 34
numeroNulo = nil

var numero3 = 45;
//numero3 = nil //error porque por defecto las variables NO son optional
print(type(of: numeroNulo))
print(type(of: numero3))

//El concepto de optinal esta muy ligado al concepto de "envoltorio" o en ingles tipo "wrapper". Un objeto tipo wrapper es un objeto que envuelve a otro objeto

//Podemos tener problemas en caso de que queramos trabajar con variables optionales y variables que no lo sean
var variableNormal : String = "Esto es un String"
//No podemos apuntar directamente desde una variable normal a una variable optional
//variableNormal = variableNula //Error

//Si que podemos apuntar con una variable optional a una variable normal
variableNula = variableNormal
//print(variableNula)

//Como podemos solucionarlo?
//Tenemos que hacer un "unwrapper" o "desenvolver" la variable optional poniendo "!" al final de la variable optional
variableNormal = variableNula!
print(variableNormal)

//Ojo con valores nulos!
variableNula = nil
//La siguiente linea no daría error en tiempo de compilacion, pero si lo daria en tiempo de ejecucion, así ojo con los posibles nulos
//variableNormal = variableNula!//Esto da error
//Veremos como solucionar esto más adelante

//Podemos hacer que los optionals hagan un "auto-unwrapper"
var variableAutoUnwrapper : String! = "Pepe" //hacemos un optional auto-unwrapper
variableNormal = variableAutoUnwrapper //ahora no tengo que hacer un unwrapper especifico (poner "?"), ahora swift lo hace de manera automatica

//Podemos en swift hacer autounwrapper en los if
if let cadena3 = variableAutoUnwrapper{
    print("Tiene contenido",cadena3)
}else{
    print("El valor es nulo")
}































