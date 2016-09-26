function print_modifier(io, mod, substring)
    if mod == "^"
        to_superscript(io, substring)
    elseif mod == "_"
        to_subscript(io, substring)
    elseif mod == "bb"
        to_blackboardbold(io, substring)
    elseif mod == "bf"
        to_boldface(io, substring)
    elseif mod == "it"
        to_italic(io, substring)
    elseif mod == "cal"
        to_caligraphic(io, substring)
    elseif mod == "frak"
        to_frakture(io, substring)
    elseif mod == "mono"
        to_mono(io, substring) # leave unmodified for now
    else
        error("Modifier $mod not supported")
    end
end
"""
Base findnext doesn't handle utf8 strings correctly
"""
function Base.findnext(A::AbstractString, v::Char, idx::Integer)
    while !done(A, idx)
        lastidx = idx
        elem, idx = next(A, idx)
        elem == v && return lastidx
    end
    0
end

function to_latex(text)
    io = IOBuffer()
    idx = start(text)
    while !done(text, idx)
        char, idx = next(text, idx)
        if char in ('^', '_', '\\')
            mod = string(char)
            if mod == "\\"
                ss = SubString(text, idx, endof(text))
                for mod_candidate in ("bb", "bf", "it", "cal", "frak", "mono")
                    if startswith(ss, mod_candidate)
                        mod = mod_candidate
                        break
                    end
                end
                if mod == "\\" # no match was found
                    # is this a latex symbol?
                    for (k,v) in latex_symbol_map
                        if startswith(ss, k)
                            print(io, v) # replace
                            for i=1:length(k) # move forward
                                idx = nextind(text, idx)
                            end
                            break
                        end
                    end
                    continue # ignore '\' mod
                else
                    for i=1:length(mod) # move forward
                        idx = nextind(text, idx)
                    end
                end
            end
            char, idx = next(text, idx)
            if char == '{'
                i = findnext(text, '}', idx)
                if i == 0
                    error("Invalid latex. Couldn't find matching } in $(text[idx:end])")
                end
                print_modifier(io, mod, SubString(text, idx, prevind(text, i)))
                char, idx = next(text, i)
            else
                print_modifier(io, mod, char)
            end
        else
            print(io, char)
        end
    end
    return takebuf_string(io)
end
