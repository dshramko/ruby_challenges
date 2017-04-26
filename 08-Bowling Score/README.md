## Bowling score

 Programming challenge for counting the score in a bowling game. 
 
 **Description**

One game of bowling consists of 10 frames.
Each frame consists of 2 chances to knock down 10 pins. Knocking down all 10 pins on the first roll of the frame is called a strike. If you get a strike, the frame is finished, and you are awarded 10 points (for the number of pins you knocked down) plus a point for each pin you knock down with your two next rolls.
A spare happens when you knock down all 10 pins, but it takes you both tries. In this case, your score for the frame is 10 plus the number of pins you knock down with your one next roll.
In all other cases, your score for the frame is the number of pins you knock down. 

*Extra rolls*

If you bowl a strike in the last frame, you are awarded two extra rolls.
Bowling a spare in the last frame (first two rolls add up to 10) gets you one extra roll.
In both of these cases, your net score for the last frame is the total number of pins you knocked down.

**Inputs & Outputs**

*Input description*

Your input will consist of an array defining a (valid) game of bowling.
Each element will represent the number of pins knocked down by the roll.

*Output description*  

Output should be the total score for the game  


**Notes/Hints**

* More explanations and examples could be found on [wikipedia](https://en.wikipedia.org/wiki/Ten-pin_bowling#Scoring)
