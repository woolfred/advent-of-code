defmodule AoC18.Day03Test do
  use ExUnit.Case

  alias AoC18.Day03

  test "Part A example" do
    claims = """
    #1 @ 1,3: 4x4
    #2 @ 3,1: 4x4
    #3 @ 5,5: 2x2
    """

    assert Day03.overlap(claims) == 4
  end

  test "Part A" do
    File.read!("../input/2018/day03.txt")
    |> Day03.overlap()
    |> IO.inspect(label: "Day03a")
  end

  test "Part B example" do
    claims = """
    #1 @ 1,3: 4x4
    #2 @ 3,1: 4x4
    #3 @ 5,5: 2x2
    """

    assert Day03.claim_without_overlap(claims) == 3
  end

  test "Part B" do
    File.read!("../input/2018/day03.txt")
    |> Day03.claim_without_overlap()
    |> IO.inspect(label: "Day03b")
  end
end
