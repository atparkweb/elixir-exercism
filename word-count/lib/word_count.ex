defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split
    |> Enum.map(fn (a) -> String.downcase(a) end)
    |> Enum.reduce(%{}, fn (key, acc) ->
         val = Map.get(acc, key)
         acc = if val do
	   Map.put(acc, key, val + 1)
	 else
	   Map.put(acc, key, 1)
	 end
       end)
  end
end
