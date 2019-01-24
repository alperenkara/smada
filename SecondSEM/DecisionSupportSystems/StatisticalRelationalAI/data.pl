% Modes
mode(male(+)).
mode(parent(+,+)).
mode(parent(+,-)).
mode(parent(-,+)).

% Type definitions
base(parent(person,person)).
base(male(person)).
base(female(person)).
base(mother(person,person)).
base(grandmother(person,person)).
base(father(person,person)).
base(male_ancestor(person,person)).
base(female_ancestor(person,person)).

% Target
learn(grandmother/2).

% How to generate negative examples
example_mode(auto).

father(bart, stijn).
father(bart, pieter).
father(luc, soetkin).

mother(katleen, stijn).
mother(katleen, pieter).
mother(lieve, soetkin).

parent(bart,stijn).
parent(bart,pieter).
parent(luc,soetkin).

female(alice).
female(an).
female(esther).

male(bart).
male(etienne).
male(leon).

grandmother(esther,soetkin).
grandmother(esther,stijn).
grandmother(esther,pieter).