module Main exposing (..)

import Browser
import Html exposing (text)


fibonacci : Int -> Int
fibonacci n =
    let
        fibHelper a b count =
            if count == 0 then
                a
            else
                fibHelper b (a + b) (count - 1)
    in
    fibHelper 0 1 n


main =
    let
        n = 10 -- Number
        result = fibonacci n
    in
    text (String.fromInt result)
