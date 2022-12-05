defmodule AoC22.Day05 do
  def part(input, fun) do
    {crates, commands} = to_creates_and_commands(input)

    Enum.reduce(commands, crates, fn [amount, from, to], crates ->
      {taken, remaining} = Enum.split(crates[from], amount)

      Map.put(crates, from, remaining)
      |> Map.put(to, fun.(taken) ++ crates[to])
    end)
    |> top_crates()
  end

  def part_a(input), do: part(input, &Enum.reverse/1)
  def part_b(input), do: part(input, & &1)

  defp to_creates_and_commands(input) do
    [crates, commands] = String.split(input, "\n\n")

    {to_crates(crates), to_commands(commands)}
  end

  defp to_crates(input) do
    input
    |> String.split("\n")
    |> Enum.flat_map(fn row ->
      String.graphemes(row)
      |> Enum.drop_every(2)
      |> Enum.with_index()
      |> Enum.filter(fn {crate, _} -> Regex.match?(~r/[A-Z]/, crate) end)
    end)
    |> Enum.reverse()
    |> Enum.reduce(%{}, fn {crate, col}, cratesmap ->
      Map.update(cratesmap, div(col, 2) + 1, [crate], fn existing ->
        [crate | existing]
      end)
    end)
  end

  defp to_commands(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn command ->
      [_move, amount, _from, from, _to, to] = String.split(command)

      Enum.map([amount, from, to], &String.to_integer/1)
    end)
  end

  defp top_crates(crates) do
    Map.keys(crates)
    |> Enum.sort()
    |> Enum.map_join(fn stack -> hd(crates[stack]) end)
  end
end
