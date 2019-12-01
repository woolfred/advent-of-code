defmodule AoC18.Day04Test do
  use ExUnit.Case

  alias AoC18.Day04

  test "Part A example" do
    log = """
    [1518-11-01 00:00] Guard #10 begins shift
    [1518-11-01 00:05] falls asleep
    [1518-11-01 00:25] wakes up
    [1518-11-01 00:30] falls asleep
    [1518-11-01 00:55] wakes up
    [1518-11-01 23:58] Guard #99 begins shift
    [1518-11-02 00:40] falls asleep
    [1518-11-02 00:50] wakes up
    [1518-11-03 00:05] Guard #10 begins shift
    [1518-11-03 00:24] falls asleep
    [1518-11-03 00:29] wakes up
    [1518-11-04 00:02] Guard #99 begins shift
    [1518-11-04 00:36] falls asleep
    [1518-11-04 00:46] wakes up
    [1518-11-05 00:03] Guard #99 begins shift
    [1518-11-05 00:45] falls asleep
    [1518-11-05 00:55] wakes up
    """

    assert Day04.strategy1(log) == 240
  end

  test "extracts the time spent asleep" do
    log = """
    [1518-11-01 00:00] Guard #10 begins shift
    [1518-11-01 00:05] falls asleep
    [1518-11-01 00:25] wakes up
    [1518-11-01 00:30] falls asleep
    [1518-11-01 00:55] wakes up
    """

    assert %{10 => list} = Day04.to_sleep_time_spans(log)
    assert Enum.count(list) == 2
  end

  test "parse a guard takes shift log" do
    log = "[1518-11-01 00:00] Guard #10 begins shift"

    assert Day04.parse(log) == {{1518, 11, 01}, 0, 0, {:guard, 10}}
  end

  test "parse a guard falls asleep" do
    log = "[1518-11-01 00:05] falls asleep"

    assert Day04.parse(log) == {{1518, 11, 01}, 0, 5, :asleep}
  end

  test "parse a guard wakes up" do
    log = "[1518-11-01 00:25] wakes up"

    assert Day04.parse(log) == {{1518, 11, 01}, 0, 25, :awake}
  end

  # @tag :skip
  test "Part A" do
    File.read!("../input/2018/day04.txt")
    |> Day04.strategy1()
    |> IO.inspect(label: "Day04a")
  end

  test "Part B example" do
    log = """
    [1518-11-01 00:00] Guard #10 begins shift
    [1518-11-01 00:05] falls asleep
    [1518-11-01 00:25] wakes up
    [1518-11-01 00:30] falls asleep
    [1518-11-01 00:55] wakes up
    [1518-11-01 23:58] Guard #99 begins shift
    [1518-11-02 00:40] falls asleep
    [1518-11-02 00:50] wakes up
    [1518-11-03 00:05] Guard #10 begins shift
    [1518-11-03 00:24] falls asleep
    [1518-11-03 00:29] wakes up
    [1518-11-04 00:02] Guard #99 begins shift
    [1518-11-04 00:36] falls asleep
    [1518-11-04 00:46] wakes up
    [1518-11-05 00:03] Guard #99 begins shift
    [1518-11-05 00:45] falls asleep
    [1518-11-05 00:55] wakes up
    """

    assert Day04.strategy2(log) == 4455
  end

  test "Part B" do
    File.read!("../input/2018/day04.txt")
    |> Day04.strategy2()
    |> IO.inspect(label: "Day04b")
  end
end
