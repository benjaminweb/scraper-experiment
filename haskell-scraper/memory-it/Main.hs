module Main where

import Lib
import qualified Data.ByteString as B

main :: IO ()
main = do
  html <- B.readFile "../amazon.com.html"
  scraper html
