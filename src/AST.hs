module AST where

type Name = String
type Amount = Integer

data Comparison
  = GreaterThan
  | LessThan
  | EqualTo
  deriving (Show, Eq)

data Statement
  = Transfer Name Name Amount
  | IfBalance Name Comparison Amount Statement
  deriving (Show, Eq)
