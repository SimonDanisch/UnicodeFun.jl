module UnicodeFun

include("symbols.jl")

include("sub_super_scripts.jl")
export to_superscript, to_subscript
export to_fraction, to_fraction_nl

include("fontstyles.jl")
export to_blackboardbold
export to_boldface
export to_italic
export to_caligraphic
export to_frakture
export to_underline
export to_overline

include("latex.jl")
export to_latex

include("roots.jl")
export to_root

end # module
