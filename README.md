# UnicodeFun
[![Build Status](https://travis-ci.org/SimonDanisch/UnicodeFun.jl.svg?branch=master)](https://travis-ci.org/SimonDanisch/UnicodeFun.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/ri3ybegh0ffwyq0n/branch/master?svg=true)](https://ci.appveyor.com/project/SimonDanisch/unicodefun-jl/branch/master)

[![Coverage Status](https://coveralls.io/repos/github/SimonDanisch/UnicodeFun.jl/badge.svg?branch=master)](https://coveralls.io/github/SimonDanisch/UnicodeFun.jl?branch=master)
[![codecov](https://codecov.io/gh/SimonDanisch/UnicodeFun.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/SimonDanisch/UnicodeFun.jl)


unicode transformation library offering e.g. latex --> unicode:

```Julia
latexstring = "\\alpha^2 \\cdot \\alpha^{2+3} \\equiv \\alpha^7"
to_latex(latexstring) == "α² ⋅ α²⁺³ ≡ α⁷"
```


Lookup tables taken from:
https://github.com/ypsu/latex-to-unicode/tree/master/data
