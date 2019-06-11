{-# LANGUAGE OverloadedStrings #-}

module Backend.Scraper where

import Data.Text (Text)

import Text.HTML.Scalpel


newtype Item = Item
  { _item_title :: Text
  }
  deriving (Show, Eq)

-- TODO
-- Cache HN fetcher, and run this thing on the cached html.
frontPage :: Scraper Text [Item]
frontPage = chroots ("tr" @: [hasClass "athing"]) item

item :: Scraper Text Item
item = do
  title <- text $ "td" @: [hasClass "title"]
  pure $ Item title
