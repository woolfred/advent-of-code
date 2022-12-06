defmodule AoC22.Day06 do
  def part_a(input), do: find_marker(input, 4)

  def part_b(input), do: find_marker(input, 14)

  defp find_marker(input, nr_of_distinct_chars) do
    find_marker(input, 0..(nr_of_distinct_chars - 1), nr_of_distinct_chars)
  end

  defp find_marker(input, range, nr_of_distinct_chars, done? \\ false)
  defp find_marker(_input, a..b, _, true), do: b

  defp find_marker(input, a..b = slice_range, nr_of_distinct_chars, _done?) do
    set =
      String.slice(input, slice_range)
      |> String.split("", trim: true)
      |> MapSet.new()

    done = MapSet.size(set) == nr_of_distinct_chars
    find_marker(input, (a + 1)..(b + 1), nr_of_distinct_chars, done)
  end
end
