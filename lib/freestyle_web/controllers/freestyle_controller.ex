defmodule FreestyleWeb.FreestyleController do
  use FreestyleWeb, :controller
  alias Freestyle.WordsProvider

  def index(conn, _params) do
    render(conn, "new_session.html")
  end

  def create(conn, %{"duration" => "Infinite"} = params) do
    params =
      Map.put(params, "seconds_per_word", seconds_per_word(Map.fetch!(params, "difficulty")))

    render(conn, "streamed_freestyle.html", freestyle_session: params)
  end

  def create(conn, params) do
    session_params = generate_session_from_user_params(params)
    trigger_session(conn, session_params)
  end

  defp trigger_session(conn, session_params) do
    render(conn, "play.html", freestyle_session: session_params)
  end

  defp generate_session_from_user_params(%{"duration" => duration, "difficulty" => difficulty}) do
    seconds_interval = seconds_per_word(difficulty)

    words_to_fetch = div(String.to_integer(duration), seconds_interval)

    %{
      duration: duration,
      words: Enum.join(WordsProvider.words(difficulty, words_to_fetch), ","),
      difficulty: difficulty
    }
  end

  defp seconds_per_word(difficulty) do
    case difficulty do
      "Easy" -> 10
      "Medium" -> 6
      "Hard" -> 5
    end
  end
end
