%Cassandra Chavez-Suarez
%COMP 333
%5/11/18
%Project #5


%1
%a)
%a+ listOfa(L)returns true only if L is a list of one or more a’s

listOfa([a]).
listOfa([a|T]):-listOfa(T).

%1
%b)
%b+ listOfb(L) returns true only if L is a list of one or more b’s

listOfb([b]).
listOfb([b|T]):-listOfb(T).


%1
%c)
%c+ listOfc(L) returns true only of L is a list of one or more c’s

listOfc([c]).
listOfc([c|T]):-listOfc(T).

%1
%d)
% a+b+ listOfab(L) returns true only if L is a list of a’s followed by
% b’s
% make sure to append number of a's and number of b's where the a and b
% is at least on and X and Y make sure a's come before b's

listOfab(L):-append(X,Y,L), listOfa(X), listOfb(Y).

%1
%e)
% a+b+c+ listOfabc (L) returns true only if L matches the pattern a+b+c+
% by calling making listOfab(X) it will ensure that there are a's and
% b's before anynumber of c's (must be at least one a , b, c

listOfabc(L):-append(X,Y,L), listOfab(X), listOfc(Y).

%1
%f)
%bba*bbb regExpr1(L) returns true only if L matches the pattern bba*bbb
% makes sure that the first 2 letters are bb and calls any number of bs.
% Base case lets there be bbbbb

regExpr1(L):-append([b,b],[b,b,b],L).
regExpr1(L):- append([b,b|T],[b,b,b],L), listOfa(T).

%1
%g)
%(aa |cc)+  regExpr2(L) returns true only if L matches the pattern (aa | cc)+
% base cases aa and cc. recustion aa and cc calls on itself with repect
% to it being either aa or cc and keeps calling until the last two
% letters match one of the base cases if not then it will return false

regExpr2([a,a]).
regExpr2([c,c]).
regExpr2([a,a|T]):-regExpr2(T).
regExpr2([c,c|T]):-regExpr2(T).

%1
%h)
%a*b*c* regExpr3(L) return true only if L matches pattern a*b*c*

%make a base case for a's where 0 a's are accepted
listOfa2([]).
listOfa2([a|T]):-listOfa2(T).

%make a base case for b's where 0 b's are accepted
listOfb2([]).
listOfb2([b|T]):-listOfb2(T).

%make a base case for c's where 0 c's are accepted
listOfc2([]).
listOfc2([c|T]):-listOfc2(T).

% append X and Y which will ensure there are 0 or more a's followed by 0
% or more b's
listOfab2([]).
listOfab2(L):-append(X,Y,L), listOfa2(X), listOfb2(Y).

% append X and Y where X is called in the function where a's and b's are
% appened followed by Y 0 or more number od c's
regExpr3([]).
regExpr3(L):-append(X,Y,L), listOfab2(X), listOfc2(Y).

%1
%i)
% a^nba^n gRule1(L) returns true only if L is of the form anban for n
% >=0

gRule1([b]).
gRule1(L):-append(X,[b|Y],L), listOfa2(X), listOfa2(Y), X=Y.

%2)Sudoku

sudoku(X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35,X36):-
    %rows
    permutation([X1,X2,X3,X4,X5,X6],[1,2,3,4,5,6]),
    permutation([X7,X8,X9,X10,X11,X12],[6,5,4,3,2,1]),
    %boxes
    permutation([X1,X2,X3,X7,X8,X9],[1,2,3,6,5,4]),
    permutation([X4,X5,X6,X10,X11,X12],[4,5,6,3,2,1]),
    %columns
    permutation([X1,X7,X13,X19,X25,X31],[1,2,3,4,5,6]),
    permutation([X2,X8,X14,X20,X26,X32],[1,2,3,4,5,6]),
    %rows
    permutation([X13,X14,X15,X16,X17,X18],[1,2,3,4,5,6]),
    permutation([X9,X20,X21,X22,X23,X24],[6,5,4,3,2,1]),
    %boxes
    permutation([X13,X14,X15,X19,X20,X21],[1,2,3,6,5,4]),
    permutation([X16,X17,X18,X22,X23,X24],[4,5,6,3,2,1]),
    %columns
    permutation([X3,X9,X15,X21,X27,X33],[1,2,3,4,5,6]),
    permutation([X4,X10,X16,X22,X28,X34],[1,2,3,4,5,6]),
    %rows
    permutation([X25,X26,X27,X28,X29,X30],[1,2,3,4,5,6]),
    permutation([X31,X32,X33,X34,X35,X36],[6,5,4,3,2,1]),
    %boxes
    permutation([X25,X26,X27,X31,X32,X33],[1,2,3,4,5,6]),
    permutation([X28,X29,X30,X34,X35,X36],[4,5,6,3,2,1]),
    %columns
    permutation([X5,X11,X17,X23,X29,X35],[1,2,3,4,5,6]),
    permutation([X6,X12,X18,X24,X30,X36],[1,2,3,4,5,6]),

format("~d ~d ~d ~d ~d ~d ~n",[X1,X2,X3,X4,X5,X6]),
format("~d ~d ~d ~d ~d ~d ~n",[X7,X8,X9,X10,X11,X12]),
format("~d ~d ~d ~d ~d ~d ~n",[X13,X14,X15,X16,X17,X18]),
format("~d ~d ~d ~d ~d ~d ~n",[X19,X20,X21,X22,X23,X24]),
format("~d ~d ~d ~d ~d ~d ~n",[X25,X26,X27,X28,X29,X30]),
format("~d ~d ~d ~d ~d ~d ~n",[X31,X32,X33,X34,X35,X36]).




%3)Sudoku Solution

sudokuSolution(L):-
L=[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35,X36],
sudoku(X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35,X36).


%Comp 333    Project5 TestCase Problem 1
%Copy this go function into your file and run.
%
go :-
	writeln(problem1),
	( listOfa([a,a,a,a]),
        writeln('1 correct'); writeln('1 incorrrect') ),

	(   not(listOfa([a,a,b,a])),
         writeln('2 correct'); writeln('2 incorrrect') ),

	(   listOfb([b,b,b]),
         writeln('3 correct'); writeln('3 incorrrect') ),

     (   not(listOfb([])),
           writeln('4 correct'); writeln('4 incorrrect') ),

	(   listOfab([a,a,a,b,b]),
         writeln('5 correct'); writeln('5 incorrrect') ),

	(   listOfabc([a,b,b,c,c,c]),
         writeln('6 correct'); writeln('6 incorrrect') ),

	(   not(listOfabc([b,b,c,c,a,a])),
         writeln('7 correct'); writeln('7 incorrrect') ),

	(   regExpr1([b,b,a,a,a,a,b,b,b]),
         writeln('8 correct'); writeln('8 incorrrect') ),

	(   regExpr1([b,b,b,b,b]),
         writeln('9 correct'); writeln('9 incorrrect') ),


	(  not(regExpr1([b,b,a,a,a,b,b])),
        writeln('10 correct'); writeln('10 incorrrect') ),

	(   regExpr2([c,c,a,a,c,c,c,c,a,a]),
         writeln('11 correct'); writeln('11 incorrrect') ),

	(   not(regExpr2([a,a,c,c,a,a,a,c,c])),
         writeln('12 correct'); writeln('12 incorrrect') ),


	(    regExpr3([a,a,a,b,b,b,b,b,b]),
          writeln('13 correct'); writeln('13 incorrrect') ),

	(   regExpr3([b,c,c]),
         writeln('14 correct'); writeln('14 incorrrect') ),


	(  not( regExpr3([a,b,c,c,c,b,c,c])),
        writeln('15 correct'); writeln('15 incorrrect') ),

	(  not(regExpr3([a,b,a,c])) ,
        writeln('16 correct'); writeln('16 incorrrect') ),

	(   gRule1([a,a,a,b,a,a,a]),
          writeln('17 correct'); writeln('17 incorrrect') ),

	(   not(gRule1([a,b,a,a])),
         writeln('18 correct'); writeln('18 incorrrect') ),

	(  not(gRule1([a,a,b,b,a,a])),
        writeln('19 correct'); writeln('19 incorrrect') ),

	(   regExpr2([a,a,a,a,c,c,a,a,c,c]),
          writeln('20 correct'); writeln('20 incorrrect')).

/* Professors Test Cases Results */

/*
?- go.
problem1
1 correct
2 correct
3 correct
4 correct
5 correct
6 correct
7 correct
8 correct
9 correct
10 correct
11 correct
12 correct
13 correct
14 correct
15 correct
16 correct
17 correct
18 correct
19 correct
true
*/

/* Sudoku Test Results #1 */

%Test case took about a seconnd to find the solution

/*
?- sudoku(X1,X2,X3,X4,X5,X6,X7,X8,X9,X,X11,X12,X13,X14, X15,X16,X17,X18,X19,X20,X21,X22, X23,X24,X25,X26,X27,X28,X29,X30,X31,X32,X33,X34,X35,X36).
1 2 3 4 5 6
6 5 4 3 2 1
2 1 5 6 3 4
4 3 6 5 1 2
3 4 1 2 6 5
5 6 2 1 4 3
X1 = X12, X12 = X14, X14 = X23, X23 = X27, X27 = X34, X34 = 1,
X2 = X11, X11 = X13, X13 = X24, X24 = X28, X28 = X33, X33 = 2,
X3 = X, X = X17, X17 = X20, X20 = X25, X25 = X36, X36 = 3,
X4 = X9, X9 = X18, X18 = X19, X19 = X26, X26 = X35, X35 = 4,
X5 = X8, X8 = X15, X15 = X22, X22 = X30, X30 = X31, X31 = 5,
X6 = X7, X7 = X16, X16 = X21, X21 = X29, X29 = X32, X32 = 6
*/

/* Sudoku Test Results #2 */

%Test case took about a seconnd to find the solution

/*
?- sudokuSolution(L);true.
1 2 3 4 5 6
6 5 4 3 2 1
2 1 5 6 3 4
4 3 6 5 1 2
3 4 1 2 6 5
5 6 2 1 4 3
L = [1, 2, 3, 4, 5, 6, 6, 5, 4|...] [write]
L = [1, 2, 3, 4, 5, 6, 6, 5, 4, 3, 2, 1, 2, 1, 5, 6, 3, 4, 4, 3, 6, 5, 1, 2, 3, 4, 1, 2, 6, 5, 5, 6, 2, 1, 4, 3] .
*/
