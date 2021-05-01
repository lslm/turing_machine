# Turing Machine examples

This app contains a set of examples of Turing Machines written in Elixir. All the examples can be found inside the `TuringMachine` module.

## Examples

- Binary Number incrementer

  ```elixir
  TuringMachine.BinaryNumberIncrementer.increment("1011") # "1100"
  ```

  ```elixir
  TuringMachine.BinaryNumberIncrementer.increment("101") # "110"
  ```
  
  ```elixir
  TuringMachine.BinaryNumberIncrementer.increment("1110011") # "1110100"
  ```
