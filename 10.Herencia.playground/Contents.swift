//Las clases en Swift no heredan de una clase universal, como pasa en java con Object, si no específicamos una clase padre, esta clase no heredará de ninguna.

class Vehicle {
    //Atributos que seran heredados por otras clases
    var currentSpeed = 0.0
        
    //metodo que sera heredado por otras clases
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
vehicle.currentSpeed = 10.5

//////////////////
// Subclases
//////////////////

//heredamos usando ":" despues del nombre de la clase. Diferente de java
//ya que en java se usa la palabra "extends"
class Bicycle: Vehicle {
    //heredamos todos los atributos y metodos automaticamente de la
    //clase padre
    //Ademas tiene el atributo "hasBasket"
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

//propiedades del padre
bicycle.currentSpeed = 15.0

//la herencia en principio podemos heredar de todas las clases
//que queramos, no importa que tengan herencias superiores.

//subclase de subclase
class Tandem: Bicycle {
    //tenemos todos los metodos y atributos de Bicycle
    //y de Vehicle
    
    //Además tenemos esta otra propiedad
    var currentNumberOfPassengers = 0
}

var tandem = Tandem()//inferencia
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0

//recordar que en swift existe lo que se llama la inferencia de tipos
//es decir, tandem se decide en tiempo de ejecucion que va a ser de
//tipo Tandam

//Recordemos las propiedades de la herencia, con una referencia de tipo
//superior podemos apuntar a cualquier objeto de tipo inferior, pero
//no a la inversa. Por ejemplo, en este caso podemos con una referncia
//de tipo vehiculo por demos apuntar a una bicicleta o a un Tandem, pero
//con una referncia de tipo Tandem no podemos apuntar a un bicicleta o
//a un vehiculo

//ojo, esto da error, por inferencia el tandem es de tipo tandem
//tandem = bicycle
//Esto en cambio funciona, ya que con una referencia padre podemos apuntar a cualquier objeto que herede de ella
vehicle = bicycle
dump(vehicle)
vehicle.currentSpeed = 30.0

//////////////////
// Sobreescritura
//////////////////
//La sobreescritura es cuando tenemos un metodo hijo que se llama
//exactamente igual que el padre, y tambien tiene los mismo argumentos
//de entrada y el mismo tipo

//Podemos sobreescribir tanto computed properties como funciones, incluso variables de clase (si son computed)
class Tractor : Vehicle {
    //En swift hay que poner la palabra reservada "override" a diferencia
    //de java que se hacia de manera automatica
    
    override func makeNoise() {
        print("Chu chu! Vamos a las tierras!")
    }
    
    //No es muy habitual sobrescribir variables de clase
    override class var variableParasobreEscribir: String {
        return "ejem"
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

let tractor = Tractor()
print(tractor.makeNoise())
print(tractor.currentSpeed)//heredado de vehiculo
//para acceder a propiedades de clase recordemos que se tiene que hacer
//a traves de la clase
print(Tractor.variableParasobreEscribir)
//Para subscript
//toy[5]
//toy.subscriptDelPadre(index: 5)
tractor.currentSpeed = 50//ejecutamos las propiedades observadoras
                        //de manera automática

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

