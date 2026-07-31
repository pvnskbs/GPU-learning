# Logic Data Type

## Objective

Understand the behavior of the `logic` data type in SystemVerilog.

## Theory

- `logic` replaces most uses of `reg`.
- Can represent four states:
  - 0
  - 1
  - X
  - Z
- Can be driven procedurally.
- Prevents accidental multiple drivers better than legacy `reg` in many coding styles.

## Experiment

Observe the default value of an uninitialized logic variable and then assign values inside an `initial` block.

## Observation

Before assignment, all logic variables must contain `X`. However, Verilator is primarily a cycle-accurate, synthesizable simulator optimized for speed. Internally, it prefers 2-state simulation whenever possible. By default, the unassigned variables are forced to `0`

After assignment, the expected values are observed.