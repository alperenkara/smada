human(X) :- between(1,8,X).

% two people has infected
initially_infected(X) :- human(X), X < 3.
%X \= Y, because you can't meet yourself
0.1:: contact(X,Y) :- human(X),human(Y),X \= Y.

%infected via contact
0.6:: infected_via_contact(X) :- contact(X,Y), infected(Y).
0.1:: infected_via_air(X) :- human(X).

% two friends are resistant to disease
resistant(X) :- human(X), X > 2, X < 6.

\+infected_via_air(X) :- resistant(X).

0.50::\+infected_via_contact(X) :- resistant(X).
                               

infected(X) :- initially_infected(X).
infected(X) :- infected_via_air(X).
infected(X) :- infected_via_contact(X).


% probability that any human gets infected
query(infected(_)).