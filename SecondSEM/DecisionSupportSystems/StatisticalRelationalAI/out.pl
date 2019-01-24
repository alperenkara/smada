hyperlink(p1,p2).
hyperlink(p1,p3).
hyperlink(p1,p7).
hyperlink(p2,p7).
hyperlink(p3,p5).
hyperlink(p4,p6).
hyperlink(p5,p1).
hyperlink(p5,p7).
hasword(p1,soccer).
hasword(p1,goal).
hasword(p2,england).
hasword(p2,defeat).
hasword(p2,colombia).
hasword(p2,soccer).
hasword(p2,goal).
hasword(p3,guardian).
hasword(p3,elections).
hasword(p4,coffee).
hasword(p4,colombia).
hasword(p5,elections).
hasword(p5,president).
hasword(p5,england).
hasword(p5,game).
hasword(p6,restaurant).
hasword(p6,pasta).
hasword(p7,game).
hasword(p7,england).
0.990139035550779::topic(P,food) :- hasword(P,pasta).
0.990139035550779::topic(P,food) :- hasword(P,restaurant).
0.984972249515727::topic(P,sport) :- hasword(P,goal).
0.984972249515727::topic(P,sport) :- hasword(P,soccer).
0.0::topic(P,food) :- hasword(P,colombia).
1.0::topic(P,food) :- hasword(P,coffee).
0.99724556627557::topic(P,politics) :- hasword(P,elections).
0.988620325108397::topic(P,politics) :- hasword(P,guardian).
0.326843024828612::topic(P,sport) :- hasword(P,england).
0.257244829918981::topic(P,sport) :- hasword(P,game).
0.0::topic(P,politics) :- hasword(P,england).
0.962139102821681::topic(P,politics) :- hasword(P,president).
0.0::topic(P,politics) :- hasword(P,game).
0.51509461347043::topic(P,sport) :- hasword(P,defeat).
0.0::topic(P,sport) :- hasword(P,colombia).
0.0::topic(P,food) :- hasword(P,soccer).
0.0::topic(P,food) :- hasword(P,goal).
0.0::topic(P,politics) :- hasword(P,soccer).
0.0::topic(P,politics) :- hasword(P,goal).
0.0::topic(P,food) :- hasword(P,england).
0.0::topic(P,food) :- hasword(P,defeat).
0.0::topic(P,politics) :- hasword(P,defeat).
0.0::topic(P,politics) :- hasword(P,colombia).
0.0::topic(P,food) :- hasword(P,guardian).
0.0::topic(P,food) :- hasword(P,elections).
0.0::topic(P,sport) :- hasword(P,guardian).
0.0::topic(P,sport) :- hasword(P,elections).
0.0::topic(P,sport) :- hasword(P,coffee).
0.0::topic(P,politics) :- hasword(P,coffee).
0.0::topic(P,food) :- hasword(P,president).
0.0::topic(P,food) :- hasword(P,game).
0.0::topic(P,sport) :- hasword(P,president).
0.0::topic(P,sport) :- hasword(P,restaurant).
0.0::topic(P,sport) :- hasword(P,pasta).
0.0::topic(P,politics) :- hasword(P,restaurant).
0.0::topic(P,politics) :- hasword(P,pasta).
0.474764119184253::topic(T,P) :- hasword(W,P).
