defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Enum.join()
    |> String.downcase()
    |> String.graphemes()
    |> divide(workers)
    |> Task.async_stream(&count_letters/1)
    |> conquer()
  end

  defp divide(graphemes, n_chunks) do
    n_graphemes = Enum.count(graphemes)
    if n_graphemes == 0 do
      []
    else 
      n_per_chunk = :erlang.ceil(n_graphemes / n_chunks)
      Enum.chunk_every(graphemes, n_per_chunk)
    end
  end

  defp conquer(results_stream) do
      Enum.reduce(results_stream, %{}, fn {:ok, worker_result}, acc ->
        Map.merge(acc, worker_result, fn _key, acc_val, worker_val ->
          acc_val + worker_val
        end)
      end)
  end

  defp count_letters(graphemes) do
    graphemes = Enum.filter(graphemes, fn grapheme ->
      String.match?(grapheme, ~r/^\p{L}$/u)
    end)
    Enum.frequencies(graphemes)
  end

end
