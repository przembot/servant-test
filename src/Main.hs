{-# LANGUAGE DataKinds, TypeOperators, OverloadedStrings #-}
module Main where

import Control.Monad.Trans.Either
import Servant
import Network.Wai
import Network.Wai.Handler.Warp
import Data.Text

type API = "test" :> Get '[JSON] Text

test :: Server API
test = return "ąółżźć sdfasdf"

proxyAPI :: Proxy API
proxyAPI = Proxy

app :: Application
app = serve proxyAPI test

main :: IO ()
main = run 8080 app
