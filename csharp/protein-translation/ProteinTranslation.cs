using System;
using System.Collections.Generic;

public static class ProteinTranslation
{
    public static string[] Proteins(string strand)
    {
        List<string> res = new List<string>();
        if (strand.Length == 0)
        {
            return res.ToArray();
        }

        List<string> codons = new List<string>();

        for (int i = 0; i < strand.Length; i += 3)
        {
            if ((i + 3) < strand.Length)
                codons.Add(strand.Substring(i, 3));
            else
                codons.Add(strand.Substring(i));
        }

        Dictionary<string, string> prots = new Dictionary<string, string>();

        prots["UAA"] = "STOP";
        prots["UAG"] = "STOP";
        prots["UGA"] = "STOP";
        prots["AUG"] = "Methionine";
        prots["UUU"] = "Phenylalanine";
        prots["UUC"] = "Phenylalanine";
        prots["UUA"] = "Leucine";
        prots["UUG"] = "Leucine";
        prots["UCU"] = "Serine";
        prots["UCC"] = "Serine";
        prots["UCA"] = "Serine";
        prots["UCG"] = "Serine";
        prots["UAU"] = "Tyrosine";
        prots["UAC"] = "Tyrosine";
        prots["UGU"] = "Cysteine";
        prots["UGC"] = "Cysteine";
        prots["UGG"] = "Tryptophan";

        for (int i = 0; i < codons.Count; i += 1)
        {
            if (!prots.ContainsKey(codons[i]))
            {
                throw new ArgumentException("unexpected codon");
            }
            if (prots[codons[i]] == "STOP")
            {
                break;
            }

            res.Add(prots[codons[i]]);

        }

        return res.ToArray();

    }
}