import CoreData
import JavaScriptCore
import JavaScriptEval

public struct MorseEngine {
    
    /*
     Quick note, I had to modify
     morse code itself to support
     more ascii chars and capital
     letters.
     */
    
    let charToMorse: [String : String] = [
        "a": ".-",
        "b": "-...",
        "c": "-.-.",
        "d": "-..",
        "e": ".",
        "f": "..-.",
        "g": "--.",
        "h": "....",
        "i": "..",
        "j": ".---",
        "k": "-.-",
        "l": ".-..",
        "m": "--",
        "n": "-.",
        "o": "---",
        "p": ".--.",
        "q": "--.-",
        "r": ".-.",
        "s": "...",
        "t": "-",
        "u": "..-",
        "v": "...-",
        "w": ".--",
        "x": "-..-",
        "y": "-.--",
        "z": "--..",
        "A": "|.-",
        "B": "|-...",
        "C": "|-.-.",
        "D": "|-..",
        "E": "|.",
        "F": "|..-.",
        "G": "|--.",
        "H": "|....",
        "I": "|..",
        "J": "|.---",
        "K": "|-.-",
        "L": "|.-..",
        "M": "|--",
        "N": "|-.",
        "O": "|---",
        "P": "|.--.",
        "Q": "|--.-",
        "R": "|.-.",
        "S": "|...",
        "T": "|-",
        "U": "|..-",
        "V": "|...-",
        "W": "|.--",
        "X": "|-..-",
        "Y": "|-.--",
        "Z": "|--..",
        "1": ".----",
        "2": "..---",
        "3": "...--",
        "4": "....-",
        "5": ".....",
        "6": "-....",
        "7": "--...",
        "8": "---..",
        "9": "----.",
        "0": "-----",
        ".": ".-.-.-",
        ",": "--..--",
        "?": "..--..",
        "!": "-.-.--",
        "'": ".----.",
        "\"": ".-..-.",
        "(": "-.--.",
        ")": "-.--.-",
        "&": ".-...",
        ":": "---...",
        ";": "-.-.-.",
        "/": "-..-.",
        "\\": "-.-..",
        "%":"------..-.-----",
        "_": "··--·-",
        "=": "-···-",
        "+": "·-·-·",
        "-": "-····-",
        "*": "_.._",
        "$": "···-··-",
        "@": "·--·-·",
        "[": "-.--.--",
        "]": "-.--.--.",
        "{": "--.--.-",
        "}": "--.--.--",
        "<": ".-.-.--.",
        ">": ".-.-.--..",
        "^": "--....-.-",
        "\n": "...---..-...-",
        " ": "/",
    ]
    
    private var morseToChar: [String : String]?
    
    private func swap(_ dic: Dictionary<String,String>) -> Dictionary<String,String> {
        return Dictionary(uniqueKeysWithValues: dic.map({ ($1, $0) }))
    }
    
    private func encodeLetterToMorse(_ input: String.Element) -> String {
        var returnChar = charToMorse[String(input)]
        if returnChar == nil { returnChar = "" }
        return returnChar!
    }
    
    private func decodeLetterFromMorse(_ input: String) -> String {
        var returnChar = morseToChar![String(input)]
        if returnChar == nil { returnChar = "" }
        return returnChar!
    }
    
    public func Encode(_ string: String) -> String {
        let chars = Array(string)
        var retStr = ""
        for char in chars {
            let retChar = encodeLetterToMorse(char)
            if retChar != "" {
                retStr += retChar + " "
            }
        }
        return retStr
    }
    
    public func Decode(_ string: String) -> String {
        let chars = string.split(separator: " ", omittingEmptySubsequences: false)
        var retStr = ""
        for char in chars {
            let retChar = decodeLetterFromMorse(String(char))
            if retChar != "" {
                retStr += retChar
            }
        }
        return retStr
    }
    
    public func evalJavaScriptMorse(_ morse: String) -> Any {
        let source = Decode(morse)
        let Eval = JavaScriptEval.self
        return Eval.Eval(source)
    }
    
    public func evalMathMorse(_ morse: String) -> Float {
        let stringWithMathematicalOperation: String = Decode(morse)
        let exp: NSExpression = NSExpression(format: stringWithMathematicalOperation)
        return exp.expressionValue(with: nil, context: nil) as! Float
    }
    
    public init() {
        morseToChar = swap(charToMorse)
        morseToChar![" "] = ""
        morseToChar![""] = " "
    }
}
