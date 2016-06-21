/*
 * Amanda Tenhoff
 * Emily Meuer
 * Game of Life
 * 6/19/2016
 * translation from JavaScript to Processing
 *
 * right now I think the main problem is that it makes changes
 * and responds to those changes before looping through again
 * (ie. a dead square becomes alive for round 2, but its neighbors
 * already take it to be alive)
 * what if I make deadCount and aliveCount store arrays
 * and then every instance of a "1" for each means they change color
 * and that won't happen until we're outside the for loop
 
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

void setup()
{
  size(1000, 1000);
  int i, j;
  for (i=0; i<width; i=i+10)
  {
    for (j=0; j<height; j=j+10)
    {
      if (i==width/2 && (j>=height/2-10) &&(j<=height/2+10))
      {
        stroke(0);
        fill(liveColor);
        rect(i, j, 10, 10);
      } else if (j==height/2-10 && i==width/2+10)
      {
        stroke(0);
        fill(liveColor);
        rect(i, j, 10, 10);
      } else if (j==height/2 && i==width/2-10)
      {
        stroke(0);
        fill(liveColor);
        rect(i, j, 10, 10);
      } else
      {
        stroke(0);
        fill(deadColor);
        rect(i, j, 10, 10);
      }
    }
  }//drawing the initial board, R-pentomino
}

void draw()
{
  //int timer = millis();
  //if (timer%1000==0)
  if (mousePressed)
  {
    int[][] board = new int[width][height];
    int i, j;
    for (i=0; i<width; i=i+10)
    {
      for (j=0; j<height; j=j+10)
      {
        int deadCount = getDeadCount(i, j);
        int liveCount = getAliveCount(i, j);
        
        if(i==width/2 && j==height/2)
        {
          println("dead is "+deadCount+" and alive is "+liveCount);
        }

        if (get(i+5, j+5)==deadColor)  //dealing with the dead :o
        {
          if (deadCount==3)
          {
            board[i][j] = 1;
            //stroke(0);
            //fill(liveColor);
            //rect(i, j, 10, 10);
          }//if dead
          else
          {
            board[i][j] = 0;
            //stroke(0);
            //fill(deadColor);
            //rect(i, j, 10, 10);
          }//else dead
        }//if get

        else if (get(i+5, j+5) == liveColor)  //dealing with the living
        {
          if (liveCount<2 || liveCount>3)
          {
            board[i][j] = 0;
            //stroke(0);
            //fill(deadColor);
            //rect(i, j, 10, 10);
          } else if (liveCount>=2 && liveCount<4)
          {
            board[i][j] = 1;
            //stroke(0);
            //fill(liveColor);
            //rect(i, j, 10, 10);
          }
        }//else if alive
      }//for j
    }//for i
    for(i=0;i<width;i=i+10)
    {
      for(j=0;j<width;j=j+10)
      {
        if(board[i][j]==0)
        {
           stroke(0);
           fill(deadColor);
           rect(i,j,10,10);
        }
        else
        {
          stroke(0);
          fill(liveColor);
          rect(i,j,10,10);
        }
      }
    }
  }//if mouse/timer
}//end of draw loop

int getDeadCount(int i, int j)
{
  int dead=0;
  int neigh, bors;
  for (neigh=i-10; neigh<(i+20); neigh=neigh+10)
  {
    for (bors=j-10; bors<(j+20); bors=bors+10)
    {
      if ((get(neigh+5, bors+5) == deadColor) && neigh!=i && bors!=j)
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
  for (neigh=i-10; neigh<(i+20); neigh=neigh+10)
  {
    for (bors=j-10; bors<(j+20); bors=bors+10)
    {
      if ((get(neigh+5, bors+5) == liveColor) && neigh!=i && bors!=j)
      {
        alive++;
      }
    }
  }
  return alive;
}//live count