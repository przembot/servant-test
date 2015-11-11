{-# LANGUAGE DataKinds, TypeOperators, OverloadedStrings #-}
module Main where

import Control.Monad.Trans.Either
import Servant
import Network.Wai
import Network.Wai.Handler.Warp
import Data.Text

type API = "test" :> Get '[JSON] (Headers '[Header "Content-Type" Text] Text)

test :: Server API
test = return $ addHeader "application/json; charset=utf8" "ąółżźć sdfasdf"

proxyAPI :: Proxy API
proxyAPI = Proxy

app :: Application
app = serve proxyAPI test

main :: IO ()
main = run 8080 app
