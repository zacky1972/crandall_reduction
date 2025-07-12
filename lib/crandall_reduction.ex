defmodule CrandallReduction do
  @moduledoc """
  The main function `CrandallReduction.of/2` takes two parameters:
  - `k`: A non-negative integer defining the power of 2
  - `c`: An integer constant

  It returns a closure that performs modular reduction modulo `2^k + c`.

  ```elixir
  # Example: Ed25519 uses k=255, c=-19
  {_, reducer} = CrandallReduction.of(255, -19)

  # Apply the reduction to a number
  result = reducer.(123456789)
  # => reduced value modulo 2^255 - 19
  ```
  """

  @doc """
  Creates a Crandall reduction function for modular arithmetic with numbers of the form `2^k + c`.

  ## Parameters

  * `k` - A non-negative integer defining the power of 2
  * `c` - An integer constant

  ## Returns

  A closure that takes an integer `x` and returns `x mod (2^k + c)`.

  ## Algorithm

  The Crandall reduction algorithm efficiently computes modular reduction for numbers of the special form `p = 2^k + c`:

  1. Computes `a = 2^k` and `p = 2^k + c`
  2. For input `x`, extracts the low `k` bits using `x & (2^k - 1)`
  3. Extracts the high bits using `x >> k`
  4. Computes `r = low - high * c`
  5. If `r >= p`, subtracts `p` to get the final result

  This approach is much faster than standard modular arithmetic for numbers of this form.

  ## Examples

      iex> {p, reducer} = CrandallReduction.of(8, 3)
      iex> reducer.(p)
      0

      iex> {_, reducer} = CrandallReduction.of(255, -19)
      iex> reducer.(123456789)
      123456789

      iex> {p, reducer} = CrandallReduction.of(255, -19)
      iex> reducer.(p + 1)
      1

  ## Use Cases

  This algorithm is particularly useful in cryptographic applications such as:
  * Ed25519 signature verification (k=255, c=-19)
  * Other elliptic curve cryptography implementations
  * Any scenario requiring fast modular arithmetic with numbers of the form `2^k + c`

  ## Performance

  The algorithm uses only bitwise operations and simple arithmetic, making it significantly faster than general-purpose modular arithmetic for the target number forms.
  """
  @spec of(non_neg_integer(), integer()) ::
          {non_neg_integer(), (non_neg_integer() -> non_neg_integer())}
  def of(k, c) do
    a = Bitwise.bsl(1, k)
    mask = a - 1
    p = a + c

    {
      p,
      fn x ->
        low = Bitwise.band(x, mask)
        high = Bitwise.bsr(x, k)
        r = low - high * c
        if r >= p, do: r - p, else: r
      end
    }
  end
end
