
## Roman numerals converter

We pick the arabic numbers and covert them to their Roman numerals.
Numbers should be in range between 1 to 4999.

First, we need to write tests for various numbers, including "wrong" (out of range 1-4999).  
Then, implement method which returns right roman number  
Finnaly all tests should be "green"

#### About roman numeric system

The numbers 1 to 10 are usually expressed in Roman numerals as follows:

**I, II, III, IV, V, VI, VII, VIII, IX, X.**

Numbers are formed by combining symbols and adding the values, so II is two (two ones) and XIII is thirteen (a ten and three ones). Because each numeral has a fixed value rather than representing multiples of ten, one hundred and so on, according to position, there is no need for "place keeping" zeros, as in numbers like 207 or 1066; those numbers are written as CCVII (two hundreds, a five and two ones) and MLXVI (a thousand, a fifty, a ten, a five and a one).

Symbols are placed from left to right in order of value, starting with the largest. However, in a few specific cases, to avoid four characters being repeated in succession (such as IIII or XXXX), subtractive notation is used: as in this table:  

Number | 4 | 9 | 40 | 90 | 400 | 900 |  
-------|---|-- | ---|----|-----|---- |  
Notation | IV |	IX | XL | XC | CD | CM |  


* **I** placed before **V** or **X** indicates one less, so four is **IV** (one less than five) and nine is **IX** (one less than ten)
* **X** placed before **L** or **C** indicates ten less, so forty is **XL** (ten less than fifty) and ninety is **XC** (ten less than a hundred)
* **C** placed before **D** or **M** indicates a hundred less, so four hundred is **CD** (a hundred less than five hundred) and nine hundred is **CM** (a hundred less than a thousand 

More info about Roman numeric system can be found on [Wikipedia page](https://en.wikipedia.org/wiki/Roman_numerals)
