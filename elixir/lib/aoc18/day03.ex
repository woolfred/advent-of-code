defmodule AoC18.Day03 do
  def overlap(input) do
    input
    |> to_claims()
    |> Enum.reduce(_fabric = %{}, &claim_fabric/2)
    |> Enum.count(fn {_coordinate, count} -> count > 1 end)
  end

  def claim_without_overlap(input) do
    claims = input |> to_claims()
    claimed_fabric = Enum.reduce(claims, _fabric = %{}, &claim_fabric/2)

    claims
    |> Enum.find(&uniquely_claimed?(&1, claimed_fabric))
    |> Map.get(:id)
  end

  defp uniquely_claimed?(coordinate, fabric) when is_tuple(coordinate) do
    Map.get(fabric, coordinate) == 1
  end

  defp uniquely_claimed?(claim, fabric) do
    claim
    |> to_coordinates()
    |> Enum.all?(&uniquely_claimed?(&1, fabric))
  end

  defp to_claims(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse/1)
  end

  defp claim_fabric(claim, fabric) do
    claim
    |> to_coordinates()
    |> Enum.reduce(fabric, fn coordinate, acc -> Map.update(acc, coordinate, 1, &(&1 + 1)) end)
  end

  defp parse(claim) do
    ["#" <> id, "@", position, size] = String.split(claim, " ")

    id = String.to_integer(id)
    [x, y] = position |> String.trim(":") |> split_to_numbers(",")
    [width, height] = size |> split_to_numbers("x")

    %{id: id, position: {x, y}, size: {width, height}}
  end

  defp split_to_numbers(string, pattern) do
    string
    |> String.split(pattern)
    |> Enum.map(&String.to_integer/1)
  end

  defp to_coordinates(%{position: {x, y}, size: {width, height}}) do
    till_x = x + width - 1
    till_y = y + height - 1

    for x <- x..till_x, y <- y..till_y, do: {x, y}
  end
end
