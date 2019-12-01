defmodule AoC18.Day02Test do
  use ExUnit.Case

  alias AoC18.Day02

  test "Part A example" do
    ids = """
    abcdef
    bababc
    abbcde
    abcccd
    aabcdd
    abcdee
    ababab
    """

    assert Day02.checksum(ids) == 12
  end

  test "Part A" do
    File.read!("../input/2018/day02.txt")
    |> Day02.checksum()
    |> IO.inspect(label: "Day02a")
  end

  test "Part B example" do
    ids = """
    abcde
    fghij
    klmno
    pqrst
    fguij
    axcye
    wvxyz
    """

    assert Day02.find_common(ids) == "fgij"
  end

  test "Part B" do
    File.read!("../input/2018/day02.txt")
    |> Day02.find_common()
    |> IO.inspect(label: "Day02b")
  end
end
