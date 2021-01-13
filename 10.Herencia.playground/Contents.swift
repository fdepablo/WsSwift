//Las clases en Swift no heredan de una clase universal, como pasa en java con Object, si no específicamos una clase padre, esta clase no heredará de ninguna.

class Vehicle {
    var currentSpeed = 0.0
    var description: String {//Computed Properties GET
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
    
    class var variableParasobreEscribir: String {
            return "ajam"
    }
    
    /* Ver ejemplo siguiente para la herencia con subscript
    subscript(index: Int) -> Int {
        return 42
    }*/
}

var vehicle = Vehicle()
vehicle.description

//////////////////
// Subclases
//////////////////

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

//propiedades del padre
bicycle.currentSpeed = 15.0

//subclase de subclase
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
var tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
tandem.description

//ojo, esto da error
//tandem = bicycle
//Esto en cambio funciona, ya que con una referencia padre podemos apuntar a cualquier objeto que herede de ella
vehicle = bicycle
dump(vehicle)

//////////////////
// Sobreescritura
//////////////////

//Podemos sobreescribir tanto computed properties como funciones, incluso variables de clase (si son computed)
class Tractor : Vehicle {
    override var description: String {
        return "Toys do not travel"
    }
    override func makeNoise() {
        print("Si no son hot wheels, no son los auténticos")
    }
    
    override class var variableParasobreEscribir: String {
        return "ejem"
    }
    
    //en property observer
    override var currentSpeed: Double {
        willSet {
            print("ahora va a ser \(newValue)")
        }
        
        didSet {
            print("se ha cambiado current Speed")
        }
    }
    
    //Para subscripts
    /*
    override subscript(index: Int) -> Int {
        return 24
    }
    
    func subscriptDelPadre(index:Int) -> Int {
        return super[5] //super para el padre
    }*/
}

let toy = Tractor()
toy.description
toy.makeNoise()
toy.currentSpeed
//Para subscript
//toy[5]
//toy.subscriptDelPadre(index: 5)
Tractor.variableParasobreEscribir

toy.currentSpeed = 50

//Podemos conseguir que tanto las propiedades como métodos no se sobreescriban añadiendo la palabra reservada "final", como en java
class Train : Vehicle {
    final var maxSpeed: Double {
            return 300
    }
    
    final func siQuieresPuedes() {
        
    }
}
//Esta clase daria error ya que no podemos sobreescribir
//class Talgo : Train {
//    override var maxSpeed: Double {
//        return 280
//    }
//    
//    override func siQuieresPuedes() {
//        
//    }
//}

