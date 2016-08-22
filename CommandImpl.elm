module CommandImpl exposing
  ( init
  )


import Html.App as App
import CreateInvoice
import SendText


type alias Model =
    { data : CommandModel
    }
        

type CommandModel
    = CreateInvoiceModel CreateInvoice.Model
    | SendTextModel SendText.Model


init : String -> String -> CommandModel      
init mod value =
  case mod of
    "CreateInvoice" ->
      CreateInvoice.init value
    "SendText" ->
      SendText.init value
    _ ->
      Debug.crash ("init not implemented for" ++ mod)
