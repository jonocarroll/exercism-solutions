defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    case number do
      n when n >= 1000 -> "M" <> numeral(n - 1000)
      n when n >= 900 -> "CM" <> numeral(n - 900)
      n when n >= 500 -> "D" <> numeral(n - 500)
      n when n >= 400 -> "CD" <> numeral(n - 400)
      n when n >= 100 -> "C" <> numeral(n - 100)
      n when n >= 90 -> "XC" <> numeral(n - 90)
      n when n >= 50 -> "L" <> numeral(n - 50)
      n when n >= 40 -> "XL" <> numeral(n - 40)
      n when n >= 10 -> "X" <> numeral(n - 10)
      n when n >= 9 -> "IX" <> numeral(n - 9)
      n when n >= 5 -> "V" <> numeral(n - 5)
      n when n >= 4 -> "IV" <> numeral(n - 4)
      n when n >= 1 -> "I" <> numeral(n - 1)
      _ -> ""
      end
  end
end
