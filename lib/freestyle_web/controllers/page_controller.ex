defmodule FreestyleWeb.PageController do
  use FreestyleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
