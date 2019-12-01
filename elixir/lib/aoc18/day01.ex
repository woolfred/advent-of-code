defmodule AoC18.Day01 do
  def frequency(input) do
    input
    |> to_enum()
    |> Enum.reduce(_acc = 0, fn x, acc -> acc + String.to_integer(x) end)
  end

  def frequency_repetition(input) do
    input
    |> to_enum()
    |> Stream.cycle()
    |> Enum.reduce_while({0, MapSet.new([0])}, &frequency_isnt_repeated(&1, &2))
  end

  defp frequency_isnt_repeated(x, {current_freq, occured_freqs}) do
    new_freq = current_freq + String.to_integer(x)

    if MapSet.member?(occured_freqs, new_freq) do
      {:halt, new_freq}
    else
      {:cont, {new_freq, MapSet.put(occured_freqs, new_freq)}}
    end
  end

  defp to_enum(numbers_string) do
    String.split(numbers_string, "\n", trim: true)
  end
end
