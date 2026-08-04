# Traffic Light Controller FSM

A Moore FSM-based traffic light controller for a 2-way intersection 
(North-South and East-West), implemented in Verilog HDL.

## States
| State | NS Light | EW Light |
|-------|----------|----------|
| S0    | Green    | Red      |
| S1    | Yellow   | Red      |
| S2    | Red      | Green    |
| S3    | Red      | Yellow   |

## Files
- `traffic_light.v` — FSM design module
- `testbench.v` — Testbench with clock/reset generation

## How to Simulate
1. Open [EDA Playground](https://www.edaplayground.com)
2. Paste `traffic_light.v` in the Design pane
3. Paste `testbench.v` in the Testbench pane
4. Select Icarus Verilog as simulator, run

## Result
Simulation verified successfully — NS and EW lights cycle correctly through 
Green → Yellow → Red states with no timing conflicts.
