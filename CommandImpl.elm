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
  case message of
    CreateInvoiceMsg msg ->
      { model | impl = CreateInvoiceImpl (updateCreateInvoice msg model.impl) }
    SendTextMsg msg ->
      { model | impl = SendTextImpl (updateSendText msg model.impl) }


updateCreateInvoice msg data =
  case data of
    CreateInvoiceImpl data ->
      CreateInvoice.update msg data
    _ ->
      Debug.crash "invalid impl for create invoice update"


updateSendText msg data =
  case data of
    SendTextImpl data ->
      SendText.update msg data
    _ ->
      Debug.crash "invalid impl for send text update"          
