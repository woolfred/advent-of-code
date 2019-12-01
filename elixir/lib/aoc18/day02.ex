defmodule AoC18.Day02 do
  def checksum(input) do
    input
    |> to_list_of_graphemes()
    |> Enum.map(&count_appearances/1)
    |> List.flatten()
    |> Enum.filter(&two_and_threes/1)
    |> Enum.reduce(%{}, fn count, acc -> Map.update(acc, count, 1, &(&1 + 1)) end)
    |> Map.values()
    |> Enum.reduce(1, fn count, acc -> count * acc end)
  end

  defp count_appearances(id) do
    id
    |> Enum.reduce(%{}, fn letter, acc -> Map.update(acc, letter, 1, &(&1 + 1)) end)
    |> Map.values()
    |> Enum.sort()
    |> Enum.dedup()
  end

  defp to_list_of_graphemes(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&to_graphemes/1)
  end

  defp to_graphemes(string), do: string |> String.trim() |> String.graphemes()

  defp two_and_threes(value) do
    value == 2 or value == 3
  end

  def find_common(input) do
    input
    |> to_list_of_graphemes()
    |> find_common_id()
  end

  defp find_common_id([head | tail]) do
    case find_id_matching(head, tail) do
      :cont -> find_common_id(tail)
      id -> id
    end
  end

  defp find_id_matching(_current, []), do: :cont

  defp find_id_matching(current, [head | tail]) do
    Enum.zip(current, head)
    |> Enum.count(&different_places?/1)
    |> case do
      1 = _single_difference -> remove_single_difference(current, head)
      _ -> find_id_matching(current, tail)
    end
  end

  defp different_places?({a, a}), do: false
  defp different_places?({_a, _b}), do: true
  defp same_places?({a, a}), do: true
  defp same_places?({_a, _b}), do: false

  defp remove_single_difference(first, second) do
    Enum.zip(first, second)
    |> Enum.filter(&same_places?/1)
    |> Enum.map(fn {cp, _} -> cp end)
    |> List.to_string()
  end
end
