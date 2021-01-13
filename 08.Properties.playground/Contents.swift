/////////////////
// Stored Properties
////////////////

//una stored property es una constante o una variable que se almacena como parte de una instancia de una clase o una estructura
//Esto seria equivalente a las propiedades NO estaticas de java, es decir, dinamicas

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
print(rangeOfThreeItems.firstValue)
//rangeOfThreeItems.length = 3 //Error, length está como let -> constante

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6 //Error, rangeOfFourItems está como let -> constante
rangeOfFourItems.length //Tampoco podría modificarla, ya que es constante


/////////////////
// Propiedades de Clase, cuando queremos que una propiedad no pertenezca a la instancia. Equivaldría a las propiedades estaticas de java
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
persona.nombre = "Fulano"
persona.edad = Persona.edadMaximaDeLasPersonas
dump(persona)

/////////////////
// Computed Properties (declarar explicitamente getter y setter)
////////////////
//Este tipo de propiedades no almacenan ningún valor, sino que proporcionan getter y setter a otras propiedades. Estan tanto en estructuras como en clases
//Obligatorio -> Si ponemos un Set, necesitamos un Get, pero si ponemos un Get no tenemos porque poner un Set

struct User {
    //estas dos variables tendrían el getter y setter por defecto
    var name: String
    var surname: String
    
    //ahora vamos a declarar nuestro propio getter y setter
    var completeName: String {
        get {
            return name + " " + surname
        }
        
        set(username) {
            let values = username.split(separator: " ")
            name = String(values[0])
            surname = String(values[1])
        }
    }
    
    //tambien el setter se puede declarar sin parametro, entonces el parametros de entrada será "newValue"
    var username: String {
        get {
            return name + " " + surname
        }
        
        set {//se crearia el parametro "newValue"
            let values = newValue.split(separator: " ")
            name = String(values[0])
            surname = String(values[1])
        }
    }
    
    //podemos hacer solo get
    var readOnlyProperty: String {
        //get { //El get seria optional
            return "Esta es solo de lectura"
        //}
    }
}
var user = User(name: "fulano", surname: "de tal")
print(user.completeName)
user.completeName = "Aitor Menta"
print(user.name)

user.username = "Harry Potter"
print(user.username)
print(user.name)
print(user.readOnlyProperty)


/////////////////
// Lazy Stored Properties
////////////////
// Son Propiedades que su valor inicial no es calculado hasta que no se utiliza por primera vez. Por lo tanto SIEMPRE tienen que ir como variables (var)

//Este tipo de propiedades son útiles cuando su valor inicial depende de factores externos cuyos valores no los conocemos hasta después de instanciar la clase.

//En swift podemos utilizar la palabra reservada "lazy" en las propiedades para proporcionar este comportamiento

class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()//un array de String
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// La instancia de DataImporter para la propiedad de importer todavía no se ha creado.
dump(manager)
//Cuando accedemos a ella por primera vez se crea
print(manager.importer.filename)
dump(manager)

/////////////////
// Property Observers
////////////////

//Se utilizan para detectar cambios en las propiedades, son llamadas siempre que alguna cambia de valor.
//Las podemos usar en cualquier propiedad menos en las de tipo Lazy

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {//este metodo será llamado justo antes de llamar a la propiedad, si no damos parametro en esta funcion se crea por defecto "newValue"
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet (oldTotalSteps) {//Este metodo sera llamado justo despues de que el viejo valor se haya cambiado, si no damos parametro en esta funcion se crea por defecto "oldValue"
            if totalSteps > oldTotalSteps  {
                print("Added \(totalSteps - oldTotalSteps) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360



