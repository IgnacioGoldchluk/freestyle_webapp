defmodule DictFrequencyConversor do
  def parse(input_file, dest_file) do
    contents = File.read!(input_file)
    |> String.split("\n", trim: true)
    |> Enum.map(&get_word(&1))
    |> Enum.filter(&String.length(&1)>2)
    File.write!(dest_file, Enum.join(contents, "\n"))
  end

  defp get_word(rank_string) do
    rank_string
    |> String.split(~r"\.|•")
    |> Enum.at(1)
    |> String.trim
  end

end
