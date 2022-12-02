defmodule Input do
  def read!(year, day) do
    day =
      day
      |> to_string()
      |> String.pad_leading(2, "0")

    File.read!("../input/#{year}/day#{day}.txt")
  end
end
