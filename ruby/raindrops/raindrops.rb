class Raindrops

  def self.convert(n)
    begin
      res = ""
      if n % 3 == 0
        res += "Pling"
      end
      if n % 5 == 0
        res += "Plang"
      end
      if n % 7 == 0
        res += "Plong"
      end
      if res == ""
        res = n.to_s
      end
      return res
    end
  end

end
