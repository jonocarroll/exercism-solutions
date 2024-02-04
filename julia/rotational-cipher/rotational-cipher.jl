"""
Rotation / Caesar cypher, rotating s by n letters
"""
function rotate(n, s)

    newstring = ""
    orig_type = typeof(s)
    s = string(s)

    lowers = Dict(zip('a':'z', circshift('a':'z', -n)))
    uppers = Dict(zip('A':'Z', circshift('A':'Z', -n)))

    for (index, value) in enumerate(s)
        if value in 'a':'z'
            tmpstring = replace(s, value => lowers[value])
            newstring = newstring * tmpstring[index]
        elseif value in 'A':'Z'
            tmpstring = replace(s, value => uppers[value])
            newstring = newstring * tmpstring[index]
        else 
            newstring = newstring * s[index]
        end
    end

    if length(newstring) == 1 && orig_type == Char
        newstring = newstring[1]
    end
    
    return newstring

end

# Evaluate the macro for each Rn_str 
for n in 0:26
    @eval macro $(Symbol(:R, n, :_str))(s)
        rotate($n, s)
    end
end
