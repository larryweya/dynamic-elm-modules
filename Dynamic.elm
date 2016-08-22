module Dynamic exposing (..)


import Html exposing (Html, div, text)
import Html.App as App
--import CommandImpl


type Msg = NoOp


type alias Model a =
    { mod  : String
    , impl : Impl a
    }


type Impl a = Impl    


main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = (\_ -> Sub.none)
    }


init : (Model a, Cmd Msg)
init =
  (Model "ApplicationCreated" Impl, Cmd.none)


view : Model a -> Html Msg
view model =
  div [] [ ]


update : Msg -> Model a -> (Model a, Cmd Msg)
update msg model =
  (model, Cmd.none)
