module Main exposing (main)

import Browser
import Html exposing (Html, button, div, h1, text, textarea)
import Html.Attributes exposing (class, placeholder, value)
import Html.Events exposing (onClick, onInput)


type alias Model =
    { btn1 : String
    , btn2 : String
    , btn3 : String
    , btn4 : String
    , btn5 : String
    , btn6 : String
    , message : String
    , rating : Int
    }


initialModel : Model
initialModel =
    { btn1 = "♘"
    , btn2 = "♘"
    , btn3 = "♘"
    , btn4 = "♘"
    , btn5 = "♘"
    , btn6 = "♘"
    , message = ""
    , rating = 0
    }


type Msg
    = ClickBtn1
    | ClickBtn2
    | ClickBtn3
    | ClickBtn4
    | ClickBtn5
    | ClickBtn6
    | ResetBtn
    | TypingText String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ClickBtn1 ->
            { model | rating = 1, btn1 = "♞", btn2 = "♘", btn3 = "♘", btn4 = "♘", btn5 = "♘", btn6 = "♘" }

        ClickBtn2 ->
            { model | rating = 2, btn1 = "♞", btn2 = "♞", btn3 = "♘", btn4 = "♘", btn5 = "♘", btn6 = "♘" }

        ClickBtn3 ->
            { model | rating = 3, btn1 = "♞", btn2 = "♞", btn3 = "♞", btn4 = "♘", btn5 = "♘", btn6 = "♘" }

        ClickBtn4 ->
            { model | rating = 4, btn1 = "♞", btn2 = "♞", btn3 = "♞", btn4 = "♞", btn5 = "♘", btn6 = "♘" }

        ClickBtn5 ->
            { model | rating = 5, btn1 = "♞", btn2 = "♞", btn3 = "♞", btn4 = "♞", btn5 = "♞", btn6 = "♘" }

        ClickBtn6 ->
            { model | rating = 6, btn1 = "♞", btn2 = "♞", btn3 = "♞", btn4 = "♞", btn5 = "♞", btn6 = "♞" }

        ResetBtn ->
            { model | rating = 0, btn1 = "♘", btn2 = "♘", btn3 = "♘", btn4 = "♘", btn5 = "♘", btn6 = "♘", message = "" }

        TypingText newContent ->
            { model | message = newContent }


view : Model -> Html Msg
view model =
    div [ class "main-div" ]
        [ h1 [] [ text "Rate it!" ]
        , div [ class "horse-wrapper" ]
            [ button [ class "horse-btn", onClick ClickBtn1 ] [ text <| model.btn1 ]
            , button [ class "horse-btn", onClick ClickBtn2 ] [ text <| model.btn2 ]
            , button [ class "horse-btn", onClick ClickBtn3 ] [ text <| model.btn3 ]
            , button [ class "horse-btn", onClick ClickBtn4 ] [ text <| model.btn4 ]
            , button [ class "horse-btn", onClick ClickBtn5 ] [ text <| model.btn5 ]
            , button [ class "horse-btn", onClick ClickBtn6 ] [ text <| model.btn6 ]
            ]
        , textarea [ class "message-area", value model.message, onInput TypingText, placeholder "Please leave a comment..." ] []
        , div [ class "button-wrapper" ]
            [ button [ class "action-btn", onClick ResetBtn ] [ text "Reset" ]
            , button [ class "action-btn" ] [ text "Send" ]
            ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox { init = initialModel, view = view, update = update }
