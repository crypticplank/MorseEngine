import XCTest
@testable import MorseEngine

final class MorseEngineTests: XCTestCase {
    let engine = MorseEngine()
    func testEncode() {
        let morse = engine.Encode("""
if true {
    print("Dodge")
} else {
    print("cool beans")
}
print(morse);
print(MorseEngine().Decode(morse))
print(MorseEngine().Decode("-... .-. .- -. -.. --- -. /")); //<- trying with simicolon
""")
        print(morse)
        print(engine.Decode(morse))
        print(engine.Decode("-... .-. .- -. -.. --- -. /"))
        let morse2 = engine.Encode("""
    private func swap(_ dic: Dictionary<String,String>) -> Dictionary<String,String> {
        return Dictionary(uniqueKeysWithValues: dic.map({ ($1, $0) }))
    }
""")
        print(morse2)
        print(engine.Decode(morse2))
    }
    
    func testMath() {
        let morseEquation = engine.Encode("(2 * 4) + 97")
        print(morseEquation)
        let re = engine.Decode(morseEquation)
        print(re)
        print(engine.evalMathMorse(morseEquation))
    }
    
    func testJavaScript() {
        let code = """
        function main() {
            var num = 0
            print("Hello from Morse Engine JavaScript")
            for(var i = 0; i < 10; i++) {
                print(i)
                num = i
            }
            swiftMethod(10)
            return num * 100
        }
        """
        let engine = MorseEngine()
        let morse = engine.Encode(code)
        //let morse = "..-. ..- -. -.-. - .. --- -. / -- .- .. -. -.--. -.--.- / --.--.- ...---..-...- / / / / .--. .-. .. -. - -.--. .-..-. .... . .-.. .-.. --- / ..-. .-. --- -- / -- --- .-. ... . / . -. --. .. -. . / .--- .- ...- .- ... -.-. .-. .. .--. - .-..-. -.--.- ...---..-...- --.--.--"
        print(morse)
        let re = engine.Decode(morse)
        print(re)
        print(engine.evalJavaScriptMorse(morse))
    }
}
