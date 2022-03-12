defmodule FreestyleWeb.WordController do
  use FreestyleWeb, :controller
  alias Freestyle.WordsProvider
  action_fallback FreestyleWeb.FallbackController

  def index(conn, params) do
    json(conn, %{words: WordsProvider.words(Map.fetch!(params, "difficulty"), 128)})
  end

  def create(conn, params) do
    index(conn, params)
  end
end
