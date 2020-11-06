////////////
// Cosas comunes
////////////

//Definen propiedades y almacenan valores
//Definen métodos que aportan funcionalidad
//Definen inicializadores
//Pueden ser expandidas para aumentar su funcionalidad

////////////
// Solo las estructuras
////////////
//Son variables normales, se guarda el valor del dato, no la posicion de memoria
// de donde se encuentra
//Definen constructures para todos sus parametros

////////////
// Solo las clases
////////////
//Podemos utilizar herencia
//Son variables de referencia
//Métodos cuando se libera de memoria (deinit)

////////////
// Definición
////////////

struct Resolution {
    var width = 0
    var height = 0
}

//Se nos crean constructores por defecto en las estructuras
let someResolution = Resolution()
let vga = Resolution(width: 640, height: 480)
let otra = Resolution(height: 480)
let otraMas = Resolution(width: 640)

//Error es let
//someResolution.height = 56;

//tambien es facil imprimirlos por defecto
print(someResolution)
print(vga)
print(otra)
print(otraMas)

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?//por defecto nil
}


//Las clases no tienen varios constructores por defecto
//Se vera más adelante
let someVideoMode = VideoMode()
//someVideoMode = VideoMode(interlaced: true)//Error!

////////////
// Propiedades
////////////

//con swift no nos hacen falta getter o setter
someResolution.width
someVideoMode.resolution.width
someVideoMode.resolution.width = 1280


let tenEighty = VideoMode()
tenEighty.resolution = Resolution(width: 1920, height: 1080)
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
//Notese que es "let", pero aun asi podemos seguir cambiando sus propiedades

//Para imprimir un objeto así no sale bien por defecto
print(tenEighty)

//mejor usar la función dump
dump(tenEighty)

//Las variables de Clases son referencias
let alsoTenEighty = tenEighty
print(alsoTenEighty.frameRate)
print(alsoTenEighty.frameRate = 30.0)
print(alsoTenEighty.frameRate)
print(tenEighty.frameRate)

//Las variables de estructuras son variables de referencias que
//se pasan por valor
print(someResolution)
var otraResolucion = someResolution
print(otraResolucion)
otraResolucion.width = 900
print(otraResolucion)
print(someResolution)

//No podemos comparar estructuras
//someResolution == otraResolucion //Error!

////////////
// Identity Operators
////////////
//Solo con clases. Con Struct o enums no se puede hacer, a parte de porque falla el compilador, estas cada vez que se asignan a una constante o variable, son copiadas
//esto solo compara instancias
if tenEighty === alsoTenEighty { //podemos usar tambien "!===" para distinto
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

////////////
// Clases o estructuras
////////////

//Las instancias de las estructuras siempre se pasan por valor y las de la clase siempre por referencia

func probandoInstancias(_ a: Resolution, _ b: VideoMode, _ c: inout Resolution) {
    //recordemos que por defecto los parametros son "let"
    //a.height = 34//Error!
    //Intentamos modificar el parametro cambiandolo
    var localParameter = a
    localParameter.width = 3840
    
    //Esto en cambio si podemos, porque una rerefencia aunque sea "let" podemos
    //seguir cambiando sus propiedades
    b.name = "CAMBIADO"
    //b = VideoMode() //Esto en cambio Error!!
    
    //Esto sería equivalente a lo anterior
    let localvideo = b
    localvideo.name = "CAMBIADO"
    
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


//Consideraremos crear una estructura si:

//1. simplemente queremos encapsular algunos valores.
//2. sea razonable pensar que los valores encapsulados sean copiados en lugar de referenciados cuando intanciemos la estructura.
//3. las propiedades almacenadas por la estructura son tipos simples, que también se espera que se copien en lugar de referenciarse
//4. no vamos a necesitar herencia

////////////
// Strings, Arrays y Diccionarios
////////////

//Todos están implementados como estructuras. Por lo tanto todos se copian cuando se asignan una nueva variable o constante o cuando los pasamos como parámetros en funciones

//Ojo que las clases de Foundation (NSString, NSArray, NSDiccionary) están implementadas como clases. Son antiguas

var nombres = ["Kyra", "Nina", "Lais"]
var nombresCopia = nombres //SE COPIA

//Si borramos en uno, NO se borra en el otro
nombresCopia.remove(at: 0)
print(nombres)
print(nombresCopia)


