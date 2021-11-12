//Operadores

//OP. Asignacion

let a = 5 //el "=" asinga valores
var b = 10
b = a//asignamos el valor de "a" a "b"

//OP. Aritmeticos
print(1 + 2)//suma
print(1 - 1)//resta
print(2 * 4)//multiplicacon
print(4 / 2)//division
print(8 % 2)//modulo, resto de la division entera

//OP negativo
var c = -b //negativo de un numero

//OP composicion
b += 10//b = b + 10

//Op comparadores
print(1 == 1)//comparamos si es un valor igual a otro
print(1 != 2)//comparamos si es distinto
print(2 > 1)//mayor
print(1 < 2)//menor
print(2 >= 1)//mayor o igual
print(1 <= 2)//menor o igual

//Op ternario
//operador equivalente a un if-else, más corto
//Sintaxis -> EXPRESION_BOOLEANA ? CODIGO_EN_CASO_TRUE : CODIGO_EN_CASO_FALSE
let anchura = 40
let tieneCabecera = true
//supongamos que la altura de la columna es en funcion de si tiene cabecera
//y de la anchura, en caso de que tieneCabecera sea true, se ejecuta el codigo
//que hay despues de la "?" en caso contrario, se ejecuta el codigo de despues
//de ":"
var alturaColumna = anchura + ( tieneCabecera ? 50 : 20)
print(alturaColumna)//90

//Operador Nil-Coalescing (Nil-fusionado)
//Sintaxis -> OPTIONAL ?? VALOR
//Se utiliza mucho con optionals
//En caso de que OPTIONAL tenga un valor, entonces devuelve el valor del OPTIONAL
//En caso de que OPTIONAL sea nulo, entonces devuelve el valor de "b"
let colorPorDefecto = "Azul"
var colorDefinidoPorUsuario : String?//Se inicializan nil
//colorDefinidoPorUsuario = "Verde"

var color = (colorDefinidoPorUsuario ?? colorPorDefecto)
print(color)

//directamente podriamos hacer
print(colorDefinidoPorUsuario ?? "No hay color")

//Util cuando trabajamos con variables que no son optional para desenvolverlas de manera segura
var valorNil : String?
var valorNormal : String = ""
//En vez de hacer un "valorNil?" que terminaria dando una excepcion en tiempo de ejecucion, mejor utilizar Nil-Coalescing para desenvolver el objeto y en caso de que sea nil el valor, coger el otro valor
valorNormal = valorNil ?? "Vacio"
print(valorNormal)

//operadores logicos
//logical NOT (!variable)
//logical AND (variable1 && variable2)
//logical OR (variable1 || variable2)
var verdad = true
var mentira = !verdad
print(verdad)
print(mentira)
print(verdad && mentira)
print(verdad || mentira)






