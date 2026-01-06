row(1..8). col(1..8).
1 { queen(R,C) : col(C) } 1 :- row(R).
1 { queen(R,C) : row(R) } 1 :- col(C).

%实体化产生64个queen事实，然后通过约束消除冲突
%注意这里使用R1 < R2来避免重复约束，否则所有解都会被消除掉
:- queen(R1,C1), queen(R2,C2), R1 < R2, C1 = C2.
:- queen(R1,C1), queen(R2,C2), R1 < R2, R1 - C1 = R2 - C2.
:- queen(R1,C1), queen(R2,C2), R1 < R2, R1 + C1 = R2 + C2.

%添加约束后，解空间变小了很多
%queen(1,1)

#show queen/2.
