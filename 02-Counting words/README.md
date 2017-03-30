## Counting words

Given a file, read it and parse the data.

 **Description**

 * Read the prophet.txt file and display a count of the most commonly used words in the document.
 * Output should consist of a Hash - key-value pair of the word and its word count.
 * Output should be case insensitive
 * Limit a number of commonly used words to show.

**Inputs & Outputs**

*Input description*

Input is a string with filename. Example of file content
*"This is a cat. The cat is black"*

*Output description*

Output is a hash of most common words in key, and count number in value

 `
 { "is": 2, "cat": 2, "this": 1, "a": 1, "the": 1, "black": 1 }
 `

or with stop words filter

 `
 { "cat": 2, "black": 1 }
 `

**Notes/Hints**

* Add a filter to get rid of common words as ("a", "the", "is", etc). Such common words are called stop-words. [Here](https://code.google.com/archive/p/stop-words) is collection of stop words in 29 languages, which can be used to build a stop-words array.