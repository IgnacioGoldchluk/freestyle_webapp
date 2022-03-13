defmodule FreestyleWeb.FreestyleView do
  use FreestyleWeb, :view

  def durations() do
    [60, 120, "Infinite"]
  end

  def difficulties() do
    ["Easy", "Medium", "Hard", "Extreme"]
  end
end
