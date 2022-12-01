defmodule AoC19.Day01Test do
  use ExUnit.Case

  alias AoC22.Day01

  test "Part A" do
    File.read!("../input/2022/day01.txt")
    |> Day01.most_calories()
    |> IO.inspect(label: "Day01a")
  end

  test "Part B" do
    File.read!("../input/2022/day01.txt")
    |> Day01.top3_calories_summed()
    |> IO.inspect(label: "Day01b")
  end
end
