import Foundation

struct CalculatorBrain {
    var height: Float?
    var weight: Float?
    var bmi: Float?
    
    mutating func calculateBMI(h: Float, w: Float) {
        self.bmi = w / pow(h, 2)
    }
    
    func getBMIValue() -> String {
        let bmiDecimalPlace = String(format: "%.1f", bmi!)
        return bmiDecimalPlace
    }
}
