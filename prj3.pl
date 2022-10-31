%#1 dept_employees(Employees, Dept, DeptEmployees) :-
  %  'TODO'(Employees, Dept, DeptEmployees).


employees([employee(tom, 33, cs, 85000.00),
	     employee(joan, 23, ece, 110000.00),
	     employee(bill, 29, cs, 69500.00),
	     employee(john, 28, me, 58200.00),
	      employee(sue, 19, cs, 22000.00)
	  ]).

dept_employees(cs ,([H| _]), Dept):- dept_employees(cs , H, Dept).
dept_employees(cs ,([_| T]), Dept):-
		dept_employees([dept, T], Dept).



%#3 list_access(Indexes, List, Z) :- 'TODO'(Indexes, List, Z).
index_empty( X, Y, X-Y).
all( _-Y, Y).

list_access( Indexes, List, Z) :-
     maplist( index_empty, Indexes, List, L),
     sort( L, S),
     maplist( all, S, Z).
list_access(Indexes, List, Z) :- 'TODO'(Indexes, List, Z).


%#4 count_non_pairs(List, NNonPairs):- 'TODO'(List, NNonPairs).



%#5 divisible_by(Ints, N, Int) :- 'TODO'(Ints, N, Int).
divisible([],_,[]).
divisible([H|T],X,[H|T1]):-
    H mod X=:=0, divisible(T,X,T1).
divisible([H|T],X,T1):- H mod X=\=0, divisible(T,X,T1).

%#6 re_match(Re, List) :- 'TODO'(Re, List).

re_match(X, L) :-
    X = L,
    append(X,_,_).

re_match(seq(X, Y), L) :-
    append(L1, L2, L),
    re_contains(X, L1),
    re_contains(Y, L2).

re_match(union(X, _), L) :-
    re_contains(X, L).

re_match((_, Y), L) :-
    re_contains(Y, L).

re_match(kleene(X), L) :-
    append([Car|L1], L2, L),
    re_contains(X, [Car|L1]),
    re_contains(kleene(X), L2).

re_match(kleene(_),[]).
