defmodule Day4 do
  def scratch_1 do
    case File.read("input.txt") do
      {:ok, contents} ->
        contents
        |> String.split("\n", trim: true)
        |> Enum.map(fn str ->
          card =
            Regex.named_captures(
              ~r/Card\s+\d+:\s+(?<possible_winner>[\d\s]+?)\s+\|\s+(?<scratched>[\d\s]+?)\s*$/,
              str
            )

          possible_winner_arr =
            card["possible_winner"]
            |> String.split()

          scratched_arr =
            card["scratched"]
            |> String.split()

          # Find intersection between possible_winners and scratched
          winners =
            Enum.filter(possible_winner_arr, &Enum.member?(scratched_arr, &1))
            |> length()
            |> IO.inspect()

          if winners - 1 >= 0 do
            Integer.pow(2, winners - 1)
          else
            0
          end
        end)
        |> Enum.sum()
        |> IO.inspect()

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end

  def scratch_2 do
    case File.read("input.txt") do
      {:ok, contents} ->
        data =
          contents
          |> String.split("\n", trim: true)
          |> Enum.map(fn str ->
            card =
              Regex.named_captures(
                ~r/Card\s+\d+:\s+(?<possible_winner>[\d\s]+?)\s+\|\s+(?<scratched>[\d\s]+?)\s*$/,
                str
              )

            possible_winner_arr =
              card["possible_winner"]
              |> String.split()
              |> Enum.map(fn str -> elem(Integer.parse(str), 0) end)

            scratched_arr =
              card["scratched"]
              |> String.split()
              |> Enum.map(fn str -> elem(Integer.parse(str), 0) end)

            # Find intersection between possible_winners and scratched
            winners =
              Enum.filter(possible_winner_arr, &Enum.member?(scratched_arr, &1))
              |> length()

            winners
          end)

        data
        |> Enum.with_index(1)
        |> Enum.reduce(
          1..length(data) |> Enum.map(&{&1, 1}) |> Enum.into(%{}),
          fn {wins, card}, acc ->
            if wins > 0,
              do:
                (card + 1)..(card + wins)
                |> Enum.reduce(acc, fn idx, acc -> Map.put(acc, idx, acc[idx] + acc[card]) end),
              else: acc
          end
        )
        |> then(&Map.values/1)
        |> Enum.sum()
        |> IO.inspect()

      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end
end
