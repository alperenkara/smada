t(_)::visiti.

0.01::asia.
0.5::smoker.
0.05::tuberculosis :- asia.
0.01::tuberculosis :- \+ asia.
0.1::cancer :- smoker.
0.01::cancer :- \+ smoker.
0.6::bronchitis :- smoker.
0.3::bronchitis :- \+ smoker.

1::tb_or_cancer :- tuberculosis, cancer.
1::tb_or_cancer :- \+tuberculosis, cancer.
1::tb_or_cancer :- tuberculosis, \+cancer.
0::tb_or_cancer :- \+tuberculosis, \+cancer.

0.98::positiveXray :- tb_or_cancer.
0.05::positiveXray :- \+tb_or_cancer.
0.9::dispnea :- tb_or_cancer, bronchitis.
0.7::dispnea :- tb_or_cancer, \+bronchitis.
0.8::dispnea :- \+tb_or_cancer, bronchitis.
0.1::dispnea :- \+tb_or_cancer, \+bronchitis.
evidence(smoker).
evidence(\+visitedAsia).
evidence(\+tubercolosis).
evidence(\+lung_cancer).
evidence(\+dyspnea).
evidence(\+xray_positive).
----------------
evidence(\+xray_positive).
evidence(tubercolosis).
evidence(visitedAsia).
evidence(\+lung_cancer).
evidence(dyspnea).
evidence(\+smoker).
query(positiveXray).
query(dispnea).