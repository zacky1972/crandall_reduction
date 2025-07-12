defmodule CrandallReductionTest do
  use ExUnit.Case
  doctest CrandallReduction

  @k 255
  @c -19
  @max Bitwise.bsl(1, @k + 1)

  test "random test" do
    1..1_000_000
    |> Enum.map(fn _ -> :rand.uniform(@max) end)
    |> Enum.map(fn x ->
      {p, mod} = CrandallReduction.of(@k, @c)
      assert(rem(x, p) == mod.(x))
    end)
  end
end
