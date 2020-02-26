# Here, we collect and reverse the REPL's latex autocompletion map.
using REPL
const latex_symbol_map = Dict((k[2:end] => v[1] for (k, v) in REPL.REPLCompletions.latex_symbols))
