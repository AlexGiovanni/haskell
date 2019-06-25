-- Alexis Santiago haskell practice
{-This is a multiline coment-}
import Data.List
import System.IO 

--Int -2^63 2^63 maxInt is a function
maxInt = maxBound :: Int
minInt = minBound :: Int
--int, float, double
bigFloat = 3.99999999999 + 0.00000000005
--Bool, Char, Tuple
sumOfNums = sum [1..1000]
--mod
modEx = mod 5 4
modEx2 = 5`mod`4
negNumEx = 5+(-4)--use () for negative numbers
num9 = 9 :: Int--create an integer
sqrtOf9 = sqrt(fromIntegral num9)--converts to float for sqrt
--built in math functions
piVal = pi
ePow9 = exp 9
logOf9 = log 9
squared9 = 9 ** 2
truncateVal = truncate 9.999
roundVal = round 9.999
ceilingVal = ceiling 9.999
floorVal = floor 9.999
--Also sin, cos, tan, asin, atan, acos, sinh
--tanh, cosh, asinh, atanh, acosh
--true false
trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)
--list
primeNumbers = [3,5,7,11]
morePrimes = primeNumbers ++ [13, 17, 19, 23, 29]{- ++concatonates to list-}
favNums = 2:7:21:66:[]
multList = [[3,5,7],[11,13,17]]--list inside list
morePrimes2 = 2 : morePrimes--adds 2 to front of morePrimes
lenPrime = length morePrimes2
revPrime = reverse morePrimes2
isListEmpty = null morePrimes2
secondPrime = morePrimes2 !! 1--gets index
firstPrime = head morePrimes2--returns first element
lastPrime = last morePrimes2--returns last element
primeInit = init morePrimes2--prints everithing but last
first3Primes = take 3 morePrimes2--prints first 3
removedPrimes = drop 3 morePrimes2--prints everithing but first 3
is7InList = 7 `elem` morePrimes2
maxPrime = maximum morePrimes2--bigest in list
minPrime = minimum morePrimes2--smallest in list
newList = [2,3,5]
prodPrimes = product newList
zeroToTen = [0..10]
evenList = [2,4..20]
letterList = ['A', 'C'..'Z']--generates every other letter
infinPow10 = [10,20..]--infinite list not created untill nedded index
many2s = take 10 (repeat 2)
many3s = replicate 10 3--generates 10 3's
cycleList = take 10 (cycle [1,2,3,4,5])--repeates items 10 places
listTimes2 = [x*2 | x<-[1..10]]--multiplies items times two
listTimes3 = [x*3 | x<-[1..10], x*3 <=50]--multiplies items times 3 untill <=50
divisBy9N13 = [x | x <- [1..500], x`mod`13 == 0, x`mod`9==0]--values divisible by 13 or 9
sortedList = sort [9,1,8,3,4,7,6]
sumOfList = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]--adds by index and creates list
--tuples
randTuple = (1,"random tuple")
bobSmith = ("Bob Smith", 52)
bobsName = fst bobSmith
bobsAge = snd bobSmith
names = ["Bob", "Mary", "tom"]
addresses = ["123 Main", "234 North", "567 South"]
namesNAddress = zip names addresses--joins names with addresses
--functions
-- in ghci
{-
let num7 = 7
let getTriple x = x * 3
getTriple num7
-}
{- ghc --make haskell------------------------how to compile main
./haskell or haskell.exe in windows
-}
{-
main = do--do chains commands and puts them in main
  putStrLn "What's yourn name"
  name <- getLine
  putStrLn ("Hello "++ name)
-}
-- funcName param1 param2 = operations (returned value)
-- first :r then :t addMe (:t is type declaration binding)
addMe :: Int -> Int -> Int--define it to work with integers
addMe x y = x + y

sumMe x y = x + y--can work with integers and float
addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)--define to work with tuples
addTuples (x, y) (x2, y2) = ( x+x2, y+y2)

whatAge :: Int -> String
whatAge 16 ="You can Drive"
whatAge 18 ="You can vote"
whatAge 21 ="You're an adult"
whatAge x = "Nothing Important" --could use x or _

--recursion
factorial :: Int -> Int--function takes int prints int
factorial 0 = 1
factorial n = n * factorial (n-1)

prodFact n = product[1..n]--factorial using list
-- if statement conditional
isOdd :: Int -> Bool--takes int print bool (| is guard)
isOdd n 
  | n `mod` 2 == 0 = False
  |otherwise = True

isEven n = n `mod` 2 == 0--shorter way

whatGrade :: Int ->String
whatGrade age 
  | (age >= 5) && (age<=6) = "kindergarten"
  | (age >= 6) && (age<=10) = "Elementary School"
  | (age >= 10) && (age<=14) = "Middle School"
  | (age >= 14) && (age<=18) = "High School"
  |otherwise = "Go to College"

--where is used to avoid multiple calculations of the same numbers
batAvgRating :: Double -> Double -> String
batAvgRating hits atBats
  |avg <= 0.200 = "Terrible Batting Average"
  |avg <= 0.250 = "Average Player"
  |avg <= 0.280 = "Your dong pretty good"
  |otherwise = "You're a Superstar"
  where avg = hits / atBats

--accesing items in a list(call it with getListItems [1,2])
getListItems :: [Int] -> String
getListItems [] = "Your list is empty"
getListItems (x:[]) = "Your list starts with "++ show x--get first item
getListItems (x:y:[]) = "Your list contains "++ show x ++ " and "++show y--get first two
getListItems (x:xs) = "The 1st item is "++ show x ++" and the rest are "++show xs --xs is the rest of items

--accesing a letter in a string
getFirstItem :: String -> String
getFirstItem [] ="Empty String"
getFirstItem all@(x:xs) = "The first letter in "++all++" is "++[x]

--higher order functions------------------------------------------
--map loops trough list applying function
times4 :: Int -> Int
times4 x = x*4
listTimes4 = map times4[1..5]

--make map to se how it works
multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs

--functions to check if strings are equal recursively
areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True --([]is empty list)
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys --pass remainding letters
areStringsEq _ _ = False --(_ for anything that isnt a list item)

--pass function into function
doMult :: (Int -> Int)-> Int --(Int -> Int) means it expects a function that takes int and outputs int
doMult func = func 3--(3 is parameter of func)
num3Times4 = doMult times4--value is stored in num3Times4

-- return a function example
getAddFunc :: Int-> (Int->Int)
getAddFunc x y = x+y
adds3 = getAddFunc 3
fourPlus3 = adds3 4--using function stored in adds3

--ones = 1:ones
--fibonacci 
fib = 1:1:[a+b|(a,b)<-zip fib(tail fib)]
fib300 = fib !! 300









