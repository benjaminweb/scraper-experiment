{-# LANGUAGE OverloadedStrings #-}
module Lib where

import Text.HTML.Scalpel
import Text.Pretty.Simple
import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString as B
import Data.Maybe (fromMaybe)
import Criterion.Main
import Criterion.Measurement
import GHC.Stats as GHC
import System.Mem

scraper :: IO ()
scraper = do
  html <- B.readFile "../amazon.com.html"
  _ <- performMajorGC
  let res = scrapeStringLike html $ texts "h2"
  pPrint res
  gcs <- getGCStatistics
  let pma = maybe "" (show . gcStatsPeakMegabytesAllocated) gcs
  putStrLn $ "peak memory allocated in MB: " ++ pma
