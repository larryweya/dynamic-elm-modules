module SendText exposing
  ( Msg
  , Model
  , init
  , view
  , update
  )


import Html exposing (Html, div, text)


type Msg = NoOp


type alias Model =
  { s : String
  }


init : String -> Model
init val =
  Model val


view : Model -> Html Msg
view model =
  div [] [ text model.s ]


update : Msg -> Model -> Model
update msg model =
  model
