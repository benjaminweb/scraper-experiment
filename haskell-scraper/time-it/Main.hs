{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import Criterion.Main
import Criterion.Measurement

main :: IO ()
main = defaultMain [ bench "whnfIO scalpel scraper" $ whnfIO (scraper)]
