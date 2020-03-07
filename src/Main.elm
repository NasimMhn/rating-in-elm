module Main exposing (main)

import Browser
-- import Html exposing (Html, button, div, h1, text)
-- import Html.Attributes exposing (class, id)
-- import Html.Events exposing (onClick)
import Html exposing (Html, h1, div, text, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

type alias Model =
    { horse : String }

initialModel : Model
initialModel =
    { horse = "♘" }

type Msg
    = Rating


update : Msg -> Model -> Model
update msg model =
    case msg of
      Rating -> 
        { model | horse = "♞"}

view : Model -> Html Msg
view model =
    div [ class "main-div" ]
      [ 
        h1 [] [ text "♞ Rate it! ♘"]
      , h1 [ class "header" ] [ text "NEW RATING" ]
      , button [ class "horse", onClick Rating] [ text <| model.horse ]
      , button [ class "horse", onClick Rating] [ text <| model.horse ]
      ]
      


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
