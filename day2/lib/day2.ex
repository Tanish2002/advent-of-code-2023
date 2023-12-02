defmodule Day2 do
  def cube_1 do
    case File.read("input.txt") do
      {:ok, contents} ->
        contents
        |> String.split(["\n"], trim: true)
        |> Enum.map(fn str ->
          Regex.scan(~r/(\d+) (red|blue|green)/, str)
          |> Enum.group_by(fn [_, _num, color] -> color end)
        end)
        |> Enum.map(fn color_map ->
          Enum.reduce(color_map, true, fn {color, value_list}, acc ->
            acc and
              Enum.reduce(value_list, true, fn [_, num, _], acc ->
                case color do
                  "red" ->
                    if String.to_integer(num) > 12 do
                      false and acc
                    else
                      true and acc
                    end

                  "blue" ->
                    if String.to_integer(num) > 14 do
                      false and acc
                    else
                      true and acc
                    end

                  "green" ->
                    if String.to_integer(num) > 13 do
                      false and acc
                    else
                      true and acc
                    end
                end
              end)
          end)
        end)
        |> Enum.with_index()
        |> Enum.reduce(0, fn {boolean, index}, acc ->
          if boolean do
            acc + index + 1
          else
            acc
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
        |> Enum.map(fn str ->
          Regex.scan(~r/(\d+) (red|blue|green)/, str)
          |> Enum.group_by(fn [_, _num, color] -> color end)
        end)
        |> Enum.map(fn color_map ->
          Enum.reduce(color_map, 1, fn {_color, value_list}, acc ->
            numbers = Enum.map(value_list, fn [_, num, _color] -> String.to_integer(num) end)
            max_number = Enum.max(numbers)
            acc * max_number
          end)
        end)
        |> Enum.sum()
        |> IO.inspect()

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end
end
