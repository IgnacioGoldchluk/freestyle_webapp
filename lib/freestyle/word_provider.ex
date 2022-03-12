defmodule Freestyle.WordsProvider do
  def words(_difficulty, number_of_words) do
    File.read!("priv/word_dicts/spanish_parsed")
    |> String.split("\n")
    |> Enum.take_random(number_of_words)
  end
end
