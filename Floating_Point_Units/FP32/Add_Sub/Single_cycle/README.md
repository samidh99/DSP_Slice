The design contains a FP32 addition/ subtraction unit with Prealign, Align, Execute, Normalize, Normalize Shifting and Round modules.
The floating point format used is a simplified IEEE754 Single precision standard and supports the default IEEE754 rounding mode (round to nearest, tie to even) and all the exception flags. Signalling NaNs are not supported, neither are denormalized numbers.
The design is a single stage implementation.

Inspiration taken from: https://github.com/fbrosser/DSP48E1-FP
The number of pipeline stages have been modified- along with the structure of the intermediate pipelined registers. 

