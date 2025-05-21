{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import Criterion.Main
import Criterion.Measurement

import qualified Data.ByteString as B

main :: IO ()
main = do
  html <- B.readFile "../amazon.com.html"
  defaultMain [ bench "whnfIO scalpel scraper" $ whnfIO (scraper html)]
