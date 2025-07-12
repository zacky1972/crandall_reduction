# CrandallReduction

A pure Elixir implementation of the Crandall reduction algorithm for efficient modular arithmetic with numbers of the form `2^k + c`.

## Overview

The Crandall reduction algorithm provides an efficient way to compute modular reduction for numbers of the special form `p = 2^k + c`. This is particularly useful in cryptographic applications, such as Ed25519 signature verification, where fast modular arithmetic is essential.

## Installation

For local development, clone the repository and run:

```bash
git clone https://github.com/your-username/crandall_reduction.git
cd crandall_reduction
mix deps.get
```

## Usage

The main function `CrandallReduction.of/2` takes two parameters:
- `k`: A non-negative integer defining the power of 2
- `c`: An integer constant

It returns a closure that performs modular reduction modulo `2^k + c`.

```elixir
# Example: Ed25519 uses k=255, c=-19
reducer = CrandallReduction.of(255, -19)

# Apply the reduction to a number
result = reducer.(123456789)
# => reduced value modulo 2^255 - 19
```

## Algorithm Details

The Crandall reduction algorithm works by:
1. Computing `a = 2^k` and `p = 2^k + c`
2. For input `x`, extracting the low `k` bits and high bits
3. Computing `r = low - high * c`
4. If `r >= p`, subtracting `p` to get the final result

This approach is much faster than standard modular arithmetic for numbers of this special form.

## Testing

Run the test suite with:

```bash
mix test
```

The tests include a comprehensive validation using 1 million random values to ensure correctness against standard modular arithmetic.

## Mathematical Background

The Crandall reduction is based on the observation that for `p = 2^k + c`, we can efficiently compute `x mod p` using bitwise operations. This is particularly valuable in cryptographic contexts where performance is critical.

## License

Copyright (c) 2025 University of Kitakyushu

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
