-- ./src/Counter.elm

port module Main exposing (..)

import Html exposing (Html, button, div, text, br)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)


main =
    Html.program { init = init, view = view, update = update, subscriptions = subscriptions }



-- MODEL


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )



-- UPDATE


type Msg
    = Increment
    | Decrement
    | Multiply Int
    | Divide Float


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, watchCounter (toString msg) )

        Decrement ->
            ( model - 1, watchCounter (toString msg) )

        Multiply val ->
            ( model * val, watchCounter (toString msg) )

        Divide val ->
            (round (toFloat model / val), watchCounter (toString msg) )


port counter : (Int -> msg) -> Sub msg


port watchCounter : String -> Cmd msg


subscriptions : Model -> Sub Msg
subscriptions model =
    counter Multiply



-- VIEW


view : Model -> Html Msg
view model =
    div [ id "counter" ]
        [ button [ onClick Decrement ] [ text "-" ]
        , div [class "blue"] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        , br [] []
        , button [onClick (Divide 10)] [text "divide by 10"]
        ]
