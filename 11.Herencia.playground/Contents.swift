//Las clases en Swift no heredan de una clase universal, como pasa en java con Object, si no específicamos una clase padre, esta clase no heredará de ninguna.

class Vehicle {
    var currentSpeed = 0.0
    var description: String {//Get
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
    
    class var variableParasobreEscribir: String {
            return "ajam"
    }
    
    subscript(index: Int) -> Int {
        return 42
    }
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
//Esto en cambio funciona
vehicle = bicycle
dump(vehicle)

//////////////////
// Sobreescritura
//////////////////

//podemos sobreescribir tanto computed properties como funciones, incluso variables de clase (si son computed)
class HotWheels : Vehicle {
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
    
    //en subscripts
    
    override subscript(index: Int) -> Int {
        return 24
    }
    
    func subscriptDelPadre(index:Int) -> Int {
        return super[5] //super para el padre
    }
}

let toy = HotWheels()
toy.description
toy.makeNoise()
toy.currentSpeed
toy[5]
toy.subscriptDelPadre(index: 5)
HotWheels.variableParasobreEscribir

toy.currentSpeed = 50

//Podemos conseguir que tanto las propiedades como métodos no se sobreescriban añadiendo: final
class Train : Vehicle {
    final var maxSpeed: Double {
            return 300
    }
    
    final func siQuieresPuedes() {
        
    }
}

//class Talgo : Train {
//    override var maxSpeed: Double {
//        return 280
//    }
//    
//    override func siQuieresPuedes() {
//        
//    }
//}

