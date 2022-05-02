# Knights-Travails #

A program that finds the shortest path for a knight between two positions
on a chess board. This project was created as part of the curriculum from
[The Odin Project](theodinproject.com).

## Notes ##

This proved be one of the most conceptually difficult projects so far. I spent 
a lot of time thinking through how to create and utilize the board, and how to 
make the knight keep track of all its possible moves from a given positin. 

I initially tried using directional methods that pointed to different nodes, which
proved to lead to a loop that eventually crashed my computer. After that mistake,
I experimented a bit with simpler boards focused on coordinates. My eventual 
solution doesn't use any formal board at all, but I've kept the relics of that 
code because I believe I will need something like it when creating another project
incorporating chess later on. 

The final working version creates a knight at the starting position, which maps 
out all the possible moves the piece could take from that position. From there
it uses a breadth-first algorithm to check all the possible positions for a 
match, and, if it does not find one, it adds the moves to a queue to generate 
their possible moves and check for a match from each of them. This process loops
until a match to the desired destination is found, and its uses a parent attribute
to trace the path back to the origin, pushing each position on this path into an
array that is returned to complete the program.

## Resources ##

<https://www.theodinproject.com/lessons/ruby-knights-travails>