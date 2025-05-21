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
import qualified Data.Text.Encoding as T

scraper :: B.ByteString -> IO ()
scraper html = do
  _ <- performMajorGC
  let res = scrapeStringLike (T.decodeUtf8 html) $ texts "h2"
  pPrint res
  gcs <- getGCStatistics
  let pma = maybe "" (show . gcStatsPeakMegabytesAllocated) gcs
  putStrLn $ "peak memory allocated in MB: " ++ pma
