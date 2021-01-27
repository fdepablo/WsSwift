//En swift se llaman métodos a las funciones que hay dentro de una clase o una estructura

//////////////////
// Métodos de instancia
//////////////////

//Hace falta una instancia de la clase para llamarlos
class Counter {
    //atributo de clase
    var count = 0
    //Metodo de instacia
    func increment() {
        count += 1
    }
    //sobrecarga de metodos, metodos con igual nombre pero
    //con distinto numero y tipo de parametros
    func increment(by amount: Int) {//parametro exterior e interior
        count += amount
    }
    func reset() {
        count = 0
    }
}
//creamos el objeto (instanciamos la clase)
let counter = Counter()
counter.increment()
print(counter.count)//1
counter.increment(by: 5)
print(counter.count)//6
counter.reset()
print(counter.count)//0

//////////////////
// Métodos de clase, equivalente a metodos estáticos en java
//////////////////

//Se llaman directamente con la clase. Ojo! se hace con la palabra "class" no con la palabra "static" como en las propiedades
class SomeClass {
    class func someTypeMethod() {
        print("Esto es un método muy bonito")
    }
}
//para usar este tipo de metodos no tenemos que crear el objeto
//se usan directamente a traves de la clase
SomeClass.someTypeMethod()

//////////////////
// Self
//////////////////
//La referencia a si mismo, de toda la vida de dios, equivalente al "this" en java

struct Point {
    //tenemos 2 atributos
    var x = 0.0, y = 0.0
    //en esta funcion tengo un argumento de entrada que es "x"
    //que tiene el mismo nombre que el atributo "x"
    //Por visibilidad, el argumento "x" oculta dentro de la funcion
    //la "x" del atributo. Para poder acceder a atributo "x" de
    //la clase podemos usar "self"
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
        x += deltaX//incrementamos x
        y += deltaY//incrementamos y
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
    /*
    func moveBy(x deltaX: Double, y deltaY: Double, z deltaZ: Double) {
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

