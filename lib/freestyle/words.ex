defmodule Freestyle.Words do
  def list_words() do
    ["Ojota", "Simpson"]
  end
end

defmodule Freestyle.Words.Word do
  defstruct [:word_list]
end
