{-# OPTIONS_GHC -w #-}
{-# OPTIONS -fglasgow-exts -cpp #-}
module CSPM.Parser.Parser (
    parseFile_, parseInteractiveStmt_, parseExpression_
) 
where

-- To generate the corresponding .hs file run the following commands
-- cpp -P src/CSPM/Parser/Parser.ppy > src/CSPM/Parser/Parser.y
-- happy --ghc --coerce --array src/CSPM/Parser/Parser.y
-- rm src/CSPM/Parser/Parser.y

-- i.e.: cpp -P src/CSPM/Parser/Parser.ppy > src/CSPM/Parser/Parser.y && happy --ghc --coerce --array src/CSPM/Parser/Parser.y && rm src/CSPM/Parser/Parser.y

import Data.Char

import CSPM.DataStructures.Literals
import CSPM.DataStructures.Names
import CSPM.DataStructures.Syntax
import CSPM.DataStructures.Tokens
import CSPM.DataStructures.Types hiding (TDot)
import CSPM.Parser.Exceptions
import CSPM.Parser.Lexer
import CSPM.Parser.Monad
import Util.Annotated
import qualified Data.Array as Happy_Data_Array
import qualified GHC.Exts as Happy_GHC_Exts

-- parser produced by Happy Version 1.18.9

newtype HappyAbsSyn t8 t9 t27 t28 = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn6 :: ([PDecl]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PDecl])
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: (PInteractiveStmt) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn t8 t9 t27 t28) -> (PInteractiveStmt)
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: t8 -> (HappyAbsSyn t8 t9 t27 t28)
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn t8 t9 t27 t28) -> t8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: t9 -> (HappyAbsSyn t8 t9 t27 t28)
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn t8 t9 t27 t28) -> t9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyIn10 :: ([PDecl]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PDecl])
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
happyIn11 :: ([PDecl]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PDecl])
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyIn12 :: ([PDecl]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PDecl])
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
happyIn13 :: (Maybe PDecl) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn t8 t9 t27 t28) -> (Maybe PDecl)
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
happyIn14 :: (PDecl) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn t8 t9 t27 t28) -> (PDecl)
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
happyIn15 :: (PDecl) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn t8 t9 t27 t28) -> (PDecl)
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
happyIn16 :: (Assertion UnRenamedName) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn t8 t9 t27 t28) -> (Assertion UnRenamedName)
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
happyIn17 :: (SemanticProperty) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn t8 t9 t27 t28) -> (SemanticProperty)
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
happyIn18 :: (ModelOption UnRenamedName) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn t8 t9 t27 t28) -> (ModelOption UnRenamedName)
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
happyIn19 :: (PDataTypeClause) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn t8 t9 t27 t28) -> (PDataTypeClause)
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
happyIn20 :: ([PDataTypeClause]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PDataTypeClause])
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
happyIn21 :: ([PDataTypeClause]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PDataTypeClause])
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
happyIn22 :: (Located UnRenamedName) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn t8 t9 t27 t28) -> (Located UnRenamedName)
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
happyIn23 :: ([Located UnRenamedName]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn t8 t9 t27 t28) -> ([Located UnRenamedName])
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
happyIn24 :: ([Located UnRenamedName]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn t8 t9 t27 t28) -> ([Located UnRenamedName])
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
happyIn25 :: (Located Literal) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn t8 t9 t27 t28) -> (Located Literal)
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
happyIn26 :: (PPat) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn t8 t9 t27 t28) -> (PPat)
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
happyIn27 :: t27 -> (HappyAbsSyn t8 t9 t27 t28)
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn t8 t9 t27 t28) -> t27
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
happyIn28 :: t28 -> (HappyAbsSyn t8 t9 t27 t28)
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn t8 t9 t27 t28) -> t28
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
happyIn29 :: (PExp) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn29 #-}
happyOut29 :: (HappyAbsSyn t8 t9 t27 t28) -> (PExp)
happyOut29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut29 #-}
happyIn30 :: (PExp) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn30 #-}
happyOut30 :: (HappyAbsSyn t8 t9 t27 t28) -> (PExp)
happyOut30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut30 #-}
happyIn31 :: (PExp) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn31 #-}
happyOut31 :: (HappyAbsSyn t8 t9 t27 t28) -> (PExp)
happyOut31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut31 #-}
happyIn32 :: (PField) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn32 #-}
happyOut32 :: (HappyAbsSyn t8 t9 t27 t28) -> (PField)
happyOut32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut32 #-}
happyIn33 :: ((PExp, PExp)) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn33 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn33 #-}
happyOut33 :: (HappyAbsSyn t8 t9 t27 t28) -> ((PExp, PExp))
happyOut33 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut33 #-}
happyIn34 :: ([(PExp, PExp)]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn34 #-}
happyOut34 :: (HappyAbsSyn t8 t9 t27 t28) -> ([(PExp, PExp)])
happyOut34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut34 #-}
happyIn35 :: ([(PExp, PExp)]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn35 #-}
happyOut35 :: (HappyAbsSyn t8 t9 t27 t28) -> ([(PExp, PExp)])
happyOut35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut35 #-}
happyIn36 :: ((PExp, PExp)) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn36 #-}
happyOut36 :: (HappyAbsSyn t8 t9 t27 t28) -> ((PExp, PExp))
happyOut36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut36 #-}
happyIn37 :: ([(PExp, PExp)]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn37 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn37 #-}
happyOut37 :: (HappyAbsSyn t8 t9 t27 t28) -> ([(PExp, PExp)])
happyOut37 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut37 #-}
happyIn38 :: ([(PExp, PExp)]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn38 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn38 #-}
happyOut38 :: (HappyAbsSyn t8 t9 t27 t28) -> ([(PExp, PExp)])
happyOut38 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut38 #-}
happyIn39 :: ([PField]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn39 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn39 #-}
happyOut39 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PField])
happyOut39 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut39 #-}
happyIn40 :: ([PField]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn40 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn40 #-}
happyOut40 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PField])
happyOut40 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut40 #-}
happyIn41 :: ([PExp]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn41 #-}
happyOut41 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PExp])
happyOut41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut41 #-}
happyIn42 :: ([PExp]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn42 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn42 #-}
happyOut42 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PExp])
happyOut42 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut42 #-}
happyIn43 :: ([PExp]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn43 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn43 #-}
happyOut43 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PExp])
happyOut43 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut43 #-}
happyIn44 :: ([PExp]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn44 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn44 #-}
happyOut44 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PExp])
happyOut44 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut44 #-}
happyIn45 :: ([PStmt]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn45 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn45 #-}
happyOut45 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PStmt])
happyOut45 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut45 #-}
happyIn46 :: (PStmt) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn46 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn46 #-}
happyOut46 :: (HappyAbsSyn t8 t9 t27 t28) -> (PStmt)
happyOut46 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut46 #-}
happyIn47 :: ([PStmt]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn47 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn47 #-}
happyOut47 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PStmt])
happyOut47 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut47 #-}
happyIn48 :: ([PStmt]) -> (HappyAbsSyn t8 t9 t27 t28)
happyIn48 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn48 #-}
happyOut48 :: (HappyAbsSyn t8 t9 t27 t28) -> ([PStmt])
happyOut48 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut48 #-}
happyInTok :: (LToken) -> (HappyAbsSyn t8 t9 t27 t28)
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn t8 t9 t27 t28) -> (LToken)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x00\x00\x0a\x02\x54\x02\x00\x00\x4e\x00\x00\x00\x00\x00\x54\x02\x4c\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x54\x02\x98\x00\x54\x02\x54\x02\x00\x00\x00\x00\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\xac\x00\x00\x00\xf8\x06\x98\x00\xc0\x01\xac\x00\x00\x00\x2d\x01\x54\x02\xd3\x00\xf0\x00\x00\x00\x00\x00\xe4\x02\xe7\x00\xe7\x00\xe7\x00\xe7\x00\xe7\x00\x76\x01\x00\x00\x94\x00\xc4\x00\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x18\x00\xc8\x03\x00\x00\xd9\x00\xdb\x00\xd6\x00\xd5\x00\xc8\x00\xcc\x00\x00\x00\xc9\x00\xd1\x00\x5c\x06\xf8\x06\xf7\xff\xd0\x00\x28\x06\xf1\xff\x18\x03\x89\x00\x3a\x00\xce\x00\x9c\x09\xbc\x00\xf8\x06\x9a\x02\xe0\x05\x98\x05\xf8\xff\x00\x00\x00\x00\x00\x00\x00\x00\x54\x02\x00\x00\x2c\x01\x54\x02\x54\x02\x54\x02\x00\x00\x54\x02\x00\x00\x54\x02\x00\x00\xe2\x00\x54\x02\x54\x02\x00\x00\x54\x02\x54\x02\x8b\x00\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x54\x02\x7f\x00\x54\x02\x54\x02\x2c\x09\x2c\x09\xf9\x08\xc6\x08\x2c\x09\xf9\x07\x60\x08\x93\x08\x50\x05\xb1\x00\x80\x03\xb0\x00\x00\x00\xab\x00\xaa\x00\x81\x00\xd0\xff\x3a\x00\x3a\x00\x3a\x00\xce\x00\xce\x00\x8b\x09\x8b\x09\x8b\x09\x8b\x09\x8b\x09\x8b\x09\x69\x09\x7a\x09\x2b\x07\xc4\x06\x2d\x08\xc6\x07\x92\x07\x53\x09\x00\x00\x54\x02\x00\x00\x54\x02\xa7\x00\x00\x00\x00\x00\xa8\x00\x00\x00\xa6\x00\x9a\x00\x54\x02\x01\x00\x00\x00\x54\x02\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x54\x02\x7e\x00\x00\x00\x90\x06\x00\x00\x00\x00\x00\x00\x4f\x00\x54\x02\x9c\x00\x9c\x00\x54\x02\x00\x00\x2c\x09\x54\x02\x54\x02\x00\x00\x54\x02\x56\x00\x54\x02\x54\x02\x54\x02\x5c\x00\x54\x02\x90\x06\x90\x06\x54\x02\x00\x00\x90\x06\x90\x06\x90\x06\x00\x00\x00\x00\x54\x02\x00\x00\x7a\x00\x59\x00\x90\x06\x08\x05\x00\x00\x54\x00\x82\x00\x90\x06\x00\x00\xd4\x04\x00\x00\x8c\x04\x47\x00\x00\x00\x00\x00\x54\x02\x00\x00\x00\x00\x00\x00\x54\x02\x58\x00\x44\x04\xfc\x03\x54\x02\x5e\x07\x5e\x07\x00\x00\x00\x00\x00\x00\x2d\x08\x2d\x08\x00\x00\x00\x00\x00\x00\x00\x00\x57\x00\x5d\x00\x00\x00\x00\x00\x54\x02\x00\x00\x54\x02\x61\x00\x5e\x07\x54\x02\x54\x02\x54\x02\x90\x06\x90\x06\x90\x06\x5e\x07\x5e\x07\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x3e\x00\x14\x00\x5b\x0a\x5f\x00\x1f\x02\x00\x00\x00\x00\xc4\x01\x33\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x54\x0a\xeb\x02\x8e\x04\x4d\x0a\x00\x00\x00\x00\x46\x0a\x3f\x0a\x1f\x00\x7a\x01\x30\x01\x38\x0a\x41\x04\x8f\x08\x4a\x02\x02\x02\xb6\x01\x00\x00\x00\x00\x33\x00\xa1\x02\xe8\x01\x00\x00\x00\x00\x52\x00\x9e\x01\x00\x00\x5a\x00\x00\x00\x00\x00\x33\x00\xb9\x00\x48\x00\x7d\x00\x6f\x00\x36\x00\x4a\x01\x00\x00\x00\x00\x3d\x00\x31\x0a\x2a\x0a\x23\x0a\x1c\x0a\x15\x0a\x0e\x0a\x07\x0a\x00\x0a\xf9\x09\xf2\x09\xeb\x09\xe4\x09\xdd\x09\xd6\x09\xcf\x09\xc5\x09\x5f\x09\x55\x09\x36\x09\x28\x09\xe6\x00\x55\x03\x03\x09\xca\x03\xf5\x08\xd0\x08\xc2\x08\x9d\x08\x6a\x08\x36\x08\x03\x08\xcf\x07\x00\x00\x33\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x23\x00\x00\x00\x33\x00\x33\x00\x00\x00\x00\x00\x33\x00\x00\x00\x33\x00\x00\x00\x33\x00\x33\x00\x33\x00\x00\x00\x33\x00\x33\x00\x33\x00\x33\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x6c\x01\x00\x00\x52\x04\x9b\x07\x05\x04\x68\x07\x00\x00\xad\x00\x00\x00\x22\x01\x00\x00\x35\x07\x01\x07\xd8\x00\x00\x00\x90\x00\x21\x03\x00\x00\x46\x00\x8d\x03\xcd\x06\x99\x06\x65\x06\x63\x00\x00\x00\x33\x06\x2c\x06\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x0c\x00\x33\x00\x00\x00\x00\x00\xf3\xff\x00\x00\x00\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x00\x00\x25\x06\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf2\x02\x67\x02\x00\x00\xee\x05\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa8\x02\x0a\x00\x00\x00\x33\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7c\x02\x76\x00\xff\xff\x72\x02\x00\x00\x33\x00\xe7\x05\xdd\x05\x00\x00\x54\x01\x00\x00\x32\x02\xa3\x05\x9c\x05\x00\x00\x95\x05\x33\x00\x33\x00\x5b\x05\x00\x00\x33\x00\x33\x00\x33\x00\x00\x00\x00\x00\xf9\xff\x00\x00\x00\x00\x00\x00\x33\x00\x33\x00\x00\x00\x00\x00\x00\x00\x33\x00\x00\x00\x33\x00\x00\x00\x2a\x00\xf5\xff\x00\x00\x00\x00\x54\x05\x00\x00\x00\x00\x00\x00\x4d\x05\x00\x00\x33\x00\x33\x00\x11\x05\x33\x00\x33\x00\x00\x00\x00\x00\x00\x00\x33\x00\x33\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xde\x01\x00\x00\x94\x01\x2c\x00\x33\x00\xdf\x04\xd8\x04\x95\x04\x33\x00\x33\x00\x33\x00\x33\x00\x33\x00\x00\x00\x00\x00\x00\x00"#

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xf5\xff\x00\x00\x00\x00\x00\x00\xf3\xff\xc7\xff\xc8\xff\x7a\xff\x00\x00\xc9\xff\xd0\xff\xd4\xff\xce\xff\xcf\xff\xa3\xff\x00\x00\x00\x00\x00\x00\x00\x00\xb0\xff\xcc\xff\x00\x00\x00\x00\x00\x00\x7a\xff\x7a\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf8\xff\xca\xff\x00\x00\x00\x00\x00\x00\xf9\xff\x00\x00\x00\x00\x00\x00\xf1\xff\xf0\xff\xec\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7e\xff\x00\x00\x7f\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x7a\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x72\xff\x6f\xff\x00\x00\x71\xff\x00\x00\x00\x00\x00\x00\x00\x00\x81\xff\x76\xff\x82\xff\x00\x00\x77\xff\x00\x00\x79\xff\x77\xff\x00\x00\x00\x00\x00\x00\xaa\xff\xb6\xff\xb9\xff\x00\x00\xcd\xff\x00\x00\x00\x00\x77\xff\x00\x00\xfc\xff\xf2\xff\xf4\xff\xaf\xff\x00\x00\xcb\xff\x00\x00\x00\x00\x00\x00\x00\x00\xc6\xff\x00\x00\xc2\xff\x00\x00\xa9\xff\x00\x00\x00\x00\x00\x00\xa5\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x95\xff\x96\xff\x97\xff\x99\xff\xa0\xff\x9c\xff\x9d\xff\x9f\xff\xca\xff\x76\xff\x00\x00\x00\x00\x85\xff\x76\xff\x86\xff\x00\x00\xab\xff\xb3\xff\xb2\xff\xb1\xff\xb4\xff\xb5\xff\xbc\xff\xbd\xff\xba\xff\xbb\xff\xbe\xff\xbf\xff\xb8\xff\xb7\xff\x9e\xff\xa2\xff\x88\xff\x8a\xff\x8c\xff\xc5\xff\x7d\xff\x00\x00\xe4\xff\x00\x00\x00\x00\xd2\xff\xe6\xff\xd3\xff\xe7\xff\x00\x00\xea\xff\x00\x00\xee\xff\xf7\xff\x00\x00\xfa\xff\xe0\xff\xde\xff\xdd\xff\xdc\xff\xdb\xff\x00\x00\xe2\xff\xdf\xff\xc4\xff\xef\xff\xed\xff\xf6\xff\xeb\xff\x00\x00\x00\x00\x00\x00\x00\x00\xe5\xff\xa1\xff\x00\x00\x00\x00\xc1\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x74\xff\x73\xff\x00\x00\x70\xff\x92\xff\x90\xff\x91\xff\x83\xff\x75\xff\x00\x00\x80\xff\x00\x00\x00\x00\x78\xff\x00\x00\xa7\xff\x00\x00\x7c\xff\xc0\xff\xeb\xff\x00\x00\xad\xff\x00\x00\x00\x00\xae\xff\xac\xff\x00\x00\xa8\xff\xa6\xff\xa4\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x98\xff\x9b\xff\x87\xff\x94\xff\x84\xff\x89\xff\x8b\xff\xe3\xff\xd1\xff\xd6\xff\xe8\xff\xd7\xff\xd8\xff\xe9\xff\xe1\xff\x00\x00\xda\xff\x00\x00\x00\x00\x93\xff\x00\x00\x00\x00\x00\x00\x8e\xff\xc3\xff\x8d\xff\x8f\xff\x9a\xff\xd5\xff\xd9\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x10\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x10\x00\x10\x00\x10\x00\x3a\x00\x16\x00\x13\x00\x14\x00\x15\x00\x10\x00\x40\x00\x18\x00\x19\x00\x12\x00\x13\x00\x01\x00\x0c\x00\x16\x00\x16\x00\x18\x00\x27\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x28\x00\x29\x00\x2a\x00\x10\x00\x0d\x00\x0e\x00\x13\x00\x27\x00\x15\x00\x32\x00\x17\x00\x18\x00\x19\x00\x3d\x00\x10\x00\x2f\x00\x30\x00\x13\x00\x27\x00\x15\x00\x34\x00\x3f\x00\x18\x00\x19\x00\x0d\x00\x39\x00\x3a\x00\x10\x00\x3c\x00\x00\x00\x3e\x00\x16\x00\x03\x00\x23\x00\x42\x00\x1a\x00\x44\x00\x10\x00\x46\x00\x47\x00\x48\x00\x27\x00\x21\x00\x22\x00\x1a\x00\x4d\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x21\x00\x22\x00\x10\x00\x1a\x00\x10\x00\x13\x00\x14\x00\x15\x00\x02\x00\x0b\x00\x18\x00\x19\x00\x12\x00\x13\x00\x03\x00\x02\x00\x16\x00\x08\x00\x18\x00\x10\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x28\x00\x29\x00\x2a\x00\x19\x00\x38\x00\x10\x00\x3a\x00\x27\x00\x13\x00\x14\x00\x15\x00\x32\x00\x40\x00\x18\x00\x19\x00\x2f\x00\x30\x00\x10\x00\x11\x00\x12\x00\x34\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x39\x00\x3a\x00\x07\x00\x3c\x00\x28\x00\x3e\x00\x10\x00\x11\x00\x12\x00\x42\x00\x3d\x00\x44\x00\x19\x00\x46\x00\x47\x00\x48\x00\x41\x00\x3f\x00\x01\x00\x02\x00\x4d\x00\x04\x00\x05\x00\x02\x00\x50\x00\x10\x00\x45\x00\x24\x00\x13\x00\x14\x00\x15\x00\x26\x00\x0d\x00\x18\x00\x19\x00\x12\x00\x13\x00\x06\x00\x06\x00\x16\x00\x07\x00\x18\x00\x07\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x28\x00\x29\x00\x2a\x00\x10\x00\x3b\x00\x10\x00\x0e\x00\x27\x00\x13\x00\x10\x00\x15\x00\x44\x00\x3b\x00\x18\x00\x19\x00\x2f\x00\x30\x00\x10\x00\x11\x00\x12\x00\x34\x00\x09\x00\x0a\x00\x0b\x00\x45\x00\x39\x00\x3a\x00\x26\x00\x3c\x00\x19\x00\x3e\x00\x07\x00\x07\x00\x10\x00\x42\x00\x0f\x00\x44\x00\x49\x00\x46\x00\x47\x00\x48\x00\x19\x00\x07\x00\x01\x00\x02\x00\x4d\x00\x04\x00\x05\x00\x10\x00\x02\x00\x17\x00\x13\x00\x14\x00\x15\x00\x19\x00\x19\x00\x18\x00\x19\x00\x19\x00\x03\x00\x12\x00\x13\x00\x10\x00\xff\xff\x16\x00\x13\x00\x18\x00\x15\x00\x50\x00\xff\xff\x18\x00\x19\x00\x28\x00\x29\x00\x2a\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\x27\x00\x0a\x00\x25\x00\x26\x00\xff\xff\x40\x00\xff\xff\x10\x00\x2f\x00\x30\x00\x13\x00\xff\xff\x15\x00\x34\x00\x17\x00\x18\x00\x19\x00\xff\xff\x39\x00\x3a\x00\xff\xff\x3c\x00\x3d\x00\x3e\x00\xff\xff\xff\xff\xff\xff\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\xff\xff\xff\xff\x01\x00\x02\x00\x4d\x00\x04\x00\x05\x00\x10\x00\xff\xff\xff\xff\x13\x00\x14\x00\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\x12\x00\x13\x00\x10\x00\xff\xff\x16\x00\x13\x00\x18\x00\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\x28\x00\x29\x00\x2a\x00\x20\x00\x21\x00\x22\x00\x23\x00\xff\xff\x25\x00\x27\x00\x0a\x00\x25\x00\x26\x00\xff\xff\xff\xff\xff\xff\x10\x00\x2f\x00\x30\x00\x13\x00\x32\x00\x15\x00\x34\x00\x17\x00\x18\x00\x19\x00\x10\x00\x39\x00\x3a\x00\x13\x00\x3c\x00\x15\x00\x3e\x00\x17\x00\x18\x00\x19\x00\x42\x00\x1b\x00\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\xff\xff\xff\xff\x01\x00\x02\x00\x4d\x00\x04\x00\x05\x00\x10\x00\xff\xff\xff\xff\x13\x00\x14\x00\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\x12\x00\x13\x00\x10\x00\xff\xff\x16\x00\x13\x00\x18\x00\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\x28\x00\x29\x00\x2a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x27\x00\x28\x00\x25\x00\x26\x00\xff\xff\xff\xff\xff\xff\x10\x00\x2f\x00\x30\x00\x13\x00\x0a\x00\x15\x00\x34\x00\x17\x00\x18\x00\x19\x00\x10\x00\x39\x00\x3a\x00\x13\x00\x3c\x00\x15\x00\x3e\x00\x17\x00\x18\x00\x19\x00\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\xff\xff\xff\xff\x01\x00\x02\x00\x4d\x00\x04\x00\x05\x00\x10\x00\xff\xff\xff\xff\x13\x00\x14\x00\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\x12\x00\x13\x00\x10\x00\xff\xff\x16\x00\x13\x00\x18\x00\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\x28\x00\x29\x00\x2a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x27\x00\x28\x00\x25\x00\x26\x00\xff\xff\xff\xff\xff\xff\x10\x00\x2f\x00\x30\x00\x13\x00\x0a\x00\x15\x00\x34\x00\x17\x00\x18\x00\x19\x00\x10\x00\x39\x00\x3a\x00\x13\x00\x3c\x00\x15\x00\x3e\x00\x17\x00\x18\x00\x19\x00\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\xff\xff\xff\xff\x01\x00\x02\x00\x4d\x00\x04\x00\x05\x00\xff\xff\xff\xff\x10\x00\xff\xff\xff\xff\x13\x00\x14\x00\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\x12\x00\x13\x00\xff\xff\xff\xff\x16\x00\xff\xff\x18\x00\x04\x00\x05\x00\x06\x00\xff\xff\x08\x00\x09\x00\x1f\x00\x28\x00\x29\x00\x2a\x00\xff\xff\xff\xff\x10\x00\xff\xff\x27\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\x2f\x00\x30\x00\xff\xff\xff\xff\xff\xff\x34\x00\xff\xff\xff\xff\xff\xff\x10\x00\x39\x00\x3a\x00\x13\x00\x3c\x00\x15\x00\x3e\x00\x17\x00\x18\x00\x19\x00\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\xff\xff\xff\xff\x01\x00\x02\x00\x4d\x00\x04\x00\x05\x00\x10\x00\xff\xff\xff\xff\x13\x00\x14\x00\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\x12\x00\x13\x00\xff\xff\xff\xff\x16\x00\xff\xff\x18\x00\xff\xff\x07\x00\x08\x00\x09\x00\xff\xff\x28\x00\x29\x00\x2a\x00\xff\xff\xff\xff\x10\x00\xff\xff\xff\xff\x13\x00\x27\x00\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\x10\x00\x2f\x00\x30\x00\x13\x00\xff\xff\x15\x00\x34\x00\x17\x00\x18\x00\x19\x00\x10\x00\x39\x00\x3a\x00\x13\x00\x3c\x00\x15\x00\x3e\x00\x17\x00\x18\x00\x19\x00\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\xff\xff\xff\xff\xff\xff\x06\x00\x4d\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x05\x00\x06\x00\xff\xff\x08\x00\x09\x00\x11\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x10\x00\x18\x00\xff\xff\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\xff\xff\x4e\x00\x4f\x00\x06\x00\xff\xff\x08\x00\x09\x00\x0a\x00\x0b\x00\x05\x00\x06\x00\xff\xff\x08\x00\x09\x00\x11\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x10\x00\x18\x00\xff\xff\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\x11\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x18\x00\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\x1e\x00\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\x3b\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\x11\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x18\x00\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\x1b\x00\x1c\x00\x1d\x00\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x08\x00\x09\x00\x0a\x00\x0b\x00\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\x11\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x18\x00\xff\xff\x4e\x00\x4f\x00\x50\x00\x10\x00\xff\xff\xff\xff\x13\x00\xff\xff\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x40\x00\xff\xff\x42\x00\x43\x00\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x4c\x00\xff\xff\x4e\x00\x4f\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\x0d\x00\x0e\x00\xff\xff\xff\xff\x11\x00\x10\x00\xff\xff\xff\xff\x13\x00\xff\xff\x15\x00\x18\x00\x17\x00\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\x1e\x00\x1f\x00\x20\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x08\x00\x09\x00\x0a\x00\x0b\x00\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\x11\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x18\x00\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\xff\xff\x4e\x00\x4f\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\x10\x00\xff\xff\xff\xff\x13\x00\x11\x00\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\x18\x00\xff\xff\xff\xff\x1e\x00\x1f\x00\x20\x00\x10\x00\xff\xff\xff\xff\x13\x00\xff\xff\x15\x00\x16\x00\xff\xff\x18\x00\x19\x00\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\x45\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\xff\xff\x4e\x00\x4f\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x11\x00\x10\x00\xff\xff\xff\xff\x13\x00\x14\x00\x15\x00\x18\x00\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\xff\xff\x4e\x00\x4f\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x11\x00\xff\xff\xff\xff\x10\x00\x15\x00\xff\xff\x13\x00\x18\x00\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x08\x00\x09\x00\x0a\x00\x0b\x00\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\x11\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x18\x00\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\xff\xff\x3d\x00\xff\xff\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\xff\xff\x4e\x00\x4f\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\x10\x00\xff\xff\xff\xff\x13\x00\x11\x00\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\x18\x00\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\x4d\x00\x4e\x00\x4f\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x10\x00\xff\xff\xff\xff\x13\x00\x11\x00\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\x18\x00\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\xff\xff\x4e\x00\x4f\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\x10\x00\xff\xff\xff\xff\x13\x00\x11\x00\x15\x00\xff\xff\x14\x00\x18\x00\x19\x00\x10\x00\x18\x00\xff\xff\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\xff\xff\x4e\x00\x4f\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x10\x00\xff\xff\xff\xff\x13\x00\x11\x00\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\x18\x00\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x08\x00\x09\x00\x0a\x00\x0b\x00\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\x11\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x18\x00\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x08\x00\x09\x00\x0a\x00\x0b\x00\x40\x00\xff\xff\x42\x00\x43\x00\x44\x00\x11\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x18\x00\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x08\x00\x09\x00\x0a\x00\x0b\x00\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\x11\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x18\x00\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x08\x00\x09\x00\x0a\x00\x0b\x00\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\x11\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x18\x00\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x08\x00\xff\xff\xff\xff\xff\xff\x40\x00\x0d\x00\x42\x00\xff\xff\x44\x00\x11\x00\x46\x00\x47\x00\xff\xff\x49\x00\x4a\x00\x4b\x00\x18\x00\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x08\x00\xff\xff\xff\xff\xff\xff\x40\x00\x0d\x00\x42\x00\xff\xff\x44\x00\x11\x00\x46\x00\x47\x00\x48\x00\xff\xff\x4a\x00\x4b\x00\x18\x00\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\xff\xff\x4a\x00\x4b\x00\xff\xff\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x08\x00\xff\xff\xff\xff\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\x11\x00\x46\x00\x47\x00\xff\xff\x49\x00\x4a\x00\x4b\x00\x18\x00\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\x40\x00\xff\xff\x42\x00\xff\xff\x44\x00\xff\xff\x46\x00\x47\x00\x48\x00\xff\xff\x4a\x00\x4b\x00\xff\xff\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x40\x00\xff\xff\x13\x00\x14\x00\x15\x00\xff\xff\x46\x00\x18\x00\x19\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\x28\x00\x29\x00\x2a\x00\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x40\x00\xff\xff\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\x49\x00\x4a\x00\x4b\x00\xff\xff\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x40\x00\xff\xff\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\x49\x00\xff\xff\x4b\x00\xff\xff\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x40\x00\xff\xff\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\x49\x00\xff\xff\xff\xff\xff\xff\x10\x00\x4e\x00\x4f\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x08\x00\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x10\x00\x3a\x00\xff\xff\x13\x00\xff\xff\x15\x00\xff\xff\x40\x00\x18\x00\x19\x00\x10\x00\xff\xff\xff\xff\x13\x00\xff\xff\x15\x00\x49\x00\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\x4f\x00\x29\x00\x2a\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\xff\xff\xff\xff\xff\xff\x29\x00\x40\x00\x2b\x00\x2c\x00\x2d\x00\x2e\x00\xff\xff\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x40\x00\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x40\x00\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\xff\xff\x3a\x00\xff\xff\x2b\x00\x2c\x00\x2d\x00\x2e\x00\x40\x00\x30\x00\x31\x00\xff\xff\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x38\x00\x10\x00\x3a\x00\xff\xff\x13\x00\xff\xff\x15\x00\xff\xff\x40\x00\x18\x00\x19\x00\x10\x00\xff\xff\xff\xff\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\x10\x00\x18\x00\x19\x00\x13\x00\xff\xff\x15\x00\xff\xff\xff\xff\x18\x00\x19\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x82\x00\x0b\x00\x0c\x00\xd3\x00\x0d\x00\x0e\x00\x86\x00\x79\x00\x05\x00\x4c\x00\xfc\x00\x06\x00\x57\x00\x07\x00\x0f\x01\x4d\x00\x58\x00\x09\x00\x0f\x00\x10\x00\x20\x00\x15\x01\x11\x00\x77\x00\x12\x00\xde\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x59\x00\x03\x01\x5b\x00\x05\x00\x92\x00\x93\x00\x06\x00\x13\x00\x07\x00\x7a\x00\x21\x00\x22\x00\x09\x00\x83\x00\x05\x00\x14\x00\x15\x00\x06\x00\xe2\x00\x07\x00\x16\x00\x87\x00\x69\x00\x09\x00\x23\x01\x17\x00\x18\x00\x13\x01\x19\x00\x25\x00\x1a\x00\xfd\x00\x04\x00\x6a\x00\x1b\x00\x34\x00\x1c\x00\xbb\x00\x1d\x00\x1e\x00\x1f\x00\x89\x00\x35\x00\x36\x00\x34\x00\x20\x00\x0b\x00\x0c\x00\x77\x00\x0d\x00\x0e\x00\x35\x00\x36\x00\x05\x00\xb7\x00\xc0\x00\x06\x00\x57\x00\x07\x00\xc3\x00\xc7\x00\x58\x00\x09\x00\x0f\x00\x10\x00\x04\x00\x0c\x00\x11\x00\x19\x01\x12\x00\x1a\x01\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x59\x00\xec\x00\x5b\x00\x1e\x01\x4b\x00\x05\x00\x4c\x00\x13\x00\x06\x00\x57\x00\x07\x00\x7a\x00\x4d\x00\x58\x00\x09\x00\x14\x00\x15\x00\xbc\x00\xbd\x00\xbe\x00\x16\x00\x10\x01\x11\x01\x12\x01\x13\x01\x17\x00\x18\x00\x85\x00\x19\x00\xe7\x00\x1a\x00\xbc\x00\xbf\x00\xbe\x00\x1b\x00\x00\x01\x1c\x00\x03\x01\x1d\x00\x1e\x00\x1f\x00\x0b\x01\x02\x01\x0b\x00\x0c\x00\x20\x00\x0d\x00\x0e\x00\x0c\x00\xfb\xff\x05\x00\x07\x01\x17\x01\x06\x00\x57\x00\x07\x00\xcf\x00\xd5\x00\x58\x00\x09\x00\x0f\x00\x10\x00\xd6\x00\xd8\x00\x11\x00\xd7\x00\x12\x00\xde\x00\x2f\x00\x30\x00\x31\x00\x32\x00\x33\x00\x34\x00\x59\x00\xef\x00\x5b\x00\x8b\x00\xdd\x00\x05\x00\xe0\x00\x13\x00\x06\x00\x8b\x00\x07\x00\xe7\x00\x7f\x00\x64\x00\x09\x00\x14\x00\x15\x00\xbc\x00\xc1\x00\xbe\x00\x16\x00\x39\x00\x3a\x00\x3b\x00\xee\x00\x17\x00\x18\x00\xf5\x00\x19\x00\x7e\x00\x1a\x00\x85\x00\x89\x00\x8b\x00\x1b\x00\x8c\x00\x1c\x00\xb9\x00\x1d\x00\x1e\x00\x1f\x00\x8d\x00\x90\x00\x0b\x00\x0c\x00\x20\x00\x0d\x00\x0e\x00\x05\x00\x0c\x00\xc6\x00\x06\x00\x57\x00\x07\x00\x8e\x00\x8f\x00\x58\x00\x09\x00\x91\x00\xc5\x00\x0f\x00\x10\x00\x05\x00\x00\x00\x11\x00\x06\x00\x12\x00\x07\x00\xff\xff\x00\x00\x64\x00\x09\x00\x59\x00\xf0\x00\x5b\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x13\x00\xd8\x00\xa2\x00\x66\x00\x00\x00\x4d\x00\x00\x00\x05\x00\x14\x00\x15\x00\x06\x00\x00\x00\x07\x00\x16\x00\x27\x00\x22\x00\x09\x00\x00\x00\x17\x00\x18\x00\x00\x00\x19\x00\xf4\x00\x1a\x00\x00\x00\x00\x00\x00\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x1e\x00\x1f\x00\x00\x00\x00\x00\x0b\x00\x0c\x00\x20\x00\x0d\x00\x0e\x00\x05\x00\x00\x00\x00\x00\x06\x00\x57\x00\x07\x00\x00\x00\x00\x00\x58\x00\x09\x00\x00\x00\x00\x00\x0f\x00\x10\x00\x05\x00\x00\x00\x11\x00\x06\x00\x12\x00\x07\x00\x00\x00\x00\x00\x64\x00\x09\x00\x59\x00\xf4\x00\x5b\x00\xc9\x00\xca\x00\xcb\x00\xcc\x00\x00\x00\xcd\x00\x13\x00\xb9\x00\x65\x00\x66\x00\x00\x00\x00\x00\x00\x00\x05\x00\x14\x00\x15\x00\x06\x00\x7a\x00\x07\x00\x16\x00\x27\x00\x22\x00\x09\x00\x05\x00\x17\x00\x18\x00\x06\x00\x19\x00\x07\x00\x1a\x00\x9e\x00\x22\x00\x09\x00\x1b\x00\x0b\x01\x1c\x00\x00\x00\x1d\x00\x1e\x00\x1f\x00\x00\x00\x00\x00\x0b\x00\x0c\x00\x20\x00\x0d\x00\x0e\x00\x05\x00\x00\x00\x00\x00\x06\x00\x57\x00\x07\x00\x00\x00\x00\x00\x58\x00\x09\x00\x00\x00\x00\x00\x0f\x00\x10\x00\x05\x00\x00\x00\x11\x00\x06\x00\x12\x00\x07\x00\x00\x00\x00\x00\x67\x00\x09\x00\x59\x00\xfb\x00\x5b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x13\x00\xbb\x00\x68\x00\x66\x00\x00\x00\x00\x00\x00\x00\x05\x00\x14\x00\x15\x00\x06\x00\xc6\x00\x07\x00\x16\x00\x24\x01\x22\x00\x09\x00\x05\x00\x17\x00\x18\x00\x06\x00\x19\x00\x07\x00\x1a\x00\x27\x00\x22\x00\x09\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x1e\x00\x1f\x00\x00\x00\x00\x00\x0b\x00\x0c\x00\x20\x00\x0d\x00\x0e\x00\x05\x00\x00\x00\x00\x00\x06\x00\x57\x00\x07\x00\x00\x00\x00\x00\x58\x00\x09\x00\x00\x00\x00\x00\x0f\x00\x10\x00\x05\x00\x00\x00\x11\x00\x06\x00\x12\x00\x07\x00\x00\x00\x00\x00\x72\x00\x09\x00\x59\x00\x5a\x00\x5b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x13\x00\x29\x00\x73\x00\x66\x00\x00\x00\x00\x00\x00\x00\x05\x00\x14\x00\x15\x00\x06\x00\x26\x00\x07\x00\x16\x00\x17\x01\x22\x00\x09\x00\x05\x00\x17\x00\x18\x00\x06\x00\x19\x00\x07\x00\x1a\x00\x27\x00\x22\x00\x09\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x1e\x00\x1f\x00\x00\x00\x00\x00\x0b\x00\x0c\x00\x20\x00\x0d\x00\x0e\x00\x00\x00\x00\x00\x05\x00\x00\x00\x00\x00\x06\x00\x57\x00\x07\x00\x00\x00\x00\x00\x58\x00\x09\x00\x0f\x00\x10\x00\x00\x00\x00\x00\x24\x00\x00\x00\x12\x00\x74\x00\x75\x00\x2a\x00\x00\x00\x2b\x00\x2c\x00\x25\x00\x59\x00\x5c\x00\x5b\x00\x00\x00\x00\x00\x05\x00\x00\x00\x13\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x70\x00\x09\x00\x14\x00\x15\x00\x00\x00\x00\x00\x00\x00\x16\x00\x00\x00\x00\x00\x00\x00\x05\x00\x17\x00\x18\x00\x06\x00\x19\x00\x07\x00\x1a\x00\x09\x01\x22\x00\x09\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x1e\x00\x1f\x00\x00\x00\x00\x00\x0b\x00\x0c\x00\x20\x00\x0d\x00\x0e\x00\x05\x00\x00\x00\x00\x00\x06\x00\x57\x00\x07\x00\x00\x00\x00\x00\x58\x00\x09\x00\x00\x00\x00\x00\x0f\x00\x10\x00\x00\x00\x00\x00\x11\x00\x00\x00\x12\x00\x00\x00\xd0\x00\xd1\x00\x2c\x00\x00\x00\x59\x00\x5d\x00\x5b\x00\x00\x00\x00\x00\x05\x00\x00\x00\x00\x00\x06\x00\x13\x00\x07\x00\x00\x00\x00\x00\x70\x00\x09\x00\x00\x00\x05\x00\x14\x00\x15\x00\x06\x00\x00\x00\x07\x00\x16\x00\x0e\x01\x22\x00\x09\x00\x05\x00\x17\x00\x18\x00\x06\x00\x19\x00\x07\x00\x1a\x00\x14\x01\x22\x00\x09\x00\x1b\x00\x00\x00\x1c\x00\x00\x00\x1d\x00\x1e\x00\x1f\x00\x00\x00\x00\x00\x00\x00\x7d\x00\x20\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x29\x00\x2a\x00\x00\x00\x2b\x00\x2c\x00\x3c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x00\x3d\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x2d\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\xcd\x00\x22\x00\x09\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x00\x00\x00\x00\x56\x00\x57\x00\xc3\x00\x00\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x29\x00\x2a\x00\x00\x00\x2b\x00\x2c\x00\x3c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x00\x3d\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x70\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\xd3\x00\x22\x00\x09\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x80\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x3c\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x3d\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x5f\x00\x22\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\xee\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x81\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x3c\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x3d\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x9e\x00\x22\x00\x09\x00\x00\x00\x9f\x00\xa0\x00\xa1\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x3c\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x3d\x00\x00\x00\x56\x00\x57\x00\xff\xff\x05\x00\x00\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\xeb\x00\x22\x00\x09\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\xe1\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\xe2\x00\x00\x00\x56\x00\x57\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x00\x00\xcd\xff\xcd\xff\x00\x00\x00\x00\x3c\x00\x05\x00\x00\x00\x00\x00\x06\x00\x00\x00\x07\x00\x3d\x00\x5f\x00\x9b\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x60\x00\x9c\x00\x62\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x3c\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x3d\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\xf7\x00\x22\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x1c\x01\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x00\x00\x00\x00\x56\x00\x57\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x00\x00\x05\x00\x00\x00\x00\x00\x06\x00\x3c\x00\x07\x00\x00\x00\x5f\x00\x22\x00\x09\x00\x00\x00\x3d\x00\x00\x00\x00\x00\x60\x00\x61\x00\x62\x00\x05\x00\x00\x00\x00\x00\x06\x00\x00\x00\x07\x00\xf9\x00\x00\x00\xfa\x00\x09\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x1d\x01\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x00\x00\x00\x00\x56\x00\x57\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3c\x00\x05\x00\x00\x00\x00\x00\x06\x00\x6e\x00\x07\x00\x3d\x00\x05\x00\x6f\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x20\x01\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x7a\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x00\x00\x00\x00\x56\x00\x57\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3c\x00\x00\x00\x00\x00\x05\x00\xff\x00\x00\x00\x06\x00\x3d\x00\x07\x00\x00\x00\x05\x00\x21\x01\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x22\x01\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x3c\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x3d\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x1a\x01\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x00\x00\x01\x01\x00\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x00\x00\x00\x00\x56\x00\x57\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x00\x00\x05\x00\x00\x00\x00\x00\x06\x00\x3c\x00\x07\x00\x00\x00\x05\x00\x1e\x01\x09\x00\x06\x00\x3d\x00\x07\x00\x00\x00\x05\x00\x1f\x01\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x04\x01\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x00\x00\xe4\x00\x56\x00\x57\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x7b\x00\x05\x00\x00\x00\x00\x00\x06\x00\x3c\x00\x07\x00\x00\x00\x05\x00\x05\x01\x09\x00\x06\x00\x3d\x00\x07\x00\x00\x00\x05\x00\x07\x01\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x08\x01\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x00\x00\x00\x00\x56\x00\x57\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x00\x00\x05\x00\x00\x00\x00\x00\x06\x00\x3c\x00\x07\x00\x00\x00\x7c\x00\x0c\x01\x09\x00\x05\x00\x3d\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x0d\x01\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\xcf\x00\x09\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x00\x00\x00\x00\x56\x00\x57\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x84\x00\x05\x00\x00\x00\x00\x00\x06\x00\x3c\x00\x07\x00\x00\x00\x05\x00\xd9\x00\x09\x00\x06\x00\x3d\x00\x07\x00\x00\x00\x05\x00\xe4\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\xe5\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x3c\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x3d\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\xe8\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x4d\x00\x00\x00\x4e\x00\x88\x00\x4f\x00\x3c\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x3d\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\xe9\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x3d\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\xea\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x3c\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x3d\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\xf1\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x00\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\xf2\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x53\x00\x54\x00\x55\x00\x00\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\xf6\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x38\x00\x00\x00\x00\x00\x00\x00\x4d\x00\xdb\x00\x00\x00\x00\x00\x00\x00\x3c\x00\x50\x00\x51\x00\x00\x00\x53\x00\x54\x00\x55\x00\x3d\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\xf8\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x38\x00\x00\x00\x00\x00\x00\x00\x4d\x00\xdc\x00\x4e\x00\x00\x00\x4f\x00\x3c\x00\x50\x00\x51\x00\x52\x00\x00\x00\x54\x00\x55\x00\x3d\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x93\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x00\x00\x54\x00\x55\x00\x00\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x94\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x38\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x3c\x00\x50\x00\x51\x00\x00\x00\x53\x00\x54\x00\x55\x00\x3d\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x95\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x00\x00\x4d\x00\x00\x00\x4e\x00\x00\x00\x4f\x00\x00\x00\x50\x00\x51\x00\x52\x00\x00\x00\x54\x00\x55\x00\x00\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x96\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x05\x00\x4d\x00\x00\x00\x06\x00\x57\x00\x07\x00\x00\x00\x50\x00\x58\x00\x09\x00\x53\x00\x54\x00\x55\x00\x00\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x97\x00\x09\x00\x59\x00\x5e\x00\x5b\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x05\x00\x4d\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x98\x00\x09\x00\x53\x00\x54\x00\x55\x00\x00\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x99\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x05\x00\x4d\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x9a\x00\x09\x00\x53\x00\x00\x00\x55\x00\x00\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x9d\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x38\x00\x39\x00\x3a\x00\x3b\x00\x05\x00\x4d\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\xa3\x00\x09\x00\x53\x00\x00\x00\x00\x00\x00\x00\x05\x00\x56\x00\x57\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\xa4\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x38\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x05\x00\x4c\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x4d\x00\xa5\x00\x09\x00\x05\x00\x00\x00\x00\x00\x06\x00\x00\x00\x07\x00\x53\x00\x00\x00\xa6\x00\x09\x00\x00\x00\x00\x00\x57\x00\x3e\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3e\x00\x4d\x00\x40\x00\x41\x00\x42\x00\x43\x00\x00\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x40\x00\x41\x00\x42\x00\x43\x00\x4d\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4d\x00\x00\x00\x00\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x00\x00\x4c\x00\x00\x00\x40\x00\x41\x00\x42\x00\x43\x00\x4d\x00\x44\x00\x45\x00\x00\x00\x46\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x05\x00\x4c\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x4d\x00\xa7\x00\x09\x00\x05\x00\x00\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xa8\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xa9\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xaa\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xab\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xac\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xad\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xae\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xaf\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xb0\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xb1\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xb2\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xb3\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xb4\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xb5\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\xb6\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x63\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x6b\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x6c\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x6d\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x05\x00\x71\x00\x09\x00\x06\x00\x00\x00\x07\x00\x00\x00\x00\x00\x08\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (3, 144) [
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83),
	(84 , happyReduce_84),
	(85 , happyReduce_85),
	(86 , happyReduce_86),
	(87 , happyReduce_87),
	(88 , happyReduce_88),
	(89 , happyReduce_89),
	(90 , happyReduce_90),
	(91 , happyReduce_91),
	(92 , happyReduce_92),
	(93 , happyReduce_93),
	(94 , happyReduce_94),
	(95 , happyReduce_95),
	(96 , happyReduce_96),
	(97 , happyReduce_97),
	(98 , happyReduce_98),
	(99 , happyReduce_99),
	(100 , happyReduce_100),
	(101 , happyReduce_101),
	(102 , happyReduce_102),
	(103 , happyReduce_103),
	(104 , happyReduce_104),
	(105 , happyReduce_105),
	(106 , happyReduce_106),
	(107 , happyReduce_107),
	(108 , happyReduce_108),
	(109 , happyReduce_109),
	(110 , happyReduce_110),
	(111 , happyReduce_111),
	(112 , happyReduce_112),
	(113 , happyReduce_113),
	(114 , happyReduce_114),
	(115 , happyReduce_115),
	(116 , happyReduce_116),
	(117 , happyReduce_117),
	(118 , happyReduce_118),
	(119 , happyReduce_119),
	(120 , happyReduce_120),
	(121 , happyReduce_121),
	(122 , happyReduce_122),
	(123 , happyReduce_123),
	(124 , happyReduce_124),
	(125 , happyReduce_125),
	(126 , happyReduce_126),
	(127 , happyReduce_127),
	(128 , happyReduce_128),
	(129 , happyReduce_129),
	(130 , happyReduce_130),
	(131 , happyReduce_131),
	(132 , happyReduce_132),
	(133 , happyReduce_133),
	(134 , happyReduce_134),
	(135 , happyReduce_135),
	(136 , happyReduce_136),
	(137 , happyReduce_137),
	(138 , happyReduce_138),
	(139 , happyReduce_139),
	(140 , happyReduce_140),
	(141 , happyReduce_141),
	(142 , happyReduce_142),
	(143 , happyReduce_143),
	(144 , happyReduce_144)
	]

happy_n_terms = 81 :: Int
happy_n_nonterms = 43 :: Int

happyReduce_3 = happySpecReduce_2  0# happyReduction_3
happyReduction_3 happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_2 of { happy_var_2 -> 
	happyIn6
		 (happy_var_2
	)}

happyReduce_4 = happyMonadReduce 4# 1# happyReduction_4
happyReduction_4 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen (case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	case happyOut29 happy_x_4 of { happy_var_4 -> 
	( do
                                                    d <- convDecl happy_var_2 happy_var_4 
                                                    return $ annotate2 happy_var_1 happy_var_4 (Bind d))}}}
	) (\r -> happyReturn (happyIn7 r))

happyReduce_5 = happySpecReduce_3  1# happyReduction_5
happyReduction_5 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	happyIn7
		 (annotate happy_var_1 (RunAssertion (ASNot happy_var_3))
	)}}

happyReduce_6 = happySpecReduce_2  1# happyReduction_6
happyReduction_6 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (annotate happy_var_1 (RunAssertion happy_var_2)
	)}}

happyReduce_7 = happySpecReduce_1  1# happyReduction_7
happyReduction_7 happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	happyIn7
		 (annotate happy_var_1 (Evaluate happy_var_1)
	)}

happyReduce_8 = happySpecReduce_1  2# happyReduction_8
happyReduction_8 happy_x_1
	 =  happyIn8
		 (
	)

happyReduce_9 = happySpecReduce_2  2# happyReduction_9
happyReduction_9 happy_x_2
	happy_x_1
	 =  happyIn8
		 (
	)

happyReduce_10 = happySpecReduce_0  3# happyReduction_10
happyReduction_10  =  happyIn9
		 (
	)

happyReduce_11 = happySpecReduce_2  3# happyReduction_11
happyReduction_11 happy_x_2
	happy_x_1
	 =  happyIn9
		 (
	)

happyReduce_12 = happySpecReduce_0  4# happyReduction_12
happyReduction_12  =  happyIn10
		 ([]
	)

happyReduce_13 = happySpecReduce_1  4# happyReduction_13
happyReduction_13 happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	happyIn10
		 (happy_var_1
	)}

happyReduce_14 = happySpecReduce_1  5# happyReduction_14
happyReduction_14 happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn11
		 (combineDecls (reverse happy_var_1)
	)}

happyReduce_15 = happySpecReduce_1  6# happyReduction_15
happyReduction_15 happy_x_1
	 =  case happyOut14 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 ([happy_var_1]
	)}

happyReduce_16 = happySpecReduce_3  6# happyReduction_16
happyReduction_16 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOut13 happy_x_3 of { happy_var_3 -> 
	happyIn12
		 (case happy_var_3 of 
                                                    Just d -> d:happy_var_1
                                                    Nothing -> happy_var_1
	)}}

happyReduce_17 = happySpecReduce_0  7# happyReduction_17
happyReduction_17  =  happyIn13
		 (Nothing
	)

happyReduce_18 = happySpecReduce_1  7# happyReduction_18
happyReduction_18 happy_x_1
	 =  case happyOut14 happy_x_1 of { happy_var_1 -> 
	happyIn13
		 (Just happy_var_1
	)}

happyReduce_19 = happyMonadReduce 1# 8# happyReduction_19
happyReduction_19 (happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen (case happyOut15 happy_x_1 of { happy_var_1 -> 
	( annotateWithSymbolTable happy_var_1)}
	) (\r -> happyReturn (happyIn14 r))

happyReduce_20 = happyMonadReduce 3# 9# happyReduction_20
happyReduction_20 (happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen (case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut29 happy_x_3 of { happy_var_3 -> 
	( convDecl happy_var_1 happy_var_3)}}
	) (\r -> happyReturn (happyIn15 r))

happyReduce_21 = happySpecReduce_2  9# happyReduction_21
happyReduction_21 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	happyIn15
		 (annotate2List happy_var_1 happy_var_2 (Channel (map unLoc happy_var_2) Nothing)
	)}}

happyReduce_22 = happyReduce 4# 9# happyReduction_22
happyReduction_22 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	case happyOut29 happy_x_4 of { happy_var_4 -> 
	happyIn15
		 (annotate2 happy_var_1 happy_var_4 (Channel (map unLoc happy_var_2) (Just happy_var_4))
	) `HappyStk` happyRest}}}

happyReduce_23 = happyReduce 4# 9# happyReduction_23
happyReduction_23 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut22 happy_x_2 of { happy_var_2 -> 
	case happyOut20 happy_x_4 of { happy_var_4 -> 
	happyIn15
		 (annotate2List happy_var_1 happy_var_4 (DataType (unLoc happy_var_2) happy_var_4)
	) `HappyStk` happyRest}}}

happyReduce_24 = happySpecReduce_2  9# happyReduction_24
happyReduction_24 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	happyIn15
		 (annotate2List happy_var_1 happy_var_2 (External (map unLoc happy_var_2))
	)}}

happyReduce_25 = happySpecReduce_2  9# happyReduction_25
happyReduction_25 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut23 happy_x_2 of { happy_var_2 -> 
	happyIn15
		 (annotate2List happy_var_1 happy_var_2 (Transparent (map unLoc happy_var_2))
	)}}

happyReduce_26 = happySpecReduce_3  9# happyReduction_26
happyReduction_26 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	happyIn15
		 (annotate happy_var_1 (Assert (ASNot happy_var_3))
	)}}

happyReduce_27 = happySpecReduce_2  9# happyReduction_27
happyReduction_27 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_2 of { happy_var_2 -> 
	happyIn15
		 (annotate happy_var_1 (Assert happy_var_2)
	)}}

happyReduce_28 = happyReduce 4# 9# happyReduction_28
happyReduction_28 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut22 happy_x_2 of { happy_var_2 -> 
	case happyOut29 happy_x_4 of { happy_var_4 -> 
	happyIn15
		 (annotate2 happy_var_1 happy_var_4 (NameType (unLoc happy_var_2) happy_var_4)
	) `HappyStk` happyRest}}}

happyReduce_29 = happySpecReduce_3  10# happyReduction_29
happyReduction_29 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut29 happy_x_3 of { happy_var_3 -> 
	happyIn16
		 ((Refinement happy_var_1 (getRefinesModel happy_var_2) happy_var_3 [])
	)}}}

happyReduce_30 = happyReduce 4# 10# happyReduction_30
happyReduction_30 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut29 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { happy_var_2 -> 
	case happyOut29 happy_x_3 of { happy_var_3 -> 
	case happyOut18 happy_x_4 of { happy_var_4 -> 
	happyIn16
		 ((Refinement happy_var_1 (getRefinesModel happy_var_2) happy_var_3 [happy_var_4])
	) `HappyStk` happyRest}}}}

happyReduce_31 = happySpecReduce_2  10# happyReduction_31
happyReduction_31 happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	case happyOut17 happy_x_2 of { happy_var_2 -> 
	happyIn16
		 ((PropertyCheck happy_var_1 happy_var_2 Nothing)
	)}}

happyReduce_32 = happySpecReduce_3  10# happyReduction_32
happyReduction_32 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	case happyOut17 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_3 of { happy_var_3 -> 
	happyIn16
		 ((PropertyCheck happy_var_1 happy_var_2 (Just (getPropModel happy_var_3)))
	)}}}

happyReduce_33 = happySpecReduce_1  11# happyReduction_33
happyReduction_33 happy_x_1
	 =  happyIn17
		 (DeadlockFreedom
	)

happyReduce_34 = happySpecReduce_1  11# happyReduction_34
happyReduction_34 happy_x_1
	 =  happyIn17
		 (LivelockFreedom
	)

happyReduce_35 = happySpecReduce_1  11# happyReduction_35
happyReduction_35 happy_x_1
	 =  happyIn17
		 (LivelockFreedom
	)

happyReduce_36 = happySpecReduce_1  11# happyReduction_36
happyReduction_36 happy_x_1
	 =  happyIn17
		 (Deterministic
	)

happyReduce_37 = happySpecReduce_2  12# happyReduction_37
happyReduction_37 happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_2 of { happy_var_2 -> 
	happyIn18
		 (TauPriority happy_var_2
	)}

happyReduce_38 = happySpecReduce_3  13# happyReduction_38
happyReduction_38 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_1 of { happy_var_1 -> 
	case happyOut29 happy_x_3 of { happy_var_3 -> 
	happyIn19
		 (annotate2 happy_var_1 happy_var_3 (DataTypeClause (unLoc happy_var_1) (Just happy_var_3))
	)}}

happyReduce_39 = happySpecReduce_1  13# happyReduction_39
happyReduction_39 happy_x_1
	 =  case happyOut22 happy_x_1 of { happy_var_1 -> 
	happyIn19
		 (annotate happy_var_1 (DataTypeClause (unLoc happy_var_1) Nothing)
	)}

happyReduce_40 = happySpecReduce_1  14# happyReduction_40
happyReduction_40 happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	happyIn20
		 (reverse happy_var_1
	)}

happyReduce_41 = happySpecReduce_1  15# happyReduction_41
happyReduction_41 happy_x_1
	 =  case happyOut19 happy_x_1 of { happy_var_1 -> 
	happyIn21
		 ([happy_var_1]
	)}

happyReduce_42 = happySpecReduce_3  15# happyReduction_42
happyReduction_42 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	case happyOut19 happy_x_3 of { happy_var_3 -> 
	happyIn21
		 (happy_var_3:happy_var_1
	)}}

happyReduce_43 = happySpecReduce_1  16# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn22
		 (liftLoc happy_var_1 (UnQual (OccName (getName happy_var_1)))
	)}

happyReduce_44 = happySpecReduce_1  17# happyReduction_44
happyReduction_44 happy_x_1
	 =  case happyOut24 happy_x_1 of { happy_var_1 -> 
	happyIn23
		 (reverse happy_var_1
	)}

happyReduce_45 = happySpecReduce_1  18# happyReduction_45
happyReduction_45 happy_x_1
	 =  case happyOut22 happy_x_1 of { happy_var_1 -> 
	happyIn24
		 ([happy_var_1]
	)}

happyReduce_46 = happySpecReduce_3  18# happyReduction_46
happyReduction_46 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut24 happy_x_1 of { happy_var_1 -> 
	case happyOut22 happy_x_3 of { happy_var_3 -> 
	happyIn24
		 (happy_var_3:happy_var_1
	)}}

happyReduce_47 = happySpecReduce_1  19# happyReduction_47
happyReduction_47 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn25
		 (liftLoc happy_var_1 (Int (getInt happy_var_1))
	)}

happyReduce_48 = happySpecReduce_1  19# happyReduction_48
happyReduction_48 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn25
		 (liftLoc happy_var_1 (Bool True)
	)}

happyReduce_49 = happySpecReduce_1  19# happyReduction_49
happyReduction_49 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn25
		 (liftLoc happy_var_1 (Bool False)
	)}

happyReduce_50 = happySpecReduce_1  20# happyReduction_50
happyReduction_50 happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	happyIn26
		 (convPat happy_var_1
	)}

happyReduce_51 = happyMonadReduce 1# 21# happyReduction_51
happyReduction_51 (happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen (case happyOutTok happy_x_1 of { happy_var_1 -> 
	( do
                                    modifyTopFileParserState (
                                        \ st @ (FileParserState { sequenceStack = (c:cs) }) -> 
                                            st { sequenceStack = (c+1):cs })
                                    return happy_var_1)}
	) (\r -> happyReturn (happyIn27 r))

happyReduce_52 = happySpecReduce_1  22# happyReduction_52
happyReduction_52 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn28
		 (happy_var_1
	)}

happyReduce_53 = happySpecReduce_1  23# happyReduction_53
happyReduction_53 happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	happyIn29
		 (checkExp happy_var_1
	)}

happyReduce_54 = happyMonadReduce 1# 24# happyReduction_54
happyReduction_54 (happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen (case happyOut31 happy_x_1 of { happy_var_1 -> 
	( do
                                        t <- freshPType
                                        let An l _ e = happy_var_1
                                        return $ An l (Nothing, t) e)}
	) (\r -> happyReturn (happyIn30 r))

happyReduce_55 = happySpecReduce_1  25# happyReduction_55
happyReduction_55 happy_x_1
	 =  case happyOut25 happy_x_1 of { happy_var_1 -> 
	happyIn31
		 (liftLoc happy_var_1 (Lit (unLoc happy_var_1))
	)}

happyReduce_56 = happySpecReduce_1  25# happyReduction_56
happyReduction_56 happy_x_1
	 =  case happyOut22 happy_x_1 of { happy_var_1 -> 
	happyIn31
		 (liftLoc happy_var_1 (Var (unLoc happy_var_1))
	)}

happyReduce_57 = happySpecReduce_3  25# happyReduction_57
happyReduction_57 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut41 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (Tuple happy_var_2)
	)}}}

happyReduce_58 = happySpecReduce_3  25# happyReduction_58
happyReduction_58 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (DotApp happy_var_1 happy_var_3)
	)}}

happyReduce_59 = happyReduce 4# 25# happyReduction_59
happyReduction_59 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_4 (Let (checkLetDecls happy_var_2) happy_var_4)
	) `HappyStk` happyRest}}}

happyReduce_60 = happyReduce 6# 25# happyReduction_60
happyReduction_60 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	case happyOut30 happy_x_6 of { happy_var_6 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_6 (If happy_var_2 happy_var_4 happy_var_6)
	) `HappyStk` happyRest}}}}

happyReduce_61 = happySpecReduce_3  25# happyReduction_61
happyReduction_61 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (Paren happy_var_2)
	)}}}

happyReduce_62 = happyReduce 4# 25# happyReduction_62
happyReduction_62 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_3 of { happy_var_3 -> 
	case happyOutTok happy_x_4 of { happy_var_4 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_4 (App happy_var_1 happy_var_3)
	) `HappyStk` happyRest}}}

happyReduce_63 = happyReduce 4# 25# happyReduction_63
happyReduction_63 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut26 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_4 (Lambda happy_var_2 happy_var_4)
	) `HappyStk` happyRest}}}

happyReduce_64 = happySpecReduce_3  25# happyReduction_64
happyReduction_64 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (BooleanBinaryOp Equals happy_var_1 happy_var_3)
	)}}

happyReduce_65 = happySpecReduce_3  25# happyReduction_65
happyReduction_65 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (BooleanBinaryOp NotEquals happy_var_1 happy_var_3)
	)}}

happyReduce_66 = happySpecReduce_3  25# happyReduction_66
happyReduction_66 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (BooleanBinaryOp LessThan happy_var_1 happy_var_3)
	)}}

happyReduce_67 = happySpecReduce_3  25# happyReduction_67
happyReduction_67 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (BooleanBinaryOp GreaterThan happy_var_1 happy_var_3)
	)}}

happyReduce_68 = happySpecReduce_3  25# happyReduction_68
happyReduction_68 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (BooleanBinaryOp LessThanEq happy_var_1 happy_var_3)
	)}}

happyReduce_69 = happySpecReduce_3  25# happyReduction_69
happyReduction_69 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (BooleanBinaryOp GreaterThanEq happy_var_1 happy_var_3)
	)}}

happyReduce_70 = happySpecReduce_2  25# happyReduction_70
happyReduction_70 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_2 (BooleanUnaryOp Not happy_var_2)
	)}}

happyReduce_71 = happySpecReduce_3  25# happyReduction_71
happyReduction_71 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (BooleanBinaryOp Or happy_var_1 happy_var_3)
	)}}

happyReduce_72 = happySpecReduce_3  25# happyReduction_72
happyReduction_72 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (BooleanBinaryOp And happy_var_1 happy_var_3)
	)}}

happyReduce_73 = happySpecReduce_2  25# happyReduction_73
happyReduction_73 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_2 (MathsUnaryOp Negate happy_var_2)
	)}}

happyReduce_74 = happySpecReduce_3  25# happyReduction_74
happyReduction_74 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (MathsBinaryOp Plus happy_var_1 happy_var_3)
	)}}

happyReduce_75 = happySpecReduce_3  25# happyReduction_75
happyReduction_75 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (MathsBinaryOp Minus happy_var_1 happy_var_3)
	)}}

happyReduce_76 = happySpecReduce_3  25# happyReduction_76
happyReduction_76 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (MathsBinaryOp Mod happy_var_1 happy_var_3)
	)}}

happyReduce_77 = happySpecReduce_3  25# happyReduction_77
happyReduction_77 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (MathsBinaryOp Divide happy_var_1 happy_var_3)
	)}}

happyReduce_78 = happySpecReduce_3  25# happyReduction_78
happyReduction_78 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (MathsBinaryOp Times happy_var_1 happy_var_3)
	)}}

happyReduce_79 = happySpecReduce_1  25# happyReduction_79
happyReduction_79 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn31
		 (annotate happy_var_1 (List [])
	)}

happyReduce_80 = happySpecReduce_3  25# happyReduction_80
happyReduction_80 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut27 happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_2 of { happy_var_2 -> 
	case happyOut28 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (List happy_var_2)
	)}}}

happyReduce_81 = happyReduce 5# 25# happyReduction_81
happyReduction_81 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut27 happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_2 of { happy_var_2 -> 
	case happyOut47 happy_x_4 of { happy_var_4 -> 
	case happyOut28 happy_x_5 of { happy_var_5 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_5 (ListComp happy_var_2 happy_var_4)
	) `HappyStk` happyRest}}}}

happyReduce_82 = happyReduce 4# 25# happyReduction_82
happyReduction_82 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut27 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	case happyOut28 happy_x_4 of { happy_var_4 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_4 (ListEnumFrom happy_var_2)
	) `HappyStk` happyRest}}}

happyReduce_83 = happyReduce 5# 25# happyReduction_83
happyReduction_83 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut27 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	case happyOut28 happy_x_5 of { happy_var_5 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_5 (ListEnumFromTo happy_var_2 happy_var_4)
	) `HappyStk` happyRest}}}}

happyReduce_84 = happySpecReduce_3  25# happyReduction_84
happyReduction_84 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (Concat happy_var_1 happy_var_3)
	)}}

happyReduce_85 = happySpecReduce_2  25# happyReduction_85
happyReduction_85 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_2 (ListLength happy_var_2)
	)}}

happyReduce_86 = happySpecReduce_3  25# happyReduction_86
happyReduction_86 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (Set happy_var_2)
	)}}}

happyReduce_87 = happyReduce 5# 25# happyReduction_87
happyReduction_87 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_2 of { happy_var_2 -> 
	case happyOut47 happy_x_4 of { happy_var_4 -> 
	case happyOutTok happy_x_5 of { happy_var_5 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_5 (SetComp happy_var_2 happy_var_4)
	) `HappyStk` happyRest}}}}

happyReduce_88 = happyReduce 4# 25# happyReduction_88
happyReduction_88 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_4 of { happy_var_4 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_4 (SetEnumFrom happy_var_2)
	) `HappyStk` happyRest}}}

happyReduce_89 = happyReduce 5# 25# happyReduction_89
happyReduction_89 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	case happyOutTok happy_x_5 of { happy_var_5 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_5 (SetEnumFromTo happy_var_2 happy_var_4)
	) `HappyStk` happyRest}}}}

happyReduce_90 = happySpecReduce_3  25# happyReduction_90
happyReduction_90 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (SetEnum happy_var_2)
	)}}}

happyReduce_91 = happyReduce 5# 25# happyReduction_91
happyReduction_91 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_2 of { happy_var_2 -> 
	case happyOut47 happy_x_4 of { happy_var_4 -> 
	case happyOutTok happy_x_5 of { happy_var_5 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_5 (SetEnumComp happy_var_2 happy_var_4)
	) `HappyStk` happyRest}}}}

happyReduce_92 = happySpecReduce_1  25# happyReduction_92
happyReduction_92 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn31
		 (liftLoc happy_var_1 (ExpPatWildCard)
	)}

happyReduce_93 = happySpecReduce_3  25# happyReduction_93
happyReduction_93 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (liftLoc happy_var_1 (ExpPatDoublePattern happy_var_1 happy_var_3)
	)}}

happyReduce_94 = happyReduce 4# 25# happyReduction_94
happyReduction_94 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut39 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_4 (Prefix happy_var_1 happy_var_2 happy_var_4)
	) `HappyStk` happyRest}}}

happyReduce_95 = happySpecReduce_3  25# happyReduction_95
happyReduction_95 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (Prefix happy_var_1 [] happy_var_3)
	)}}

happyReduce_96 = happySpecReduce_3  25# happyReduction_96
happyReduction_96 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (ExternalChoice happy_var_1 happy_var_3)
	)}}

happyReduce_97 = happySpecReduce_3  25# happyReduction_97
happyReduction_97 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (Hiding happy_var_1 happy_var_3)
	)}}

happyReduce_98 = happySpecReduce_3  25# happyReduction_98
happyReduction_98 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (InternalChoice happy_var_1 happy_var_3)
	)}}

happyReduce_99 = happySpecReduce_3  25# happyReduction_99
happyReduction_99 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (Interleave happy_var_1 happy_var_3)
	)}}

happyReduce_100 = happyReduce 5# 25# happyReduction_100
happyReduction_100 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	case happyOut30 happy_x_5 of { happy_var_5 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_5 (GenParallel happy_var_1 happy_var_3 happy_var_5)
	) `HappyStk` happyRest}}}

happyReduce_101 = happyReduce 7# 25# happyReduction_101
happyReduction_101 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	case happyOut30 happy_x_5 of { happy_var_5 -> 
	case happyOut30 happy_x_7 of { happy_var_7 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_7 (AlphaParallel happy_var_1 happy_var_3 happy_var_5 happy_var_7)
	) `HappyStk` happyRest}}}}

happyReduce_102 = happySpecReduce_3  25# happyReduction_102
happyReduction_102 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (Interrupt happy_var_1 happy_var_3)
	)}}

happyReduce_103 = happyReduce 5# 25# happyReduction_103
happyReduction_103 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	case happyOut30 happy_x_5 of { happy_var_5 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_5 (Exception happy_var_1 happy_var_3 happy_var_5)
	) `HappyStk` happyRest}}}

happyReduce_104 = happySpecReduce_3  25# happyReduction_104
happyReduction_104 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (SlidingChoice happy_var_1 happy_var_3)
	)}}

happyReduce_105 = happySpecReduce_3  25# happyReduction_105
happyReduction_105 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (SequentialComp happy_var_1 happy_var_3)
	)}}

happyReduce_106 = happySpecReduce_3  25# happyReduction_106
happyReduction_106 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_3 (GuardedExp happy_var_1 happy_var_3)
	)}}

happyReduce_107 = happyReduce 5# 25# happyReduction_107
happyReduction_107 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut34 happy_x_3 of { happy_var_3 -> 
	case happyOut45 happy_x_4 of { happy_var_4 -> 
	case happyOutTok happy_x_5 of { happy_var_5 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_5 (Rename happy_var_1 happy_var_3 happy_var_4)
	) `HappyStk` happyRest}}}}

happyReduce_108 = happyReduce 6# 25# happyReduction_108
happyReduction_108 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut37 happy_x_3 of { happy_var_3 -> 
	case happyOut45 happy_x_4 of { happy_var_4 -> 
	case happyOut30 happy_x_6 of { happy_var_6 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_6 (LinkParallel happy_var_1 happy_var_3 happy_var_4 happy_var_6)
	) `HappyStk` happyRest}}}}

happyReduce_109 = happyReduce 4# 25# happyReduction_109
happyReduction_109 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut47 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_4 (ReplicatedInterleave happy_var_2 happy_var_4)
	) `HappyStk` happyRest}}}

happyReduce_110 = happyReduce 4# 25# happyReduction_110
happyReduction_110 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut47 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_4 (ReplicatedExternalChoice happy_var_2 happy_var_4)
	) `HappyStk` happyRest}}}

happyReduce_111 = happyReduce 4# 25# happyReduction_111
happyReduction_111 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut47 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_4 (ReplicatedInternalChoice happy_var_2 happy_var_4)
	) `HappyStk` happyRest}}}

happyReduce_112 = happyReduce 7# 25# happyReduction_112
happyReduction_112 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut47 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_5 of { happy_var_5 -> 
	case happyOut30 happy_x_7 of { happy_var_7 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_7 (ReplicatedAlphaParallel happy_var_2 happy_var_5 happy_var_7)
	) `HappyStk` happyRest}}}}

happyReduce_113 = happyReduce 6# 25# happyReduction_113
happyReduction_113 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	case happyOut47 happy_x_4 of { happy_var_4 -> 
	case happyOut30 happy_x_6 of { happy_var_6 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_6 (ReplicatedParallel happy_var_2 happy_var_4 happy_var_6)
	) `HappyStk` happyRest}}}}

happyReduce_114 = happyReduce 7# 25# happyReduction_114
happyReduction_114 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut37 happy_x_2 of { happy_var_2 -> 
	case happyOut45 happy_x_3 of { happy_var_3 -> 
	case happyOut47 happy_x_5 of { happy_var_5 -> 
	case happyOut30 happy_x_7 of { happy_var_7 -> 
	happyIn31
		 (annotate2 happy_var_1 happy_var_7 (ReplicatedLinkParallel happy_var_2 happy_var_3 happy_var_5 happy_var_7)
	) `HappyStk` happyRest}}}}}

happyReduce_115 = happySpecReduce_2  26# happyReduction_115
happyReduction_115 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	happyIn32
		 (annotate2 happy_var_1 happy_var_2 (Input (convPat happy_var_2) Nothing)
	)}}

happyReduce_116 = happyReduce 4# 26# happyReduction_116
happyReduction_116 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	happyIn32
		 (annotate2 happy_var_1 happy_var_4 (Input (convPat happy_var_2) (Just (checkExp happy_var_4)))
	) `HappyStk` happyRest}}}

happyReduce_117 = happySpecReduce_2  26# happyReduction_117
happyReduction_117 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	happyIn32
		 (annotate2 happy_var_1 happy_var_2 (NonDetInput (convPat happy_var_2) Nothing)
	)}}

happyReduce_118 = happyReduce 4# 26# happyReduction_118
happyReduction_118 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	case happyOut30 happy_x_4 of { happy_var_4 -> 
	happyIn32
		 (annotate2 happy_var_1 happy_var_4 (NonDetInput (convPat happy_var_2) (Just (checkExp happy_var_4)))
	) `HappyStk` happyRest}}}

happyReduce_119 = happySpecReduce_2  26# happyReduction_119
happyReduction_119 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_2 of { happy_var_2 -> 
	happyIn32
		 (annotate2 happy_var_1 happy_var_2 (Output (checkExp happy_var_2))
	)}}

happyReduce_120 = happySpecReduce_3  27# happyReduction_120
happyReduction_120 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	case happyOut29 happy_x_3 of { happy_var_3 -> 
	happyIn33
		 ((happy_var_1, happy_var_3)
	)}}

happyReduce_121 = happySpecReduce_1  28# happyReduction_121
happyReduction_121 happy_x_1
	 =  case happyOut35 happy_x_1 of { happy_var_1 -> 
	happyIn34
		 (reverse happy_var_1
	)}

happyReduce_122 = happySpecReduce_1  29# happyReduction_122
happyReduction_122 happy_x_1
	 =  case happyOut33 happy_x_1 of { happy_var_1 -> 
	happyIn35
		 ([happy_var_1]
	)}

happyReduce_123 = happySpecReduce_3  29# happyReduction_123
happyReduction_123 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut35 happy_x_1 of { happy_var_1 -> 
	case happyOut33 happy_x_3 of { happy_var_3 -> 
	happyIn35
		 (happy_var_3:happy_var_1
	)}}

happyReduce_124 = happySpecReduce_3  30# happyReduction_124
happyReduction_124 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_1 of { happy_var_1 -> 
	case happyOut29 happy_x_3 of { happy_var_3 -> 
	happyIn36
		 ((happy_var_1, happy_var_3)
	)}}

happyReduce_125 = happySpecReduce_1  31# happyReduction_125
happyReduction_125 happy_x_1
	 =  case happyOut38 happy_x_1 of { happy_var_1 -> 
	happyIn37
		 (reverse happy_var_1
	)}

happyReduce_126 = happySpecReduce_1  32# happyReduction_126
happyReduction_126 happy_x_1
	 =  case happyOut36 happy_x_1 of { happy_var_1 -> 
	happyIn38
		 ([happy_var_1]
	)}

happyReduce_127 = happySpecReduce_3  32# happyReduction_127
happyReduction_127 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut38 happy_x_1 of { happy_var_1 -> 
	case happyOut36 happy_x_3 of { happy_var_3 -> 
	happyIn38
		 (happy_var_3:happy_var_1
	)}}

happyReduce_128 = happySpecReduce_1  33# happyReduction_128
happyReduction_128 happy_x_1
	 =  case happyOut40 happy_x_1 of { happy_var_1 -> 
	happyIn39
		 (reverse happy_var_1
	)}

happyReduce_129 = happySpecReduce_1  34# happyReduction_129
happyReduction_129 happy_x_1
	 =  case happyOut32 happy_x_1 of { happy_var_1 -> 
	happyIn40
		 ([happy_var_1]
	)}

happyReduce_130 = happySpecReduce_2  34# happyReduction_130
happyReduction_130 happy_x_2
	happy_x_1
	 =  case happyOut40 happy_x_1 of { happy_var_1 -> 
	case happyOut32 happy_x_2 of { happy_var_2 -> 
	happyIn40
		 (happy_var_2:happy_var_1
	)}}

happyReduce_131 = happySpecReduce_3  35# happyReduction_131
happyReduction_131 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	case happyOut44 happy_x_3 of { happy_var_3 -> 
	happyIn41
		 (happy_var_1:(reverse happy_var_3)
	)}}

happyReduce_132 = happySpecReduce_1  36# happyReduction_132
happyReduction_132 happy_x_1
	 =  case happyOut44 happy_x_1 of { happy_var_1 -> 
	happyIn42
		 (reverse happy_var_1
	)}

happyReduce_133 = happySpecReduce_0  37# happyReduction_133
happyReduction_133  =  happyIn43
		 ([]
	)

happyReduce_134 = happySpecReduce_1  37# happyReduction_134
happyReduction_134 happy_x_1
	 =  case happyOut44 happy_x_1 of { happy_var_1 -> 
	happyIn43
		 (reverse happy_var_1
	)}

happyReduce_135 = happySpecReduce_3  38# happyReduction_135
happyReduction_135 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut44 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn44
		 (happy_var_3:happy_var_1
	)}}

happyReduce_136 = happySpecReduce_1  38# happyReduction_136
happyReduction_136 happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	happyIn44
		 ([happy_var_1]
	)}

happyReduce_137 = happySpecReduce_0  39# happyReduction_137
happyReduction_137  =  happyIn45
		 ([]
	)

happyReduce_138 = happySpecReduce_2  39# happyReduction_138
happyReduction_138 happy_x_2
	happy_x_1
	 =  case happyOut47 happy_x_2 of { happy_var_2 -> 
	happyIn45
		 (happy_var_2
	)}

happyReduce_139 = happySpecReduce_3  40# happyReduction_139
happyReduction_139 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut26 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn46
		 (annotate2 happy_var_1 happy_var_3 (Generator happy_var_1 happy_var_3)
	)}}

happyReduce_140 = happySpecReduce_3  40# happyReduction_140
happyReduction_140 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut26 happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { happy_var_3 -> 
	happyIn46
		 (annotate2 happy_var_1 happy_var_3 (Generator happy_var_1 happy_var_3)
	)}}

happyReduce_141 = happySpecReduce_1  40# happyReduction_141
happyReduction_141 happy_x_1
	 =  case happyOut30 happy_x_1 of { happy_var_1 -> 
	happyIn46
		 (annotate happy_var_1 (Qualifier happy_var_1)
	)}

happyReduce_142 = happySpecReduce_1  41# happyReduction_142
happyReduction_142 happy_x_1
	 =  case happyOut48 happy_x_1 of { happy_var_1 -> 
	happyIn47
		 (reverse happy_var_1
	)}

happyReduce_143 = happySpecReduce_3  42# happyReduction_143
happyReduction_143 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut48 happy_x_1 of { happy_var_1 -> 
	case happyOut46 happy_x_3 of { happy_var_3 -> 
	happyIn48
		 (happy_var_3:happy_var_1
	)}}

happyReduce_144 = happySpecReduce_1  42# happyReduction_144
happyReduction_144 happy_x_1
	 =  case happyOut46 happy_x_1 of { happy_var_1 -> 
	happyIn48
		 ([happy_var_1]
	)}

happyNewToken action sts stk
	= getNextTokenWrapper(\tk -> 
	let cont i = happyDoAction i tk action sts stk in
	case tk of {
	L _ TEOF -> happyDoAction 80# tk action sts stk;
	L _ (TInteger _) -> cont 1#;
	L _ (TIdent _) -> cont 2#;
	L _ TNewLine -> cont 3#;
	L _ TFalse -> cont 4#;
	L _ TTrue -> cont 5#;
	L _ TDefineEqual -> cont 6#;
	L _ TComma -> cont 7#;
	L _ TDot -> cont 8#;
	L _ TQuestionMark -> cont 9#;
	L _ TDollar -> cont 10#;
	L _ TExclamationMark -> cont 11#;
	L _ TDoubleDot -> cont 12#;
	L _ TColon -> cont 13#;
	L _ TDrawnFrom -> cont 14#;
	L _ TTie -> cont 15#;
	L _ TPipe -> cont 16#;
	L _ TDoubleAt -> cont 17#;
	L _ TWildCard -> cont 18#;
	L _ TIf -> cont 19#;
	L _ TThen -> cont 20#;
	L _ TElse -> cont 21#;
	L _ TLet -> cont 22#;
	L _ TWithin -> cont 23#;
	L _ TBackSlash -> cont 24#;
	L _ TLambdaDot -> cont 25#;
	L _ TChannel -> cont 26#;
	L _ TDataType -> cont 27#;
	L _ TExternal -> cont 28#;
	L _ TTransparent -> cont 29#;
	L _ TNameType -> cont 30#;
	L _ TAssert -> cont 31#;
	L _ TDeadlockFree -> cont 32#;
	L _ TLivelockFree -> cont 33#;
	L _ TDivergenceFree -> cont 34#;
	L _ TDeterministic -> cont 35#;
	L _ TTauPriority -> cont 36#;
	L _ (TRefines _) -> cont 37#;
	L _ (TModel _) -> cont 38#;
	L _ TNot -> cont 39#;
	L _ TAssertNot -> cont 40#;
	L _ TAnd -> cont 41#;
	L _ TOr -> cont 42#;
	L _ TEq -> cont 43#;
	L _ TNotEq -> cont 44#;
	L _ TLtEq -> cont 45#;
	L _ TGtEq -> cont 46#;
	L _ TEmptySeq -> cont 47#;
	L _ TLt -> cont 48#;
	L _ TGt -> cont 49#;
	L _ TCloseSeq -> cont 50#;
	L _ TPlus -> cont 51#;
	L _ TMinus -> cont 52#;
	L _ TTimes -> cont 53#;
	L _ TDivide -> cont 54#;
	L _ TMod -> cont 55#;
	L _ TConcat -> cont 56#;
	L _ THash -> cont 57#;
	L _ TLParen -> cont 58#;
	L _ TRParen -> cont 59#;
	L _ TLBrace -> cont 60#;
	L _ TRBrace -> cont 61#;
	L _ TLPipeBrace -> cont 62#;
	L _ TRPipeBrace -> cont 63#;
	L _ TLDoubleSqBracket -> cont 64#;
	L _ TRDoubleSqBracket -> cont 65#;
	L _ TLPipeSqBracket -> cont 66#;
	L _ TRPipeSqBracket -> cont 67#;
	L _ TLSqBracket -> cont 68#;
	L _ TRSqBracket -> cont 69#;
	L _ TExtChoice -> cont 70#;
	L _ TIntChoice -> cont 71#;
	L _ TInterleave -> cont 72#;
	L _ TPrefix -> cont 73#;
	L _ TInterrupt -> cont 74#;
	L _ TSlidingChoice -> cont 75#;
	L _ TRException -> cont 76#;
	L _ TParallel -> cont 77#;
	L _ TSemiColon -> cont 78#;
	L _ TGuard -> cont 79#;
	_ -> happyError' tk
	})

happyError_ 80# tk = happyError' tk
happyError_ _ tk = happyError' tk

happyThen :: () => ParseMonad a -> (a -> ParseMonad b) -> ParseMonad b
happyThen = (>>=)
happyReturn :: () => a -> ParseMonad a
happyReturn = (return)
happyThen1 = happyThen
happyReturn1 :: () => a -> ParseMonad a
happyReturn1 = happyReturn
happyError' :: () => (LToken) -> ParseMonad a
happyError' tk = parseError tk

parseFile_ = happySomeParser where
  happySomeParser = happyThen (happyParse 0#) (\x -> happyReturn (happyOut6 x))

parseInteractiveStmt_ = happySomeParser where
  happySomeParser = happyThen (happyParse 1#) (\x -> happyReturn (happyOut7 x))

parseExpression_ = happySomeParser where
  happySomeParser = happyThen (happyParse 2#) (\x -> happyReturn (happyOut30 x))

happySeq = happyDontSeq


combineDecls :: [PDecl] -> [PDecl]
combineDecls [] = []
combineDecls ((An loc1 b (FunBind n ms)):(An loc2 c (FunBind n' ms')):ds) | n == n' = 
    combineDecls $ (An (combineSpans loc1 loc2) b (FunBind n (ms++ms'))):ds
combineDecls (d:ds) = d:combineDecls ds

convDecl :: PExp -> PExp -> ParseMonad PDecl
convDecl (lhs @ (An loc1 b lhsexp)) (rhs @ (An loc2 d _)) = 
    let
        span = combineSpans loc1 loc2

        -- REMEMBER: needs to reverse pts
        getPats :: Exp UnRenamedName -> ([[PPat]], UnRenamedName)
        getPats (App f args) = 
                ((map convPat args):ps, n)
            where
                (ps, n) = getPats (unAnnotate f)
        getPats (Var n) = ([], n)
        
        convFunBind exp = 
                FunBind n [An span (dummyAnnotation) (Match (reverse ps) rhs)]
            where
                (ps, n) = getPats exp

        convPatBind exp = PatBind (convPat exp) rhs
    in do
        symbTable <- freshPSymbolTable
        case lhsexp of
            App f args  -> return $ An span (Nothing, symbTable) (convFunBind lhsexp)
            _           -> return $ An span (Nothing, symbTable) (convPatBind lhs)

-- | Throws an error if a declaration that is not allowed inside a let 
-- expression is found.
checkLetDecls :: [PDecl] -> [PDecl]
checkLetDecls decls = map checkDecl decls
    where
        checkDecl :: PDecl -> PDecl
        checkDecl (anDecl@(An _ _ decl)) =
            let
                check (FunBind a b) = anDecl
                check (PatBind a b) = anDecl
                check _ = throwSourceError [invalidDeclarationErrorMessage anDecl]
            in check decl

checkExp :: PExp -> PExp
checkExp (anExp@(An a b exp)) =
    let 
        check :: Exp UnRenamedName -> Exp UnRenamedName
        check (App e es) = App (checkExp e) (map checkExp es)
        check (BooleanBinaryOp op e1 e2) = BooleanBinaryOp op (checkExp e1) (checkExp e2)
        check (BooleanUnaryOp op e) = BooleanUnaryOp op (checkExp e)
        check (Concat e1 e2) = Concat (checkExp e1) (checkExp e2)
        check (DotApp e1 e2) = DotApp (checkExp e1) (checkExp e2)
        check (If e1 e2 e3) = If (checkExp e1) (checkExp e2) (checkExp e3)
        check (Lambda p e) = Lambda p (checkExp e)
        check (Let decls e) = Let decls (checkExp e)
        check (Lit lit) = Lit lit
        check (List es) = List (map checkExp es)
        check (ListComp es stmts) = ListComp (map checkExp es) stmts
        check (ListEnumFrom e) = ListEnumFrom (checkExp e)
        check (ListEnumFromTo e1 e2) = ListEnumFromTo (checkExp e1) (checkExp e2)
        check (ListLength e) = ListLength (checkExp e)
        check (MathsBinaryOp op e1 e2) = MathsBinaryOp op (checkExp e1) (checkExp e2)
        check (MathsUnaryOp op e) = MathsUnaryOp op (checkExp e)
        check (Paren e) = Paren (checkExp e)
        check (Set es) = Set (map checkExp es)
        check (SetComp es stmts) = SetComp (map checkExp es) stmts
        check (SetEnumFrom e) = SetEnumFrom (checkExp e)
        check (SetEnumFromTo e1 e2) = SetEnumFromTo (checkExp e1) (checkExp e2)
        check (SetEnum es) = SetEnum (map checkExp es)
        -- We don't need to check inside stmts as they will have been checked
        -- upon creation
        check (SetEnumComp es stmts) = SetEnumComp (map checkExp es) stmts
        check (Tuple es) = Tuple (map checkExp es)
        check (Var qname) = Var qname

        check (AlphaParallel e1 e2 e3 e4) = 
            AlphaParallel (checkExp e1) (checkExp e2) (checkExp e3) (checkExp e4)
        check (Exception e1 e2 e3) = Exception (checkExp e1) (checkExp e2) (checkExp e3)
        check (ExternalChoice e1 e2) = ExternalChoice (checkExp e1) (checkExp e2)
        check (GenParallel e1 e2 e3) = GenParallel (checkExp e1) (checkExp e2) (checkExp e3)
        check (GuardedExp e1 e2) = GuardedExp (checkExp e1) (checkExp e2)
        check (Hiding e1 e2) = Hiding (checkExp e1) (checkExp e2)
        check (InternalChoice e1 e2) = InternalChoice (checkExp e1) (checkExp e2)
        check (Interrupt e1 e2) = Interrupt (checkExp e1) (checkExp e2)
        check (Interleave e1 e2) = Interleave (checkExp e1) (checkExp e2)
        check (LinkParallel e1 ties stmts e2) = 
            LinkParallel (checkExp e1) ties stmts (checkExp e2)
        check (Prefix e1 fields e2) = Prefix (checkExp e1) fields (checkExp e2)
        check (Rename e ties stmts) = Rename (checkExp e) ties stmts
        check (SequentialComp e1 e2) = SequentialComp (checkExp e1) (checkExp e2)
        check (SlidingChoice e1 e2) = SlidingChoice (checkExp e1) (checkExp e2)

        check (ReplicatedAlphaParallel stmts e1 e2) = 
            ReplicatedAlphaParallel stmts (checkExp e1) (checkExp e2)
        check (ReplicatedInterleave stmts e1) = ReplicatedInterleave stmts (checkExp e1)
        check (ReplicatedExternalChoice stmts e1) = ReplicatedExternalChoice stmts (checkExp e1)
        check (ReplicatedInternalChoice stmts e1) = ReplicatedInternalChoice stmts (checkExp e1)
        check (ReplicatedParallel e1 stmts e2) = 
            ReplicatedParallel (checkExp e1) stmts (checkExp e2)
        check (ReplicatedLinkParallel ties tiesStmts stmts e) = 
            ReplicatedLinkParallel ties tiesStmts stmts (checkExp e)
        
        check x = throwSourceError [invalidExpressionErrorMessage anExp]
    in
        An a b (check exp)

dotAppToList :: PExp -> [PExp]
dotAppToList (An a b exp) = 
    let 
        list :: Exp UnRenamedName -> [PExp]
        list (DotApp e1 e2) = (dotAppToList e1) ++ (dotAppToList e2)
        list x = [An a b x]
    in
        list exp

convPat :: PExp -> PPat
convPat (anExp@ (An a b exp)) = 
    let
        trans :: Exp UnRenamedName -> Pat UnRenamedName
        trans (Concat e1 e2) = PConcat (convPat e1) (convPat e2)
        trans (DotApp e1 e2) = PDotApp (convPat e1) (convPat e2)
        trans (List xs) = PList (map convPat xs)
        trans (Lit x) = PLit x
        trans (Set xs) = PSet (map convPat xs)
        trans (Paren x) = PParen (convPat x)
        trans (Tuple xs) = PTuple (map convPat xs)
        trans (Var x) = PVar x
        trans (ExpPatWildCard) = PWildCard
        trans (ExpPatDoublePattern e1 e2) = 
            PDoublePattern (convPat e1) (convPat e2)
        trans x = throwSourceError [invalidPatternErrorMessage anExp]
    in
        An a () (trans exp)

-- Helper function to get the contents of tokens
getInt (L _ (TInteger x)) = x
getName (L _ (TIdent x)) = x
getRefinesModel (L _ (TRefines x)) = x
getPropModel (L _ (TModel x)) = x

class Locatable a where
    getLoc :: a b -> SrcSpan
    unLoc :: a b -> b
    mkLoc :: SrcSpan -> b -> a b

instance Locatable Located where
    getLoc (L loc _) = loc
    unLoc (L _ b) = b
    mkLoc loc b = L loc b

instance Locatable (Annotated a) where
    getLoc (An loc _ _) = loc
    unLoc (An _ _ b) = b
    mkLoc loc b = An loc dummyAnnotation b

annotate :: (Locatable t1, Locatable t2) => t1 a -> b -> t2 b
annotate t1 b = mkLoc (getLoc t1) b

annotate2 :: 
    (Locatable t1, Locatable t2, Locatable t3) => t1 a -> t2 b -> c -> t3 c
annotate2 t1 t2 b = mkLoc (combineSpans (getLoc t1) (getLoc t2)) b
annotate2List :: 
    (Locatable t1, Locatable t2, Locatable t3) => t1 a -> [t2 b] -> c -> t3 c
annotate2List t1 t2 b = annotate2 t1 (last t2) b
annotate2List' :: 
    (Locatable t1, Locatable t2, Locatable t3) => [t1 a] -> t2 b -> c -> t3 c
annotate2List' t1 t2 b = annotate2 (last t1) t2 b

annotateWithSymbolTable 
    :: Annotated (Maybe SymbolTable, PSymbolTable) a -> ParseMonad (Annotated (Maybe SymbolTable, PSymbolTable) a)
annotateWithSymbolTable (An l _ a) = do
    symbTable <- freshPSymbolTable
    return $ An l (Nothing, symbTable) a

liftLoc :: (Locatable t1, Locatable t2) => t1 a -> b -> t2 b
liftLoc t1 b = mkLoc (getLoc t1) b

parseError :: LToken -> ParseMonad a
parseError tok = throwSourceError [parseErrorMessage tok]
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 30 "templates/GenericTemplate.hs" #-}


data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList





{-# LINE 51 "templates/GenericTemplate.hs" #-}

{-# LINE 61 "templates/GenericTemplate.hs" #-}

{-# LINE 70 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	(happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
	= {- nothing -}


	  case action of
		0#		  -> {- nothing -}
				     happyFail i tk st
		-1# 	  -> {- nothing -}
				     happyAccept i tk st
		n | (n Happy_GHC_Exts.<# (0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}

				     (happyReduceArr Happy_Data_Array.! rule) i tk st
				     where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
		n		  -> {- nothing -}


				     happyShift new_state i tk st
				     where (new_state) = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where (off)    = indexShortOffAddr happyActOffsets st
         (off_i)  = (off Happy_GHC_Exts.+# i)
	 check  = if (off_i Happy_GHC_Exts.>=# (0# :: Happy_GHC_Exts.Int#))
			then (indexShortOffAddr happyCheck off_i Happy_GHC_Exts.==#  i)
			else False
         (action)
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st

{-# LINE 130 "templates/GenericTemplate.hs" #-}


indexShortOffAddr (HappyA# arr) off =
	Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#





data HappyAddr = HappyA# Happy_GHC_Exts.Addr#




-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 163 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let (i) = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
	 sts1@((HappyCons (st1@(action)) (_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where (sts1@((HappyCons (st1@(action)) (_)))) = happyDrop k (HappyCons (st) (sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where (sts1@((HappyCons (st1@(action)) (_)))) = happyDrop k (HappyCons (st) (sts))
             drop_stk = happyDropStk k stk

             (off) = indexShortOffAddr happyGotoOffsets st1
             (off_i) = (off Happy_GHC_Exts.+# nt)
             (new_state) = indexShortOffAddr happyTable off_i




happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where (off) = indexShortOffAddr happyGotoOffsets st
         (off_i) = (off Happy_GHC_Exts.+# nt)
         (new_state) = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail 0# tk old_st _ stk@(x `HappyStk` _) =
     let (i) = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--	trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (action) sts stk =
--      trace "entering error recovery" $
	happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.