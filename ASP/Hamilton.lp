%给定一个有向图，判断是否存在一条经过每个节点一次的回路。
node(a;b;c;d).
edge(a,b). edge(a,c). edge(b,c). edge(b,d). edge(c,d). edge(d,a). edge(d,b). edge(b,a).

%所有节点的入度和出度均为1
1 {in(X,Y) : edge(X,Y)} 1 :- node(X).
1 {in(X,Y) : edge(X,Y)} 1 :- node(Y).

start(S) :- node(S).
reach(X) :- start(S), in(S,X).
reach(Y) :- reach(X), in(X,Y).
:- node(X), not reach(X).

#show in/2.
