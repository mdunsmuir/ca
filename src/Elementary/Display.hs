{-
    Copyright (C) 2014  Michael Dunsmuir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
-}

module Elementary.Display where

import Elementary.Rule
import Elementary.Generation

import Control.Monad
import Control.Monad.State

ascii :: Int -> Int -> Int -> Rule -> IO ()
ascii w h i r = do
  let initial = replicate i False ++ [True] ++ replicate (w - i - 1) False
  runStateT (replicateM h (iteration r)) initial
  return ()
  
iteration :: Rule -> StateT Generation IO ()
iteration r = do
  current <- get
  liftIO $ putStrLn $ concat $ map (\b -> if b then "##" else "  ") current
  put $ next current r
