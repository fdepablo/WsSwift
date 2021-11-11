
////////////
// Clases y estructuras. Trabajando con Funciones
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

//recordemos que cuando pasamos un argumento de entrada/salida
//a una funcion debemos de poner el simbolo "&"
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



