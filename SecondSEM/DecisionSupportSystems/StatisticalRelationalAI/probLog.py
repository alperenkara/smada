from problog.program import PrologString
from problog.core import ProbLog
from problog import get_evaluatable

p = PrologString("""
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
%%
t(_,T,W)::topic(P,T):-hasword(P,W).
%%
evidence(topic(p1,sport),true).
evidence(topic(p1,food),false).
evidence(topic(p1,politics),false).
evidence(topic(p2,sport),true).
evidence(topic(p2,food),false).
evidence(topic(p2,politics),false).
evidence(topic(p3,politics),true).
evidence(topic(p3,food),false).
evidence(topic(p3,sport),false).
evidence(topic(p4,food),true).
evidence(topic(p4,sport),false).
evidence(topic(p4,politics),false).
evidence(topic(p5,politics),true).
evidence(topic(p5,food),false).
evidence(topic(p5,sport),false).
evidence(topic(p6,food),true).
evidence(topic(p6,sport),false).
evidence(topic(p6,politics),false).
evidence(topic(p7,sport),true).
evidence(topic(p7,food),false).
evidence(topic(p7,politics),false).
""")

get_evaluatable().create_from(p).evaluate()
