
/////////////////
// Computed Properties
////////////////
//Este tipo de propiedades no almacenan ningún valor, sino que proporcionan getter y setter a otras propiedades. Estan tanto en estructuras como en clases
//Obligatorio -> Si ponemos un Set, necesitamos un Get, pero si ponemos un Get no tenemos porque poner un Set

struct User {
    //estas dos variables tendrían el getter y setter por defecto
    //y son capaces de almacenar valores
    var name: String //esta propiedad guarda el nombre
    var surname: String //esta propiedad guarda el apellido
    
    //ahora vamos a declarar una computed property con nuestro propio getter y setter
    //En este caso será equivalente a hacer un getCompleteName y un setCompleteName en java
    var completeName: String {
        get {//user.completeName
            return name + " " + surname
        }
        
        set(username) {//user.completeName = "Aitor Menta"
            let values = username.split(separator: " ")
            name = String(values[0])
            surname = String(values[1])
        }
    }
    
    //tambien el setter se puede declarar sin parametro, entonces el parametros de entrada será "newValue"
    //este metodo es equivalente al anterior
    var username: String {
        get {
            return name + " " + surname
        }
        
        set {//se crearia automaticamente el parametro "newValue"
            let values = newValue.split(separator: " ")
            name = String(values[0])
            surname = String(values[1])
        }
    }
    
    //podemos hacer solo get en una computed propertie
    var readOnlyProperty: String {
        //get { //la palabra get seria optional
            return "Esta es solo de lectura"
        //}
    }
}
var user = User(name: "fulano", surname: "de tal")
print(user.completeName)//invocamos el get de la propiedad
user.completeName = "Aitor Menta"//invocamos el set de la propiedad
print(user.name)
print(user.surname)
print(user.completeName)

user.username = "Harry Potter"
print(user.username)
print(user.name)
print(user.readOnlyProperty)//solo podemos acceder, no modificar


/////////////////
// Lazy Stored Properties
////////////////
// Son Propiedades que su valor inicial no es calculado hasta que no se utiliza por primera vez. Por lo tanto SIEMPRE tienen que ir como variables (var)

//Este tipo de propiedades son útiles cuando su valor inicial depende de factores externos cuyos valores no los conocemos hasta después de instanciar la clase, y no queremos crear memoria hasta entonces

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
// La instancia de DataImporter para la propiedad de importer todavía no se ha creado ya que todavía no se ha utilizado
dump(manager)
//Cuando accedemos a ella por primera vez se crea
print(manager.importer.filename)
dump(manager)

/////////////////
// Property Observers
////////////////

//Se utilizan para detectar cambios en las propiedades, son llamadas siempre que alguna cambia de valor. No son necesarias poner las dos
//Las podemos usar en cualquier propiedad menos en las de tipo Lazy

class StepCounter {
    //queremos que totalStep cada vez que cambie de valor
    //se ejecute un metodo
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {//este metodo será llamado justo antes de llamar a la propiedad, es decir, antes de que se cambie el valor de la propiedad totalStep. Si no damos parametro (newTotalStpes) en esta funcion se crea por defecto "newValue"
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

