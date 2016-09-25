to_subscript(x::Union{Int, AbstractString}) = sprint(io->to_subscript(io, x))
to_subscript(io::IO, x::Char) = print(io, to_subscript(x))
function to_subscript(io::IO, x::AbstractString)
    for char in x
        print(io, to_subscript(char))
    end
end

to_superscript(x::Union{Int, AbstractString}) = sprint(io->to_superscript(io, x))
to_superscript(io::IO, x::Char) = print(io, to_superscript(x))
function to_superscript(io::IO, x::AbstractString)
    for char in x
        print(io, to_superscript(char))
    end
end



function to_subscript(io::IO, x::Int)
    if x in 0:9
        print(io, Char(0x2080+x))
    elseif x < 0
        print(io, Char(0x208B)); to_subscript(io, abs(x))
    else # positive + more than one digit
        for d in reverse(digits(x))
            to_subscript(io, d)
        end
    end
end

let subscript_map = Dict(
        '0' => '₀',
        '1' => '₁',
        '2' => '₂',
        '3' => '₃',
        '4' => '₄',
        '5' => '₅',
        '6' => '₆',
        '7' => '₇',
        '8' => '₈',
        '9' => '₉',
        '+' => '₊',
        '-' => '₋',
        '=' => '₌',
        '(' => '₍',
        ')' => '₎',
        'a' => 'ₐ',
        'e' => 'ₑ',
        'i' => 'ᵢ',
        'o' => 'ₒ',
        'r' => 'ᵣ',
        'u' => 'ᵤ',
        'v' => 'ᵥ',
        'x' => 'ₓ',
        'β' => 'ᵦ',
        'γ' => 'ᵧ',
        'ρ' => 'ᵨ',
        'φ' => 'ᵩ',
        'χ' => 'ᵪ',
    )
    function to_subscript(x::Char)
        haskey(subscript_map, x) || error("Char $x doesn't have a unicode superscript")
        subscript_map[x]
    end
end


function to_superscript(io::IO, x::Int)
    if x == 1
        print(io, Char(0x00B9))
    elseif x in 2:3
        print(io, Char(0x00B0+x))
    elseif x in 0:9
        print(io, Char(0x2070+x))
    elseif x < 0
        print(io, Char(0x207B)); to_superscript(io, abs(x))
    else # positive + more than one digit
        for d in reverse(digits(x))
            to_superscript(io, d)
        end
    end
end

let superscript_map = Dict(
        '0' => '⁰',
        '1' => '¹',
        '2' => '²',
        '3' => '³',
        '4' => '⁴',
        '5' => '⁵',
        '6' => '⁶',
        '7' => '⁷',
        '8' => '⁸',
        '9' => '⁹',
        '+' => '⁺',
        '-' => '⁻',
        '=' => '⁼',
        '(' => '⁽',
        ')' => '⁾',
        'a' => 'ᵃ',
        'b' => 'ᵇ',
        'c' => 'ᶜ',
        'd' => 'ᵈ',
        'e' => 'ᵉ',
        'f' => 'ᶠ',
        'g' => 'ᵍ',
        'h' => 'ʰ',
        'i' => 'ⁱ',
        'j' => 'ʲ',
        'k' => 'ᵏ',
        'l' => 'ˡ',
        'm' => 'ᵐ',
        'n' => 'ⁿ',
        'o' => 'ᵒ',
        'p' => 'ᵖ',
        'r' => 'ʳ',
        's' => 'ˢ',
        't' => 'ᵗ',
        'u' => 'ᵘ',
        'v' => 'ᵛ',
        'w' => 'ʷ',
        'x' => 'ˣ',
        'y' => 'ʸ',
        'z' => 'ᶻ',
        'A' => 'ᴬ',
        'B' => 'ᴮ',
        'D' => 'ᴰ',
        'E' => 'ᴱ',
        'G' => 'ᴳ',
        'H' => 'ᴴ',
        'I' => 'ᴵ',
        'J' => 'ᴶ',
        'K' => 'ᴷ',
        'L' => 'ᴸ',
        'M' => 'ᴹ',
        'N' => 'ᴺ',
        'O' => 'ᴼ',
        'P' => 'ᴾ',
        'R' => 'ᴿ',
        'T' => 'ᵀ',
        'U' => 'ᵁ',
        'V' => 'ⱽ',
        'W' => 'ᵂ',
        'α' => 'ᵅ',
        'β' => 'ᵝ',
        'γ' => 'ᵞ',
        'δ' => 'ᵟ',
        '∊' => 'ᵋ',
        'θ' => 'ᶿ',
        'ι' => 'ᶥ',
        'Φ' => 'ᶲ',
        'φ' => 'ᵠ',
        'χ' => 'ᵡ'
    )
    function to_superscript(x::Char)
        haskey(superscript_map, x) || error("Char $x doesn't have a unicode superscript")
        superscript_map[x]
    end
end
