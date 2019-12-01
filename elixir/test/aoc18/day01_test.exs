defmodule AoC18.Day01Test do
  use ExUnit.Case

  alias AoC18.Day01

  test "positive numbers are added up" do
    assert Day01.frequency("""
           +1
           +1
           +1
           """) == 3
  end

  test "mixed numbers are added up" do
    assert Day01.frequency("""
           +1
           +1
           -2
           """) == 0
  end

  test "negative numbers are added up" do
    assert Day01.frequency("""
           -1
           -1
           -2
           """) == -4
  end

  test "Part A" do
    File.read!("../input/2018/day01.txt")
    |> Day01.frequency()
    |> IO.inspect(label: "Day01a")
  end

  test "first repetition is 0" do
    assert Day01.frequency_repetition("""
           +1
           -1
           """) == 0
  end

  test "first repetition is 10" do
    assert Day01.frequency_repetition("""
           +3
           +3
           +4
           -2
           -4
           """) == 10
  end

  test "first repetition is 14" do
    assert Day01.frequency_repetition("""
           +7
           +7
           +2
           -7
           -4
           """) == 14
  end

  test "Part B" do
    File.read!("../input/2018/day01.txt")
    |> Day01.frequency_repetition()
    |> IO.inspect(label: "Day01b")
  end
end
