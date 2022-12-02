defmodule AoC22.Day01Test do
  use ExUnit.Case

  alias AoC22.Day02

  @input Input.read!(2022, 2)

  test "Part A" do
    @input
    |> Day02.part_a()
    |> IO.inspect(label: "Day01a")
  end

  test "Part B" do
    @input
    |> Day02.part_b()
    |> IO.inspect(label: "Day01b")
  end
end
