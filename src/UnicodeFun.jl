module UnicodeFun

include("symbols.jl")
include("sub_super_scripts.jl")
export to_superscript, to_subscript
include("fontstyles.jl")
export to_blackboardbold
export to_boldface
export to_italic
export to_caligraphic
export to_frakture

include("latex.jl")
export to_latex

end # module
