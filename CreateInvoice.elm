module CreateInvoice exposing
  ( Msg
  , Model
  , init
  , view
  , update
  )


import Html exposing (Html, div, text)


type Msg = NoOp


type alias Model =
  { i : Int
  }


init : String -> Model
init val =
  Model 5


view : Model -> Html Msg
view model =
  div [] [ text (toString model.i) ]


update : Msg -> Model -> Model
update msg model =
  model
