# comb4
A perl program to discover and record all non-repeating four digit boggle rule compliant combinations possible in a 3x3 grid, and associated output.

comb4.pl is the program that generates comb4.txt. The program steps through the grid recording each combination possible without regard to repetition and filters out all dupes before writing to comb4.txt. The program prints intermediate results to the screen for troubleshooting.

comb4.txt is the output, simply a tab-separated listing of the 496 combinations.

The boggle rule, as it is used here, means that every selection must be adjacent to the previous selection - vertically, horizontally, or diagonally.

findem.pl is a perl program to discover and record the four letter words in a 3x3 grid containing nine letters. The program uses each four digit combination in comb4.txt to select a 'word' from the grid and compares each 'word' against a file containing roughly 3000 four-letter words. The grid and discovered words are displayed to the screen and written to a file
.
