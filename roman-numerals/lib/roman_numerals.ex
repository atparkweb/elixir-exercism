defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  def numeral(0), do: ""
  def numeral(1), do: "I"
  def numeral(4), do: "IV"
  def numeral(9), do: "IX"
  def numeral(40), do: "XL"
  def numeral(90), do: "XC"
  def numeral(400), do: "CD"
  def numeral(900), do: "XM"

  def numeral(n) when n < 5 do
    Stream.cycle([numeral(1)]) |> Enum.take(n) |> Enum.join
  end
  
  def numeral(n) when n < 9 do
    "V" <> numeral(rem(n, 5)) 
  end
  
  def numeral(n) when n < 40 do
    "X" <> numeral(div(n, 10))
  end

  @spec numeral(pos_integer) :: String.t()
  def numeral(n) when n > 0 and n <= 3000 do
    
  end

  def numeral(_), do: {:error, "Number must be greater than zero and less than 3000"}
end
