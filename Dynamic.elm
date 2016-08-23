module Dynamic exposing (..)


import Html exposing (Html, div, text)
import Html.App as App
import CommandImpl


type Msg = CommandImplMsg CommandImpl.Msg


type alias Model =
    { mod  : String
    , data : CommandImpl.Model
    }


main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = (\_ -> Sub.none)
    }


init : (Model, Cmd Msg)
init =
  (Model "ApplicationCreated" (CommandImpl.init "SendText"), Cmd.none)


view : Model -> Html Msg
view model =
  div [] [ App.map CommandImplMsg (CommandImpl.view model.data) ]


update : Msg -> Model -> (Model, Cmd Msg)
update message model =
  case message of
    CommandImplMsg msg ->
      ({ model | data = CommandImpl.update msg model.data }, Cmd.none)
