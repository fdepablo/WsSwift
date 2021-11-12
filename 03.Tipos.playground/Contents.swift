import UIKit

var str = "Hello, playground"

//Vamos a ver los tipos mas importantes en Swift y algunos metodos y formas de trabajar
//En Swift todos los tipos son objetos, no hay primitivos

//Enteros
let numero : Int //declaracion en tiempo de compilacion
let numerosDeLaMano = 5 //creacion con inferencia de tipos
//Para numeros grandes podemos poner "_" entre los numeros para facilitar su lectura
let numeroEstrellas = 1_000_000_000

print(type(of:numero))//Int
print(type(of:numerosDeLaMano))//Int
print(type(of: numeroEstrellas))//Int

//otros sistemas numericos
let nBinario = 0b101;
let nOctal = 0o21;
let nHexa = 0xAAFF;

print(nBinario)//5
print(nOctal)//17
print(nHexa)//43775

//Double
var decimalUno : Double
//Son numeros en coma flotante hasta 64 bits, con precion de 15 digitos
decimalUno = 12.12345
var decimalConExponente = 1.212345e8
print(decimalUno)
print(decimalConExponente)

//Float
//Son numeros en coma flotante hasta 32 bits, con precision de 5 digitos
//Mejor utilizar Double
var numeroFloat : Float = 12.12345

//Booleanas
var verdadero : Bool = true//declarando
var falso  = false//inferencia

//Caracteres
let caracter : Character = "f"//Se ponen con comillas dobles

//Strings
//Representan cadenas de caracteres
var cadena = "Esto es un String muy bonito"
var cadena2 : String = "Esto seria otra cadena"

//Dos maneras de crear un objeto String
cadena = "Homer"
cadena2 = String("Homer")//Constructor, no existe la palabra "new"
//Ambas maneras son equivalentes

//Comparacion
if cadena == cadena2 {
    print("las cadenas son iguales")
}

//String vacio
if cadena.isEmpty {
    print("Cadena vacia")
}else{
    print("La cadena no esta vacia")
}

//Mutabilidad
//Un objeto es inmutable cuando no podemos cambiar su estado durante su ciclo
//de vida
//El estado de un objeto es el valor de sus atributos
//En swift hacemos un String mutable con "var"
var stringMutable = "Caballo"
stringMutable += " y Caballa"

//Hacemos inmutable con let
let stringInmutable = "Vaca"
//No podemos hacerlo
//stringInmutable += " Toro"

//Recorrer un string
cadena = "Estoy feliz 😀😀"

//podemos usar un for-each
for otroCaracter in cadena {
    print(otroCaracter)
}

//podemos crear un String a partir de un array de caracteres
let caracteresDeGato : [Character] = ["C","A","T","!"]
//Usamos el constructor String y le pasamos el array, en swift los objetos
//se crean sin "new"
let stringDeGato = String(caracteresDeGato)
print(stringDeGato)

//Concatenacion
let string1 = "Hola "
let string2 = "como estas?"
var string3 = string1 + string2

//tambien con append
string3.append(" estoy bien :)")
print(string3)

//tambien podemos concatenar con "+="
string3 += " Me alegro mucho! :D"
print(string3)

//interpolacion
var numeroDoble : Double = 74.3456
string3.append(" Mira que numero acabo de calcular: ")
//string3 += numeroDoble
//no podemos concatenar a string otra cosa que no sea String
string3 += String(numeroDoble)
print(string3)
string3 += " y ahora pongo otra vez el numero \(numeroDoble)"//interpolacion
print(string3)

//Caracteres unicode
let sonrisa = "😀"
let sonrisa2 = "\u{1f600}"
print(sonrisa)
print(sonrisa2)

//comparaciones con nil, se hacen igual
var cadena3 = "Goku"//tipo normal
var cadena4 : String! = "Goku"//tipo optional
cadena4 = nil
if(cadena3 == cadena4){
    print("Son iguales")
}

//String multilinea
//Caracterisca de swift por la cual podemos crear de manera sencilla
//textos con varias lineas
var html = "<html>"
html += "<head><title>Mi pagina web</title></head>"
html += "<body>"
//Esto es un poco rollo... :(
//Podemos usar strings multilinea (""")
var htmlMultilinea = """
<html>
    <head>
        <title>Mi pagina web</title>
    </head>
    <body>
        <h1>Mi pagina :)</h1>
    </body>
</html>
"""
print(htmlMultilinea)

//contar caracteres de un String
print("El numero de caracteres de la palabra \(cadena3) es \(cadena3.count)")

//Tratamiento de caracteres con String
//String es un conjunto de caracteres con alguna peculiaridad... :(
let saludo = "Guten Tag!"
//Cada posicion del string tiene un "tipo indice" asociado llamado "String.Index"
//el cual corresponde con la posicionde cada caracter del String
print(saludo)
//print(saludo[0])//no podeemos hacerlo :( :(

//Para manejar las posiciones de un String tenemos que jugar con una serie de funciones y
//propiedades
//startIndex -> propiedad que representa la primera letra de la cadena
//endIndex -> propiedad que representa LA SIGUIENTE POSICION a la ULTIMA LETRA de la cadena

print(saludo.startIndex)//Me dice la posicion 1
print(saludo[saludo.startIndex])//G
//print(saludo[saludo.endIndex])//esta da error
//La clase String tiene un metodo que se llama "index" que nos devuelve un caracter
//de la cadena, bajo algunas condiciones
//Ej, para sacar el ultimo caracter
var indiceCreado = saludo.index(before: saludo.endIndex)
print(saludo[indiceCreado])

//podemos contar caracteres desde el principio
//por ejemplo 7 caracteres desde el principio
//La funcion index esta sobrecargada, en este caso primero le pasamos
//desde donde queremos empezar, y a continuacion le damos cuanto caracteres
//queremos recorrer
indiceCreado = saludo.index(saludo.startIndex, offsetBy: 7)
print(saludo[indiceCreado])//a

indiceCreado = saludo.index(saludo.endIndex, offsetBy: -4)
print(saludo[indiceCreado])

//insertar caracteres en una posicion concreta
var bienvenida = "welcome"
bienvenida.insert("!", at: bienvenida.endIndex)
print(bienvenida)

//Casting, combiar de tipos
//En swift debemos de usar los constructores de clase para cambiar de tipo
let numeroEntero = 12//El tipo sera Int, por inferencia
let numeroDoble2 = Double(numeroEntero)
print(type(of: numeroDoble2))

//Si hay riesgo de casteo, swift devuelve un optional
cadena = "ppe"
let enteroConvertido = Int(cadena)//esto seria un optional, en caso de que no pueda convertirlo
                                //apuntaria a nil
print(enteroConvertido ?? "valor no convertido")//ponemos "!" para desenvolver el optional
