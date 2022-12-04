defmodule AoC22.Day04 do
  defp count(input, fun) do
    input
    |> String.split()
    |> Enum.map(fn row ->
      row
      |> String.split(["-", ","])
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.count(&fun.(&1))
  end

  def part_a(input), do: count(input, &count_a/1)
  def part_b(input), do: count(input, &count_b/1)

  defp count_a([a1, a2, b1, b2]) do
    (a1 >= b1 and a2 <= b2) or
      (b1 >= a1 and b2 <= a2)
  end

  defp count_b([a1, a2, b1, b2]) do
    !Range.disjoint?(a1..a2, b1..b2)
  end
end
