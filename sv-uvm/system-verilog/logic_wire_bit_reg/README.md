## Experiment: Multiple Continuous Drivers

### Expected (IEEE/SystemVerilog)

Two conflicting continuous drivers on a net should resolve to `X`.

### Verilator Observation

Verilator produced the value from the first assignment. Reversing the assignment order changed the output.

### Conclusion

Verilator performs aggressive optimization and should not be treated as a full event-driven simulator for studying all SystemVerilog semantics. Results should be validated with an IEEE-compliant simulator (e.g., Questa, VCS, Xcelium, or Icarus Verilog where applicable).