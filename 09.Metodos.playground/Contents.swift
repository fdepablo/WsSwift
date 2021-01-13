//En swift se llaman métodos a las funciones que hay dentro de una clase o una estructura

//////////////////
// Métodos de instancia
//////////////////

//Hace falta una instancia de la clase para llamarlos
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {//parametro exterior e interior
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.count
counter.increment(by: 5)
counter.count
counter.reset()
counter.count

//////////////////
// Métodos de clase, equivalente a metodos estáticos en java
//////////////////

//Se llaman directamente con la clase. Ojo! se hace con la palabra "class" no con la palabra "static" como en las propiedades
class SomeClass {
    class func someTypeMethod() {
        print("Esto es un método muy bonito")
    }
}
SomeClass.someTypeMethod()

//////////////////
// Self
//////////////////
//La referencia a si mismo, de toda la vida de dios, equivalente al "this" en java

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

//////////////////
// Modificando valores dentro de métodos de instancia
//////////////////

//En clases nada especial
class Point2D {
    var x = 0.0, y = 0.0
    
    func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

//En estructuras o enums es diferente la declaración de métodos
struct Point3D {
    var x = 0.0, y = 0.0, z = 0.0
    
    //Declarando el método de manera normal no funciona, no podemos cambiar estos valores ya que las estructuras van por valor (a diferencia de los objetos que van por referencia.
    //La función de más abajo daría el siguiente error
    //error: 09.Metodos.playground:78:11: error: left side of mutating operator isn't mutable: 'self' is immutable
    //x += deltaX
    //~ ^
    
    /*func moveBy(x deltaX: Double, y deltaY: Double, z deltaZ: Double) {
        x += deltaX
        y += deltaY
        z += deltaZ
    }*/
    
    //tenemos que decir que pueda cambiar con la palabra "mutating"
    mutating func moveBy(x deltaX: Double, y deltaY: Double, z deltaZ: Double) {
        x += deltaX
        y += deltaY
        z += deltaZ
    }
}

var punto3d = Point3D()
punto3d.moveBy(x: 3.5, y: 5.0, z: 8.5)
print(punto3d)

