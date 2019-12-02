defmodule AoC19.Day01 do
  def fuel_for(mass) when is_integer(mass) do
    div(mass, 3) - 2
  end

  def fuel_for(mass) when is_binary(mass) do
    mass
    |> String.to_integer()
    |> fuel_for()
  end

  def fuel_for_list(mass, fuel_calc_fun) when is_binary(mass) do
    mass
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn mass, acc -> acc + fuel_calc_fun.(mass) end)
  end

  def all_fuel_for(mass), do: all_fuel_for(0, fuel_for(mass))

  defp all_fuel_for(acc, mass) when mass <= 0, do: acc

  defp all_fuel_for(acc, mass) do
    all_fuel_for(acc + mass, fuel_for(mass))
  end
end
