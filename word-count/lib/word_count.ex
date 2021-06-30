defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  
  def format_key(key) do
    key
    |> String.downcase
    |> (fn (key) -> Regex.replace(~r/[^[\-\p{L}0-9]/u, key, "") end).()
  end

  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split(~r/[ _]/, trim: true)
    |> Enum.reduce(%{}, fn (key, acc) ->
         key = format_key(key)
         val = Map.get(acc, key)
         if val do
	   Map.put(acc, key, val + 1)
	 else
	   Map.put(acc, key, 1)
	 end
       end)
    |> Map.delete("")
  end
end
