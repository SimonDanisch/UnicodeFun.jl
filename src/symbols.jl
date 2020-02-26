# Here, we collect and reverse the REPL's latex autocompletion map.
latex_symbol_map = REPL.symbols_latex |> collect .|> (x -> (x[2][2:end] => x[1])) |> x -> Dict(x...)
