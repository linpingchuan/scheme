module LispVal where

import qualified Data.Text as T
import qualified Data.Map as Map

data LispVal
  = Atom T.Text
  | List [LispVal]
  | DottedList [LispVal] LispVal
  | Number Integer
  | String T.Text
  | Fun IFunc
  {-   ADD ME BACK IN
  | Internal Func
  | Lambda Func Env
  -}
  | Bool Bool deriving (Show)


--TODO decide if the return type should be Eval LispVal?
data IFunc = IFunc { fn :: [LispVal] -> LispVal } 
instance Show IFunc where
  show (IFunc f) = "internal function"

data Func = Func {
        args :: [LispVal]
      , body :: [LispVal]
      , env :: Map.Map T.Text LispVal 
      }
{-
     --, body :: [LispVal] -> Eval LispVal
--     , body :: [LispVal] -> undefined
-- use to get T.Text values, instead of typeclass show's String
showVal :: LispVal -> T.Text
showVal val =
  case val of
    (Atom atom) -> atom
    (String str) ->  "\"" ++ str ++ "\""
    (Number num) -> show num
    (Bool True) -> "#t"
    (Bool False) -> "#f"
    (List contents) ->  "(" ++ unwordsList contents ++ ")"
    (DottedList head tail) ->  "(" ++ unwordsList head ++ " . " ++ showVal tail ++ ")"
    (Fun _ ) -> "internal function"

unwordsList :: [LispVal] -> T.Text
unwordsList = T.unwords . Prelude.map showVal

instance Show LispVal where
  show = T.unpack . showVal   
-}
