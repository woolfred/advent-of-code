defmodule AoC22.Day01 do
  def most_calories(input) do
    input
    |> String.split("\n")
    |> Enum.reduce({0, 0}, fn
      "", {current, highest} -> if current > highest, do: {0, current}, else: {0, highest}
      value, {current, highest} -> {current + String.to_integer(value), highest}
    end)
  end

  def top3_calories(input) do
    {_, elves} =
      input
      |> String.split("\n")
      |> Enum.reduce({0, []}, fn
        "", {current, elves} -> {0, [current | elves]}
        value, {current, elves} -> {current + String.to_integer(value), elves}
      end)

    elves
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum()
  end
end
