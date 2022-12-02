defmodule AoC22.Day01Test do
  use ExUnit.Case

  alias AoC22.Day01

  @input Input.read!(2022, 1)

  test "Part A" do
    @input
    |> Day01.most_calories()
    |> IO.inspect(label: "Day01a")
  end

  test "Part B" do
    @input
    |> Day01.top3_calories_summed()
    |> IO.inspect(label: "Day01b")
  end
end
