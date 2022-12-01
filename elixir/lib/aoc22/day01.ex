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
    |> String.split("\n\n", trim: true)
    |> Enum.map(&sum_elfs_calories/1)
    |> Enum.sort(order)
  end

  defp sum_elfs_calories(elf_input) do
    elf_input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end
end
