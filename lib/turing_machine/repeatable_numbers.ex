defmodule TuringMachine.RepeatableNumbers do
  defp run({:b, " "}), do: {"0", :R, :c}
  defp run({:c, " "}), do: {" ", :R, :e}
  defp run({:e, " "}), do: {"1", :R, :f}
  defp run({:f, " "}), do: {" ", :R, :b}

  def start() do
    ""
    |> String.graphemes
    |> add_blank_to_left
    |> add_blank_to_right
    |> process(1, :right)
    |> Enum.join
    |> String.trim
  end

  defp add_blank_to_right(list), do: list ++ [" "]
  defp add_blank_to_left(list), do: [" " | list]

  def process(binary_number_list, 20, current_state) do
    binary_number_list
  end

  def process(binary_number_list, index, current_state) do
    case run({current_state, Enum.at(binary_number_list, index)}) do
      {digit_to_write, next_move, next_state} ->
        updated_list = write(binary_number_list, index, digit_to_write)
        process(updated_list, (index + next_move(next_move)), next_state)

      :exit -> binary_number_list
    end
  end

  defp write(binary_number_list, index, value) do
    List.replace_at(binary_number_list, index, value)
  end

  defp next_move(:R), do: 1
  defp next_move(:L), do: -1
end
