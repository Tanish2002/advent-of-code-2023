defmodule Day1 do
  def calibration_value_1 do
    case File.read("./input.txt") do
      {:ok, contents} ->
        contents
        |> String.replace(~r/[^\d\n]/, "")
        |> String.split("\n", trim: true)
        |> Enum.map(fn str ->
          num = String.first(str) <> String.last(str)
          {val, _} = Integer.parse(num)
          val
        end)
        |> Enum.sum()
        |> IO.inspect()

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end

  def calibration_value_2 do
    case File.read("./input.txt") do
      {:ok, contents} ->
        contents
        # Niche replacements
        |> String.replace(~r/eighthree/, "83")
        |> String.replace(~r/eightwo/, "82")
        |> String.replace(~r/sevenine/, "79")
        |> String.replace(~r/twone/, "21")
        |> String.replace(~r/oneight/, "18")
        # Simple replacements
        |> String.replace(~r/one/, "1")
        |> String.replace(~r/two/, "2")
        |> String.replace(~r/three/, "3")
        |> String.replace(~r/four/, "4")
        |> String.replace(~r/five/, "5")
        |> String.replace(~r/six/, "6")
        |> String.replace(~r/seven/, "7")
        |> String.replace(~r/eight/, "8")
        |> String.replace(~r/nine/, "9")
        |> String.replace(~r/[^\d\n]/, "")
        |> String.split("\n", trim: true)
        |> Enum.map(fn str ->
          num = String.first(str) <> String.last(str)
          {val, _} = Integer.parse(num)
          val
        end)
        |> Enum.sum()
        |> IO.inspect()

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end
end
