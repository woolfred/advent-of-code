defmodule AoC22.Day01Test do
  use ExUnit.Case

  alias AoC22.Day05, as: Day

  @input Input.read!(2022, 5)

  test "Part A" do
    @input
    |> Day.part_a()
    |> IO.inspect(label: "Part A")
  end

  test "Part B" do
    @input
    |> Day.part_b()
    |> IO.inspect(label: "Part B")
  end
end
