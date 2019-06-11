{-# LANGUAGE EmptyCase #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeFamilies #-}
module Backend where

import Common.Route
import Obelisk.Backend

import Backend.Scraper (Item)

-- DB design
-- FrontpageHTML [id, fetchTime, pageHtml, scrapped:Bool]
-- ItemSnapshot [id, snapshotTime, title, flagged, ...]

backend :: Backend BackendRoute FrontendRoute
backend = Backend
  { _backend_run = \serve -> serve $ const $ return ()
  , _backend_routeEncoder = backendRouteEncoder
  }
