defmodule Day1 do
  def calibration_value_1 do
    case File.read("./input.txt") do
      {:ok, contents} ->
        contents
        |> String.replace(~r/[^\d\n]/, "")
        |> String.split("\n", trim: true)
        |> Enum.reduce(0, fn str, acc ->
          num = String.first(str) <> String.last(str)
          String.to_integer(num) + acc
        end)
        |> IO.inspect()

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end

  def calibration_value_2 do
    case File.read("./input.txt") do
      {:ok, contents} ->
        contents
        |> then(fn input ->
          Regex.scan(~r/one|two|three|four|five|six|seven|eight|nine|[\d\n]/, input)
        end)
        |> Enum.map(fn [val] ->
          case val do
            "one" -> "1"
            "two" -> "2"
            "three" -> "3"
            "four" -> "4"
            "five" -> "5"
            "six" -> "6"
            "seven" -> "7"
            "eight" -> "8"
            "nine" -> "9"
            _ -> val
          end
        end)
        |> Enum.join()
        |> String.split("\n", trim: true)
        |> Enum.reduce(0, fn str, acc ->
          String.to_integer(String.first(str) <> String.last(str)) + acc
        end)
        |> IO.inspect()

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end
end
