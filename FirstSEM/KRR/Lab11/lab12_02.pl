human(X) :- between(1, 8, X).
initially_infected(X) :- human(X), X < 2.
% X \= Y, because you can't meet yourself
0.1::contact(X,Y) :- human(X), human(Y), X \= Y.

0.1::air_infected(X) :- human(X).

0.6::contact_infected(X) :- contact(X,Y),
							infected(Y).
							   
infected(X) :- initially_infected(X);
			   air_infected(X);
			   contact_infected(X).

resistant(3).
resistant(4).

1::\+air_infected(X) :- resistant(X).
0.50::\+contact_infected(X) :- resistant(X).
			   
query(infected(X)).
query(infected(3)).
query(infected(4))