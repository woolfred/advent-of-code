defmodule AoC22.Day03 do
  def part_a(input) do
    input
    |> String.split()
    |> Enum.map(fn rucksack ->
      rucksack
      |> split_in_two()
      |> find_common_item()
      |> priority()
    end)
    |> Enum.sum()
  end

  def part_b(input) do
    input
    |> String.split()
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.chunk_every(3)
    |> Enum.map(fn [a, b, c] ->
      d = a -- a -- b
      hd(d -- d -- c)
    end)
    |> Enum.map(&priority/1)
    |> Enum.sum()
  end

  defp split_in_two(input) do
    split_position = byte_size(input) |> div(2)

    input
    |> String.split("", trim: true)
    |> Enum.split(split_position)
  end

  defp find_common_item({a, b}), do: hd(a -- a -- b)

  defp priority(<<codepoint::utf8>>) when codepoint in ?a..?z do
    codepoint - ?a + 1
  end

  defp priority(<<codepoint::utf8>>) when codepoint in ?A..?Z do
    codepoint - ?A + 27
  end
end
