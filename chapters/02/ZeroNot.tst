// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/01/Mux16.tst

load ZeroNot.hdl,
output-file ZeroNot.out,
compare-to ZeroNot.cmp,
output-list in%B1.16.1 z%D2.1.2 n%D2.1.2 out%B1.16.1;

set in 0,
set z 0,
set n 0,
eval,
output;

set z 1,
eval,
output;

set n 1,
eval,
output;

set in %B0001001000110100,
set z 0,
set n 1,
eval,
output;

set z 1,
set n 0,
eval,
output;

set in %B1111111111111111,
set n 1,
set z 0,
eval,
output;

set in %B1111111111111111,
set n 0,
set z 1,
eval,
output;

set in %B1111111111111111,
set n 0,
set z 0,
eval,
output;

