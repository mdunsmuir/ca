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

module Elementary.Generation where

import Elementary.Rule

type Generation = [Bool]

next :: Generation -> Rule -> Generation
next [] _ = []
next g@[_] _ = g
next g r = rule r (False, g !! 0, g !! 1) : next' g r

next' :: Generation -> Rule -> Generation
next' (l:s:r:gs) rl = rule rl (l, s, r) : next' (s:r:gs) rl
next' (l:s:[]) rl = [rule rl (l, s, False)]
