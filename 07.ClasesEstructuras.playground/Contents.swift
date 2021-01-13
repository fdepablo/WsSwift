////////////
// En swift tenemos dos maneras de encapsular información, por un lado tenemos las estructuras y por otro las clases
//
// Cosas comunes de las estructuras y de las clases
////////////

//Definen propiedades y almacenan valores
//Definen métodos que aportan funcionalidad
//Definen inicializadores o constructores para ambos
//Pueden ser expandidas para aumentar su funcionalidad (parecido a herencia)

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
//c) Tiene métodos cuando se libera de memoria (deinit), como en java, lo que pasa es que no son muy usados

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

//mejor usar la función dump
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

////////////
// Clases o estructuras
////////////

//Las instancias de las estructuras siempre se pasan por valor (se hace una copia de la variable cuando se pasa por parametro a una funcion). Mientras que las de la clases siempre por referencia, es decir se pasa el mismo objeto, no se hace copia del objeto

func probandoInstancias(_ a: Resolution, _ b: VideoMode, _ c: inout Resolution) {
    //Recordemos que por defecto los parametros son "let", excepto si le ponemos la palabra reservada "inout" que en este caso sería variable
    //a.width = 34//Error!
    //Podemos hacer una copia de "a" y luego trabajar con esos valores
    var localParameter = a
    localParameter.width = 3840
    
    //Esto en cambio si podemos, porque una rerefencia aunque sea "let" podemos seguir cambiando sus propiedades
    b.name = "CAMBIADO"
    //b = VideoMode() //Esto en cambio Error!! no podemos cambiar la referencia al ser let.
   
    //este si podemos modificarlo ya que es de entrada y salida y no "let"
    c.width = 3840
}

var video = VideoMode()
video.name = "video"
var resolution = Resolution(width: 320, height: 480)
var resolution2 = Resolution(width: 1920, height: 1080)

probandoInstancias(resolution, video, &resolution2)

print(video.name ?? "no hay nombre")
print(resolution.width)
print(resolution2.width)

//Consideraciones
//Consideraremos crear una estructura si:

//1. simplemente queremos encapsular algunos valores.
//2. sea razonable pensar que los valores encapsulados sean copiados en lugar de referenciados cuando intanciemos la estructura.
//3. las propiedades almacenadas por la estructura son de tipos simples, que también se espera que se copien en lugar de referenciarse
//4. no vamos a necesitar herencia

////////////
// OJO con Strings, Arrays y Diccionarios
////////////

//Todos están implementados como estructuras. Por lo tanto todos se copian cuando se asignan una nueva variable o constante o cuando los pasamos como parámetros en funciones

//Ojo para la gente de objective-C, que las clases de Foundation (NSString, NSArray, NSDiccionary) están implementadas como clases. Son antiguas

var nombres = ["Kyra", "Nina", "Lais"]
var nombresCopia = nombres //SE COPIA OJO! En java eran referencias

//Si borramos en uno, NO se borra en el otro
nombresCopia.remove(at: 0)
print(nombres)
print(nombresCopia)


