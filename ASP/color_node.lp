node(a). node(b). node(c).
edge(a,b). edge(b,c).
color(red;green;blue).

1 { assign(N,C) : color(C) } 1 :- node(N).
:- edge(X,Y), assign(X,C), assign(Y,C).

#show assign/2.
