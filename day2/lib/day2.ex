defmodule Day2 do
  def cube_1 do
    case File.read("input.txt") do
      {:ok, contents} ->
        contents
        |> String.split(["\n"], trim: true)
        |> Enum.reduce(0, fn str, acc ->
          [game_id, red, blue, green] = game_Parser(str)

          if red > 12 || green > 13 || blue > 14 do
            acc
          else
            game_id + acc
          end
        end)
        |> IO.inspect()

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end

  def cube_2 do
    case File.read("input.txt") do
      {:ok, contents} ->
        contents
        |> String.split(["\n"], trim: true)
        |> Enum.reduce(0, fn str, acc ->
          [_, red, blue, green] = game_Parser(str)
          product = red * blue * green
          product + acc
        end)
        |> IO.inspect()

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end

  defp game_Parser(game) do
    [[_, game_id]] = Regex.scan(~r/Game (\d+)/, game)

    [_, max_red] =
      Regex.scan(~r/(\d+) red/, game)
      |> Enum.max_by(fn [_, num] -> String.to_integer(num) end)

    [_, max_blue] =
      Regex.scan(~r/(\d+) green/, game)
      |> Enum.max_by(fn [_, num] -> String.to_integer(num) end)

    [_, max_green] =
      Regex.scan(~r/(\d+) blue/, game)
      |> Enum.max_by(fn [_, num] -> String.to_integer(num) end)

    [
      String.to_integer(game_id),
      String.to_integer(max_red),
      String.to_integer(max_blue),
      String.to_integer(max_green)
    ]
  end
end
