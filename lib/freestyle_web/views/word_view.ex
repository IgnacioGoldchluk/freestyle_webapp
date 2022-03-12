defmodule FreestyleWeb.WordView do
  use FreestyleWeb, :view
  alias FreestyleWeb.WordView

  def render("index.json", %{words: words}) do
    %{data: render_many(words, WordView, "word.json")}
  end

  def render("show.json", %{word: word}) do
    %{data: render_one(word, WordView, "word.json")}
  end

  def render("word.json", %{word: word}) do
    %{
      id: word.id,
      words: word.words
    }
  end
end
