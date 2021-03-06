Get["/home/wyf/software/fire/FIRE5/FIRE5.m"];

Internal = {q1,q2};

External = {k1, k2};

Propagators = {(q1 - k1)^2 - eta^2, (q1 + k2)^2 - eta^2, (k1 + k2 + q2)^2 - eta^2, q2^2 - eta^2, q1^2 - eta^2, (q1 - q2 - k1)^2 - eta^2, (k1 + q2)^2 - eta^2};

Replacements = {(k2 k1) -> mw^2/2, (k1 k1) -> 0, (k2 k2) -> 0};

IndList = {{1, 1, 0, 1, 1, 1, 0}, {1, 1, 1, 1, 0, 1, 0}, {1, 0, 1, 1, 1, 1, 0}, {1, 1, 1, 1, 1, 1, -1}, {0, 1, 1, 1, 1, 1, 0}, {1, 1, 1, 0, 1, 1, 0}, {1, 1, 1, 1, 1, 0, 0}};

orig = Table[G[1, IndList[[i]]], {i, 1, Length[IndList]}];

rules = FindRules[Table[{1, IndList[[i]]}, {i, 1, Length[IndList]}]];

final = Complement[Union[orig /. rules], {0}] /. G[1, {x__}] :> {x};

stream = OpenWrite["dy_minus1_intgrals_v2.out"];

Write[stream, final];

Close[stream];

