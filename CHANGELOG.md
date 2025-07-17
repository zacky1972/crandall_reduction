# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-07-18

### Added
- Initial release of CrandallReduction library
- Pure Elixir implementation of Crandall reduction algorithm
- Core `of/2` function to return tuple `{modulus, reducer}`
- Function signature to provide both modulus value and reducer function for modular arithmetic with numbers of form `2^k + c`
- Support for efficient modular arithmetic with special number forms
- Comprehensive test suite with 1 million random value validation
- Bitwise operation-based implementation for optimal performance
- Support for cryptographic applications like Ed25519 (k=255, c=-19)
- Apache 2.0 license for University of Kitakyushu

### Documentation
- Complete README.md with usage examples and mathematical background
- Comprehensive `@doc` and `@moduledoc` for all functions
- Interactive examples for IEx testing
- Algorithm explanation with step-by-step breakdown
- Performance benefits documentation
- Use cases highlighting cryptographic applications

### Technical Details
- Uses `Bitwise.bsl`, `Bitwise.band`, and `Bitwise.bsr` for optimal performance
- Implements algorithm: `r = low - high * c` with final adjustment
- Returns closure for repeated modular reduction operations
- Comprehensive test coverage with edge case validation

### Performance
- Significantly faster than general-purpose modular arithmetic
- Optimized for numbers of the form `2^k + c`
- Minimal memory allocation during reduction operations
- Efficient bitwise operations for cryptographic applications

### CI/CD
- Added GitHub Actions workflow for continuous integration
- Automated testing on Ubuntu 22.04 with Elixir 1.18.4 and OTP 28.0.1
- Code formatting and quality checks
- Documentation generation validation
- Concurrency control for efficient CI runs

---

## Version History

- **1.0.0**: Initial release with core Crandall reduction implementation

## Contributing

When adding new features or making changes, please update this changelog following the [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format.
