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

import System.Environment
import Elementary.Rule
import Elementary.Display

main = do
  args <- getArgs
  if length args < 3
    then putStrLn "ascii-elem <rule no.> <width> <height> [initial live cell]"
    else do
      let rule = read $ args !! 0 :: Rule
          width = read $ args !! 1 :: Int
          height = read $ args !! 2 :: Int
      if length args == 4
        then ascii width height (read $ args !! 3) rule
        else asciiForRandomInitialState width height rule
