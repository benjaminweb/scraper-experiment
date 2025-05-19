{-# LANGUAGE OverloadedStrings #-}
module Main where

import Text.HTML.Scalpel
import Text.Pretty.Simple
import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString as B
import Data.Maybe (fromMaybe)
import Criterion.Main
import Criterion.Measurement
import GHC.Stats as GHC

scraper :: IO ()
scraper = do
  html <- B.readFile "../amazon.com.html"
  let res = scrapeStringLike html $ texts "h2"
  gcs <- getGCStatistics
  let pma = maybe "" (show . gcStatsPeakMegabytesAllocated) gcs
  pPrint res
  putStrLn $ "peak memory allocated in MB: " ++ pma

main :: IO ()
main = do
 defaultMain [ bench "whnfIO scalpel scraper" $ whnfIO (scraper)]
