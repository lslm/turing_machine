defmodule TuringMachine.BinaryNumberIncrementer do
  defp run({:right, "1"}), do: {"1", :R, :right}
  defp run({:right, "0"}), do: {"0", :R, :right}
  defp run({:right, " "}), do: {" ", :L, :carry}
  defp run({:carry, "1"}), do: {"0", :L, :carry}
  defp run({:carry, "0"}), do: {"1", :L, :done}
  defp run({:carry, " "}), do: {"1", :L, :done}
  defp run({:done, _}), do: :exit

  def increment(binary_number) do
    binary_number
    |> String.graphemes
    |> add_blank_to_left
    |> add_blank_to_right
    |> process(1, :right)
    |> Enum.join
    |> String.trim
  end

  defp add_blank_to_right(list), do: list ++ [" "]
  defp add_blank_to_left(list), do: [" " | list]

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
