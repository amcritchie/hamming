require_relative "testing_library"

def hamming(strand_1, strand_2)

  count = 0
  hamming_distance = 0

  if strand_1 <= strand_2
    dna1 = strand_1.split("")
    dna2 = strand_2.split("")
  else
    dna1 = strand_2.split("")
    dna2 = strand_1.split("")
  end
  
  dna1.each do |letter|
    if letter != dna2[count]
      hamming_distance += 1
    end
    count += 1
  end
  hamming_distance
end

check("Hamming distance between identical strands",
      hamming("A", "A") == 0)

check("Hamming distance for single nucleotide strand",
      hamming("A", "G") == 1)

check("Hamming distance between small strands",
      hamming("AG", "CT") == 2)

check("Hamming distance between two other small strands",
      hamming("AT", "CT") == 1)

check("Hamming distance in longer strands",
      hamming("GGACG", "GGTCG") == 1)

check("Ignoring extra length in the first strand when it's longer",
      hamming("AAAG", "AAA") == 0)

check("Ignoring extra length in the second strand when it's longer",
      hamming("AAA", "AAAG") == 0)