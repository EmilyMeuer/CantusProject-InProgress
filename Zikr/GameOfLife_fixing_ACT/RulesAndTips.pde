/*  *** RULES AND ALGORITHMS ***
 *
 *
 *            Rules:
 * 1. Any dead cell with exactly 3 dead neighbors becomes alive.
 * 2. Living cells with less than 2 living neighbors die.
 * 3. Living cells with more than 3 living neighbors die.
 * 4. Living cells with 2 or 3 living neighbors continue to live.
 *
 *
 *          Algorithms:
 * Two arrays are declared (one of which will serve as the old
 * copy of the other). They are declared as global variables. Then
 * the board will be initially drawn without making use of an array,
 * in the setup. Next, in draw, two functions will be called which
 * counts the living and dead neighbor cells respecively while
 * counting through a nested 'for' loop. This loop counts down each
 * column of the game board. At each new cell, using the functions
 * and the rules, a '1' (living) or a '0' (dead) is kept in the 
 * newboard array. The newboard array is then copied to oldboard,
 * and newboard is drawn and colored accordingly.
 * On the next click, the loops count through the oldboard array to
 * look for living and dead neighbors. This is recorded in the
 * newboard array. The process then repeats.
 *
 * The array keeps values in 1s but draws in 10s
 * so i=2 corresponds to the block drawn at i=20 to i=30
 *
 * By having a screen size of (1000, 1000) and each box being
 * 10 pixels by 10 pixels, the array is 1000/10 = 100 by 100.
 *
 */