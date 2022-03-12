defmodule FreestyleWeb.FreestyleView do
  use FreestyleWeb, :view

  def durations() do
    [60, 120]
  end

  def difficulties() do
    ["Easy", "Medium", "Hard"]
  end
end
