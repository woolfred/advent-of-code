defmodule AoC18.Day04Parser do
  import NimbleParsec

  guard_command =
    ignore(string("Guard #"))
    |> integer(min: 1)
    |> ignore(string(" begins shift"))
    |> unwrap_and_tag(:guard)

  asleep_command = ignore(string("falls asleep")) |> replace(:asleep)

  awake_command = ignore(string("wakes up")) |> replace(:awake)

  defparsec(
    :parse_log,
    ignore(string("["))
    |> integer(4)
    |> ignore(string("-"))
    |> integer(2)
    |> ignore(string("-"))
    |> integer(2)
    |> ignore(string(" "))
    |> integer(2)
    |> ignore(string(":"))
    |> integer(2)
    |> ignore(string("] "))
    |> choice([guard_command, asleep_command, awake_command])
  )
end
