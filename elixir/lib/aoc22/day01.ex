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
    |> String.split("\n\n")
    |> Enum.map(&sum_elfs_calories/1)
    |> Enum.sort(order)
  end

  defp sum_elfs_calories(elf_input) do
    elf_input
    |> String.split()
    |> Enum.reduce(0, fn calories, acc -> acc + String.to_integer(calories) end)
  end
end
