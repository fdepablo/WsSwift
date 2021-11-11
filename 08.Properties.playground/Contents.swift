/////////////////
// Stored Properties
////////////////

//una stored property es una constante o una variable que se almacena como parte de una instancia de una clase o una estructura
//Esto seria equivalente a las propiedades NO estaticas de java, es decir, dinamicas

struct FixedLengthRange {
    var firstValue: Int//propiedad variable
    let length: Int//propiedad constante
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
print(rangeOfThreeItems.firstValue)
//rangeOfThreeItems.length = 3 //Error, length está como let -> constante

//crearmos una nueva estructura pero esta vez como constante
//la variable de la estructura
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6 //Error, rangeOfFourItems está como let -> constante
print(rangeOfFourItems.length) //Tampoco podría modificarla, ya que es constante
print(rangeOfFourItems.firstValue)

/////////////////
// Propiedades de Clase, cuando queremos que una propiedad NO pertenezca a la instancia. Equivaldría a las propiedades estaticas de java
////////////////

class Persona {
    static var edadMaximaDeLasPersonas = 100
    var nombre : String?
    var edad : Int = 0
    
    //Tambien podemos hacer una propiedad computada como estatica. Ver más abajo "Computed Properties"
    static var computedTypeProperty: Int {
        return 27
    }
    
}

var persona = Persona()
//accedemos a las propiedades de objeto o stored properties
//a traves del objeto
persona.nombre = "Fulano"
//accedemos a las propiedades de clase a traves de la clase
persona.edad = Persona.edadMaximaDeLasPersonas
dump(persona)//nos permite imprimir los valores de un objeto
