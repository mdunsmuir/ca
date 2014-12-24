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

module Elementary.Rule (Rule, rule) where

import Data.Word8
import Data.Bits (testBit)
import qualified Data.Digits as D

type Rule = Word8
type Neighborhood = (Bool, Bool, Bool)

rule :: Rule -> Neighborhood -> Bool
rule r (left, self, right) = testBit r bitIndex
  where bitIndex = D.unDigits 2 [fromEnum left, fromEnum self, fromEnum right]
