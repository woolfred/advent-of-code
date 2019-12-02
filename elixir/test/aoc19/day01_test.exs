defmodule AoC19.Day01Test do
  require IEx
  use ExUnit.Case

  alias AoC19.Day01

  test "fuel for mass of 12 is 2" do
    assert Day01.fuel_for(12) == 2
  end

  test "fuel for mass of 14 is 2" do
    assert Day01.fuel_for(14) == 2
  end

  test "fuel for mass of 1969 is 654" do
    assert Day01.fuel_for(1969) == 654
  end

  test "fuel for mass of 100756 is 33583" do
    assert Day01.fuel_for(100_756) == 33583
  end

  test "Part A" do
    File.read!("../input/2019/day01.txt")
    |> Day01.calc_fuel_sum(&Day01.fuel_for/1)
    |> IO.inspect(label: " Day01a")
  end

  test "recursive fuel for mass of 14 is 2" do
    assert Day01.all_fuel_for(14) == 2
  end

  test "recursive fuel for mass of 654 is 966" do
    assert Day01.all_fuel_for(1969) == 966
  end

  test "recursive fuel for mass of 100756 is 50346" do
    assert Day01.all_fuel_for(100_756) == 50346
  end

  test "Part B" do
    File.read!("../input/2019/day01.txt")
    |> Day01.calc_fuel(&Day01.all_fuel_for/1)
    |> IO.inspect(label: " Day01b")
  end
end
