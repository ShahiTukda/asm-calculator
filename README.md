# asm-calculator
A command-line calculator written in pure x86-64 assembly.
No C standard library. No external dependencies.
String-to-integer and integer-to-string conversion implemented from scratch as shared libraries.

## Operations supported
Binary operations (usage: ./calculator num1 op num2)
  +    addition
  -    subtraction
  *    multiplication
  ^    XOR
  |    bitwise OR
  &    bitwise AND
Unary operations (usage: ./calculator op num)
  -    negation
  ~    bitwise NOT
(Handles negative numbers throughout.)

## Usage examples
./calculator 10 + 5      → 15
./calculator 10 - 15     → -5
./calculator 255 '&' 15    → 15
./calculator - 42        → -42
./calculator ~ 0         → -1

## How it works
atoi.s   converts ASCII string arguments to 64-bit signed integers
itoa.s   converts 64-bit signed integers back to ASCII for output
main.s   parses argv, dispatches to the correct operation, calls atoi/itoa, writes result to stdout via syscall

## Notes
This reflects my first assembly project — written for learning, not production use. Code style is intentionally preserved as-is to document the learning process.
