//: Playground - noun: a place where people can play

import Cocoa

enum TextAlignment {
    case Left
    case Right
    case Center
}

var alignment: TextAlignment = TextAlignment.Left
alignment = .Right

switch alignment {
case .Left:
    print("Left, left")
    
case .Right:
    print("Right, right")
    
case .Center:
    print("Center, center")
}

/////////////////////////

enum LightBulb {
    case On
    case Off
    
    func surfaceTemperatureForAmbientTemperature(ambient: Double) -> Double {
        switch self {
        case .On:
            return ambient + 150.0
            
        case .Off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .On:
            self = .Off
        
        case .Off:
            self = .On
        }
    }
}

var bulb = LightBulb.On
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("The bulb's temperature is \(bulbTemperature).")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("The bulb's temperature is \(bulbTemperature).")

////////////////////////////

enum ShapeDimensions {
    // Point has no associated value - it is dimensionless
    case Point
    
    // Square's associated value is the length of one side
    case Square(Double)
    
    // Rectangle's associated value defines its width and height
    case Rectangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case .Point:
            return 0;
        
        case let .Square(side):
            return side * side
        
        case let .Rectangle(width: w, height: h):
            return w * h
        }
    }
}

var squareShape = ShapeDimensions.Square(10.0)
var rectShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point

print(squareShape.area())
print(rectShape.area())
print(pointShape.area())


