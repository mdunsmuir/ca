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
import Elementary.Display

main = do
  args <- getArgs
  if length args /= 4
    then putStrLn "ascii-elem <width> <height> <initial live cell> <rule no.>"
    else ascii (read $ args !! 0) (read $ args !! 1) (read $ args !! 2) (read $ args !! 3)
