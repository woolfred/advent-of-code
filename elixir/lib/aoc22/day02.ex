defmodule AoC22.Day02 do
  defp part(input, score_fun) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&score_fun.(&1))
    |> Enum.sum()
  end

  def part_a(input), do: part(input, &score_a/1)
  def part_b(input), do: part(input, &score_b/1)

  defp score_a("A X"), do: 1 + 3
  defp score_a("B X"), do: 1 + 0
  defp score_a("C X"), do: 1 + 6

  defp score_a("A Y"), do: 2 + 6
  defp score_a("B Y"), do: 2 + 3
  defp score_a("C Y"), do: 2 + 0

  defp score_a("A Z"), do: 3 + 0
  defp score_a("B Z"), do: 3 + 6
  defp score_a("C Z"), do: 3 + 3

  defp score_b("A X"), do: 0 + 3
  defp score_b("B X"), do: 0 + 1
  defp score_b("C X"), do: 0 + 2

  defp score_b("A Y"), do: 3 + 1
  defp score_b("B Y"), do: 3 + 2
  defp score_b("C Y"), do: 3 + 3

  defp score_b("A Z"), do: 6 + 2
  defp score_b("B Z"), do: 6 + 3
  defp score_b("C Z"), do: 6 + 1
end
