defmodule AoC22.Day01 do
  def most_calories(input) do
    elves_sorted_by_calories(input)
    |> hd()
  end

  def top3_calories_summed(input) do
    elves_sorted_by_calories(input)
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp elves_sorted_by_calories(input, order \\ :desc) do
    input
    |> String.split("\n")
    |> Enum.reduce({0, []}, fn
      "", {calories, elves} -> {0, [calories | elves]}
      value, {calories, elves} -> {calories + String.to_integer(value), elves}
    end)
    |> elem(1)
    |> Enum.sort(order)
  end
end
