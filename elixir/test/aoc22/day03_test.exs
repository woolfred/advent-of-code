defmodule AoC22.Day01Test do
  use ExUnit.Case

  alias AoC22.Day03

  @input Input.read!(2022, 3)

  test "Part A" do
    @input
    |> Day03.part_a()
    |> IO.inspect(label: "Part A")
  end

  test "Part B" do
    @input
    |> Day03.part_b()
    |> IO.inspect(label: "Part B")
  end
end
