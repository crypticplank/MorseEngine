# MorseEngine

A morse code encoder and decoder with bultin javascript eval for morse code. 

# JavaScript Eval with morse

To get your code in morse code, call 
```swift
MorseEngine().Encode("Your code here")
```
Make sure you put your code in a method that looks like this.
```js
function main() {
  //Your code here
}
```

To evaluate your code, use 
```swift
MorseEngine().evalJavaScriptMorse("..-. ..- -. -.-. - .. --- -. / ...")
```
, it returns Any.
