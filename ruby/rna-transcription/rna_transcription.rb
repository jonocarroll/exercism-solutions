class Complement

  CONVERT = { 'C' => 'G',
              'T' => 'A',
              'A' => 'U',
              'G' => 'C' }

  def self.of_dna(rna)
    dna = ""
    rna.split("").each do |nucleotide|
      dna += CONVERT[nucleotide]
    end
    dna
  end
end
