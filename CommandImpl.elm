module CommandImpl exposing
  ( Msg
  , Model
  , init
  , view
  , update
  )


import Html exposing (Html, div, text)
import Html.App as App
import CreateInvoice
import SendText


type Msg
    = CreateInvoiceMsg CreateInvoice.Msg
    | SendTextMsg SendText.Msg


type alias Model =
    { impl : Impl
    }


type Impl
    = CreateInvoiceImpl CreateInvoice.Model
    | SendTextImpl SendText.Model


init : String -> Model  
init mod =
  case mod of
    "CreateInvoice" ->
      Model <| CreateInvoiceImpl (CreateInvoice.init "2")
    "SendText" ->
      Model <| SendTextImpl (SendText.Model "hi")
    _ ->
      Debug.crash ("no init impl. for " ++ mod)


view : Model -> Html Msg        
view model =
  case model.impl of
    CreateInvoiceImpl data ->
      App.map CreateInvoiceMsg (CreateInvoice.view data)
    SendTextImpl data ->
      App.map SendTextMsg (SendText.view data)


update : Msg -> Model -> Model          
update message model =
  case (message, model.impl) of
    (CreateInvoiceMsg msg, CreateInvoiceImpl data) ->
      { model | impl = CreateInvoiceImpl (CreateInvoice.update msg data) }
    (SendTextMsg msg, SendTextImpl data) ->
      { model | impl = SendTextImpl (SendText.update msg data) }
    _ ->
      model
