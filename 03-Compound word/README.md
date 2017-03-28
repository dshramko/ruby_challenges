## The compound word

 Challenge in finding all possible occurrences of simple words in one compound word. 
 
 **Description**

Job is to find all occurrences of the word with all sub-words inside of it from given list of English words. Some example include:  
Some (3 words: me, om, so)  
Woman (5 words: an, ma, man, om, oman)  

**Inputs & Outputs**

*Input description*

Use a [list of English words](http://www-personal.umich.edu/~jlawler/wordlist) and a "minimum sub-word length" (the smallest length of a sub-word in a compound word).

*Output description*  

Must be array with number - count of occurrences as first alement, and all sub-words  
minSize 3: Something [6, "hin", "ing", "met", "some", "thin", "thing"]  
minSize 5: Operation [3, "opera", "ratio", "ration"]  


**Notes/Hints**

* Be aware the file is split by \r\n instead of \n, and has some empty lines at the end
