row(1..9). col(1..9). value(1..9).

1 {cell(R,C,V) : value(V)} 1 :- row(R), col(C).

%每行每个数字只能出现一次(相同数字至少出现两次的反面)
:- row(R), value(V), 2 {cell(R,C,V) : col(C)}.
%每列每个数字只能出现一次
:- col(C), value(V), 2 {cell(R,C,V) : row(R)}.
%每个宫格每个数字只能出现一次
% 每个宫格的左上角坐标
boxrow(1). boxrow(4). boxrow(7).
boxcol(1). boxcol(4). boxcol(7).

% 每个宫格每个数字只能出现一次
:- boxrow(BR), boxcol(BC), value(V), 2 {cell(R,C,V) : row(R), col(C), R>=BR, R<BR+3, C>=BC, C<BC+3}.

% 示例：预填一些数独格子的初始值
cell(1,1,5).
cell(1,2,3).
cell(1,5,7).
cell(2,1,6).
cell(2,4,1).
cell(2,5,9).
cell(2,6,5).
cell(3,2,9).
cell(3,3,8).
cell(3,8,6).

#show cell/3.
