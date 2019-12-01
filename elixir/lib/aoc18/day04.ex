defmodule AoC18.Day04 do
  alias AoC18.Day04Parser

  def strategy1(log) do
    shifts = log |> to_sleep_time_spans()

    {id, _} =
      shifts
      |> Enum.map(&time_spent_sleeping/1)
      |> Enum.max_by(fn {_id, longest} -> longest end)

    {_, _, minute} = most_asleep_minute({id, Map.get(shifts, id)})

    id * minute
  end

  def strategy2(log) do
    {id, _, minute} =
      log
      |> to_sleep_time_spans()
      |> Enum.map(&most_asleep_minute/1)
      |> Enum.max_by(fn {_, times_asleep, _} -> times_asleep end)

    id * minute
  end

  defp time_spent_sleeping({id, time_spans}) do
    time_spent_sleeping =
      time_spans
      |> Enum.map(&Enum.count/1)
      |> Enum.sum()

    {id, time_spent_sleeping}
  end

  def to_sleep_time_spans(log) do
    log
    |> String.split("\n", trim: true)
    |> Enum.sort()
    |> Enum.map(&parse/1)
    |> sleep_times()
  end

  def parse(log_entry) when is_binary(log_entry) do
    {:ok, [year, month, day, hour, minute, id], "", _, _, _} = Day04Parser.parse_log(log_entry)

    {{year, month, day}, hour, minute, id}
  end

  def sleep_times(shifts), do: sleep_times(%{}, shifts)

  def sleep_times(acc, []), do: acc

  def sleep_times(acc, [{_date, _hr, _min, {:guard, id}} | rest]) do
    {shifts, spans} = minute_spans_sleeping(rest, Map.get(acc, id, []))

    Map.put(acc, id, spans)
    |> sleep_times(shifts)
  end

  def minute_spans_sleeping(
        [{_, _, sleep_start_min, :asleep}, {_, _, wake_up_min, :awake} | rest],
        times
      ) do
    minute_spans_sleeping(rest, [sleep_start_min..(wake_up_min - 1) | times])
  end

  def minute_spans_sleeping(shifts, times), do: {shifts, times}

  defp most_asleep_minute({id, asleep_spans}) do
    {minute, times_asleep} =
      asleep_spans
      |> Enum.reduce(%{}, &count_times_asleep_on_minutes/2)
      |> Enum.max_by(fn {_minute, times} -> times end, fn -> {0, 0} end)

    {id, times_asleep, minute}
  end

  defp count_times_asleep_on_minutes(range, acc) do
    Enum.reduce(range, acc, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
  end
end
