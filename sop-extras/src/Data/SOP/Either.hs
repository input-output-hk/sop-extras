{-# LANGUAGE FlexibleContexts #-}

module Data.SOP.Either
  ( EitherF (..)
  , mkEitherF
  , hdistribute
  ) where

import Data.Bifunctor (Bifunctor (..))
import Data.SOP.BasicFunctors (K (..))
import Data.SOP.Index (himap, injectNS)
import Data.SOP.Sing (SListI)
import Data.SOP.Strict (HCollapse (..), NS)

-- | A wrapper for 'Either' that is a functor in its last argument.
newtype EitherF f g x = EitherF {unEitherF :: Either (f x) (g x)}

-- | Construct an 'EitherF' from two functions and an 'Either' value.
mkEitherF :: (a -> f x) -> (b -> g x) -> Either a b -> EitherF f g x
mkEitherF f g = EitherF . bimap f g

-- | Distribute an 'NS' of 'EitherF' values into an 'Either' of 'NS' values.
hdistribute ::
  SListI xs =>
  NS (EitherF f g) xs ->
  Either (NS f xs) (NS g xs)
hdistribute ns =
  hcollapse (himap f ns)
 where
  f idx (EitherF (Left fx)) = K (Left (injectNS idx fx))
  f idx (EitherF (Right gx)) = K (Right (injectNS idx gx))
