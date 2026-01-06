% 从 Python 获取一个范围内的所有数字
% Python 函数 range_list(3) 返回 [0, 1, 2]
num(X) :- X = @range_list(3).

% 甚至可以生成复杂的项
grid(X, Y) :- (X, Y) = @make_grid(2).

#script (python)
import clingo

def range_list(n):
    limit = n.number
    # 返回一个列表，Clingo 会将其展开为多个事实
    return [clingo.Number(i) for i in range(limit)]

def make_grid(n):
    limit = n.number
    results = []
    for x in range(limit):
        for y in range(limit):
            # 返回 Tuple (clingo.Symbol, clingo.Symbol)
            # 对应 ASP 中的 (X, Y)
            results.append(clingo.Tuple_((clingo.Number(x), clingo.Number(y))))
    return results
#end.
% #show num/1.
#show grid/2.
