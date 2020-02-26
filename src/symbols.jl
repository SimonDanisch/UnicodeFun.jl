# Here, we collect and reverse the REPL's latex autocompletion map.
using REPL
const latex_symbol_map = Dict((k => v[1] for (k, v) in REPL.REPLCompletions.latex_symbols))
