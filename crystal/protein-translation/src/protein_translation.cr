module ProteinTranslation
 def self.proteins(strand : String) : Array(String)
    res = [] of String
    if strand == ""
       return res
    end

    codons = [] of String
    (0.step(to:strand.size-1, by: 3)).each do |i|
       codons.push(strand[i..i+2])
    end

    prots = Hash{
       "UAA" =>	"STOP",
       "UAG" => "STOP",
       "UGA" =>	"STOP",
       "AUG" =>	"Methionine",
       "UUU" =>	"Phenylalanine",
       "UUC" =>	"Phenylalanine",
       "UUA" =>	"Leucine",
       "UUG" =>	"Leucine",
       "UCU" =>	"Serine",
       "UCC" =>	"Serine",
       "UCA" =>	"Serine",
       "UCG" =>	"Serine",
       "UAU" =>	"Tyrosine",
       "UAC" =>	"Tyrosine",
       "UGU" =>	"Cysteine",
       "UGC" =>	"Cysteine",
       "UGG" =>	"Tryptophan"
    }

    codons.each do |i|
       if ! prots.has_key?(i)
          raise ArgumentError.new "Unknown codon"
       end
       if prots[i] == "STOP"
          break
       end
       res.push(prots[i])
    end

    return res
 end
end
