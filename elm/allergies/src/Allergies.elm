module Allergies exposing (Allergy(..), isAllergicTo, toList)


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    List.member allergy (toList score)


toList : Int -> List Allergy
toList score =
    if score >= 256 then
        toList(score - 256)
    else if score >= 128 then
        toList (score - 128) ++ [Cats]
    else if score >= 64 then
        toList (score - 64) ++ [Pollen]
    else if score >= 32 then
        toList (score - 32) ++ [Chocolate]
    else if score >= 16 then
        toList (score - 16) ++ [Tomatoes]
    else if score >= 8 then
        toList (score - 8) ++ [Strawberries]
    else if score >= 4 then
        toList (score - 4) ++ [Shellfish]
    else if score >= 2 then
        toList (score - 2) ++ [Peanuts]
    else if score == 1 then
        [Eggs]
    else
        []
  
