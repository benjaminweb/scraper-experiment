# Benchmarking Scraping Frameworks

- Rust, scraper:
  - peak memory allocation: 3 MB, runtime: 4.7 ms
  - run: `cargo run --release`
- Haskell, scalpel (using `html-parse`)
  - peak memory allocation: 13 MB, runtime: 10.8 ms
  - run:
    - `cabal run memory-it-t`
    - `cabal run memory-it-s`
    - `time cabal run memory-it-t`
    - `cabal run time-it`
