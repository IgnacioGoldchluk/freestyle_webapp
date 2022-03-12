defmodule FreestyleWeb.WordsController do
  use FreestyleWeb, :controller

  alias Freestyle.Words
  alias Freestyle.Words.Word

  action_fallback FreestyleWeb.FallbackController

  def index(conn, _params) do
    words = Words.list_words()
    render(conn, "index.json", words: words)
  end

  def create(conn, %{"word" => word_params}) do
    with {:ok, %Word{} = word} <- Words.create_word(word_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.word_path(conn, :show, word))
      |> render("show.json", word: word)
    end
  end

  def show(conn, %{"id" => id}) do
    word = Words.get_word!(id)
    render(conn, "show.json", word: word)
  end

  def update(conn, %{"id" => id, "word" => word_params}) do
    word = Words.get_word!(id)

    with {:ok, %Word{} = word} <- Words.update_word(word, word_params) do
      render(conn, "show.json", word: word)
    end
  end

  def delete(conn, %{"id" => id}) do
    word = Words.get_word!(id)

    with {:ok, %Word{}} <- Words.delete_word(word) do
      send_resp(conn, :no_content, "")
    end
  end
end
