"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    input = lowercase(input)
    return Set('a':'z') ⊆ Set(input)
end

