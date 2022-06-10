defmodule TempTest do
  def long_synopsis?(%{"synopsisLength" => "Long"}), do: true

  def long_synopsis?(%{}) do
    false
  end
end
