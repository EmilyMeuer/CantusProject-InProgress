/*
 * Amanda Tenhoff
 * Emily Meuer
 * Game of Life
 * 6/26/2016
 * translation from JavaScript to Processing
 * my good code is MIA and we have this now.
 *
 * right now I think the main problem is that it makes changes
 * and responds to those changes before looping through again
 * (i.e. a dead square becomes alive for round 2, but its neighbors
 * already take it to be alive)
 * what if I make deadCount and aliveCount store arrays
 * and then every instance of a "1" for each means they change color
 * and that won't happen until we're outside the for loop
 * I tried fixing this with an array but it still runs 4 times
 * and it always reaches an end iteration where it stops changing
 
 ***REFERENCES***
 liveColor (181, 0, 232)
 deadColor (255)
 making arrays: int[] <array_name>
 you can use get(i,j) to find the color of
 a rectangle at that spot probably? just in case
 I will do stroke the same color as fill
 (no instead I will do get(i+5, j+5))
 or you could use pixels[]
 
 color is a variable type
 
 */

color liveColor = color(181, 0, 232);
color deadColor = color(255);

int      tileSize;
int[][]  newboard;
int[][]  oldboard;
int i=0;
int j=0;

void setup()
{
  size(1000, 1000);
  tileSize = width/10;
  
  newboard = new int[tileSize][tileSize];
  oldboard = new int[tileSize][tileSize];
  println("oldboard.length is "+oldboard.length);
  
  seedRPentomino();  
}

void draw()
{
  if(keyPressed)
  {
    nextGeneration();
    delay(100);  //may want to shorten delay; seems laggy
  } // keyPressed
   //<>//
}//end of draw loop

void nextGeneration()
{
  for (i=0; i<oldboard.length; i++)
    {
      for (j=0; j<oldboard.length; j++)
      {
        int deadCount = getDeadCount(i, j);
        int liveCount = getAliveCount(i, j);

        if(i==(oldboard.length)/2 && j==(oldboard.length)/2)
        {
          println("dead is "+deadCount+" and alive is "+liveCount);
        }

        if (get(i*10+5, j*10+5)==deadColor)  //dealing with the dead :o
        {
          if (deadCount==3)
          {
            newboard[i][j] = 1;
          }//if dead
          else
          {
            newboard[i][j] = 0;
            //println("i is "+i+" and j is "+j);
          }//else dead
        }//if get

        else if (get(i*10+5, j*10+5) == liveColor)  //dealing with the living
        {
          if (liveCount<2 || liveCount>3)
          {
            newboard[i][j] = 0;
          } else if (liveCount>=2 && liveCount<4)
          {
            newboard[i][j] = 1;
          }
        }//else if alive
      }//for j
    }//for i
    for(i=0;i<oldboard.length;i++)
    {
      for(j=0;j<oldboard.length;j++)
      {
        if(newboard[i][j]==0)
        {
          oldboard[i][j]=0;
           stroke(0);
           fill(deadColor);
           rect(i*10,j*10,10,10);
        }
        else
        {
          oldboard[i][j]=1;
          stroke(0);
          fill(liveColor);
          rect(i*10,j*10,10,10);
        }
      }
    }
} // nextGeneration()

void seedRPentomino()
{
  for (i=0; i<oldboard.length; i++)
  {
    for (j=0; j<oldboard.length; j++)
    {
      if (i==(oldboard.length)/2 && (j>=(oldboard.length)/2-1) &&(j<=(oldboard.length)/2+1))
      {
        stroke(0);
        fill(liveColor);
        rect(i*10, j*10, 10, 10);
        oldboard[i][j]  = 1;
      } else if (j==(oldboard.length)/2-1 && i==(oldboard.length)/2+1)
      {
        stroke(0);
        fill(liveColor);
        rect(i*10, j*10, 10, 10);
        oldboard[i][j]  = 1;
      } else if (j==(oldboard.length)/2 && i==(oldboard.length)/2-1)
      {
        stroke(0);
        fill(liveColor);
        rect(i*10, j*10, 10, 10);
        oldboard[i][j]  = 1;
      } else
      {
        stroke(0);
        fill(deadColor);
        rect(i*10, j*10, 10, 10);
        oldboard[i][j]  = 0;
      }
    } // for - j
  }// for - i (drawing the initial board, R-pentomino)
} // seedRPentomino

int getDeadCount(int i, int j)
{
  int dead=0;
  int neigh, bors;
  for (neigh=i-1; neigh<i+2; neigh++)
  {
    for (bors=j-1; bors<j+2; bors++)
    {
      if ((get(neigh*10+5, bors*10+5) == deadColor) && neigh!=i && bors!=j && neigh>=0 && bors>=0)
      {
        dead++;
      }
    }
  }
  return dead;
}//dead count

int getAliveCount(int i, int j)
{
  int alive=0;
  int neigh, bors;
  for (neigh=i-1; neigh<i+2; neigh++)
  {
    for (bors=j-1; bors<j+2; bors++)
    {
      if ((get(neigh*10+5, bors*10+5) == liveColor) && neigh!=i && bors!=j && neigh>=0 && bors>=0)
      {
        alive++;
      }
    }
  }
  return alive;
}//live count