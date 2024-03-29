defmodule AoC22.Day06 do
  def part_a(input), do: find_distinct_chars_marker(input, 4)

  def part_b(input), do: find_distinct_chars_marker(input, 14)

  defp find_distinct_chars_marker(input, length) do
    input
    |> String.to_charlist()
    |> Stream.chunk_every(length, 1, :discard)
    |> Stream.with_index(length)
    |> Enum.find(fn {list, _chars_processed_count} -> length(Enum.uniq(list)) == length end)
    |> elem(1)
  end
end
