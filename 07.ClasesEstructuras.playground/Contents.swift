////////////
// En swift tenemos dos maneras de encapsular información, por un lado tenemos las estructuras y por otro las clases
//
// Cosas comunes de las estructuras y de las clases
////////////

//Definen propiedades y almacenan valores
//Definen métodos que aportan funcionalidad
//Definen inicializadores o constructores para ambos

////////////
// Solo las estructuras
////////////
//a) Son variables normales:
    //1) se guarda el valor del dato,
    //2) no se guarda la posicion de memoria de donde se encuentra.
    //3) NO SON REFERENCIAS COMO EN LAS CLASES
//b) Definen constructures para todas sus propiedades, de manera automatica, swift los crea por nosotros

////////////
// Solo las clases
////////////
//a) Podemos utilizar herencia
//b) Son variables de referencia, es decir lo que se guarda es la posicion de memoria del objeto al que está apuntando
//c) Tiene métodos cuando se libera de memoria (deinit), como en java, lo que pasa es que no son muy usados (destructores)

////////////
// Definición de estructura, con la palabra "struct"
////////////

struct Resolution {
    //propiedades
    var width = 0
    var height = 0
    
    //Se nos crean constructores o inicializadores por defecto en las estructuras basandose en las propiedades
}

let someResolution = Resolution()
let vga = Resolution(width: 640, height: 480)
let otra = Resolution(height: 480)
var otraMas = Resolution(width: 640)

//notese que podemos hacer esto porque es variable "var"
otraMas.width = 1080
//Error es let, y es constante
//someResolution.height = 56;

print(otraMas.width)

//tambien es facil imprimirlos por defecto
print(someResolution)
print(vga)
print(otra)
print(otraMas)

//Definicion de clase
class VideoMode {
    var resolution = Resolution()//inferencia de tipos
    var interlaced = false
    var frameRate = 0.0
    var name: String?//por defecto nil
}


//Las clases NO tienen varios constructores por defecto
//Se vera más adelante
let someVideoMode = VideoMode()//se crea el objeto sin la palabra "new"
//someVideoMode = VideoMode(interlaced: true)//Error!

//someVideoMode es let, lo que quiere decir que no pudeo cambiar
//la referencia de donde esta apuntando
//someVideoMode = VideoMode()//Error!!
someVideoMode.name = "VGA"

////////////
// Propiedades
////////////

//con swift no nos hacen falta getter o setter, se crean automaticamente
print(someResolution.width)//seria el GET
someVideoMode.interlaced = true//seria el SET
someVideoMode.resolution.width = 1280//seria el SET
print(someVideoMode.resolution.width)//seria el GET

let tenEighty = VideoMode()//creamos modo de video full hd
tenEighty.resolution = Resolution(width: 1920, height: 1080)
//equivalente en java
//tenEigthy.setResolution(new Resolution(1920, 1080)
tenEighty.interlaced = true
tenEighty.name = "FULL HD"
tenEighty.frameRate = 30.0
//Notese que es "let", pero aun asi podemos seguir cambiando sus propiedades, ya que estamos trabajando con objetos

//Para imprimir un objeto así no sale bien por defecto
print(tenEighty)

//mejor usar la función dump para imprimir todo un objeto
dump(tenEighty)

//Las variables de Clases son referencias
let alsoTenEighty = tenEighty
print(alsoTenEighty.frameRate)
print(alsoTenEighty.frameRate = 60.0)
print(alsoTenEighty.frameRate)
print(tenEighty.frameRate)

//Las variables de estructuras son variables normales que
//se pasan por valor
print(someResolution)
var otraResolucion = someResolution
print(otraResolucion)
otraResolucion.width = 900
print(otraResolucion)
print(someResolution)

////////////
// Identity Operators "==="
////////////
//Solo se puede utilizar con clases. Con Struct o enums no se puede hacer, a parte de porque falla el compilador, estas cada vez que se asignan a una constante o variable, son copiadas
//Equivalente al "==" de java, comparando si ambas variables apuntan al mismo objeto
if tenEighty === alsoTenEighty { //podemos usar tambien "!===" para distinto
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

//No podemos comparar estructuras
//someResolution === otraResolucion //Error!
