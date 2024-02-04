"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    bases = ['A', 'C', 'G', 'T'] 
    if any([x ∉ bases for x in unique(strand)])
        bad = setdiff(unique(strand), bases)
        throw(DomainError(bad, "Found invalid base"))
    end
    d = Dict((i => count(==(i), strand)) for i in bases)

    return d

end
