defmodule CrandallReduction do
  @moduledoc """
  Documentation for `CrandallReduction`.
  """

  @spec of(non_neg_integer(), integer()) :: non_neg_integer()
  def of(k, c) do
    a = Bitwise.bsl(1, k)
    mask = a - 1
    p = a + c

    fn x ->
      low = Bitwise.band(x, mask)
      high = Bitwise.bsr(x, k)
      r = low - high * c
      if r >= p, do: r - p, else: r
    end
  end
end
