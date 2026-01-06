import clingo

ctl = clingo.Control()

# Python 生成 ASP 约束
nodes = ['a', 'b', 'c']
edges = [('a', 'b'), ('b', 'c')]
colors = ['red', 'green', 'blue']

for n in nodes:
    ctl.add("base", [], f"node({n}).")
for c in colors:
    ctl.add("base", [], f"color({c}).")
for x, y in edges:
    ctl.add("base", [], f"edge({x},{y}).")

ctl.add("base", [], "1 { assign(N,C) : color(C) } 1 :- node(N).")
ctl.add("base", [], ":- edge(X,Y), assign(X,C), assign(Y,C).")
ctl.add("base", [], "#show assign/2.")

ctl.ground([("base", [])])

def on_model(model):
    print("解：", " ".join(str(atom) for atom in model.symbols(shown=True)))

ctl.solve(on_model=on_model)