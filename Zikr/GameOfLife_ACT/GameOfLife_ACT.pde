/*
 * Amanda Tenhoff
 * Emily Meuer
 * Game of Life
 * 6/19/2016
 * translation from JavaScript to Processing
 *
 
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
      if (i==width/2 && (j>=height/2-10) &&j<=height/2+10)
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
  if (mousePressed)
  {
    //int[][] board = new int[width/10][height/10]; //I feel that this
    //may be of use
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
            stroke(0);
            fill(liveColor);
            rect(i, j, 10, 10);
          }//if dead
          else
          {
            stroke(0);
            fill(deadColor);
            rect(i, j, 10, 10);
          }//else dead
        }//if get

        else if (get(i+5, j+5) == liveColor)  //dealing with the living
        {
          if (liveCount<2)
          {
            stroke(0);
            fill(deadColor);
            rect(i, j, 10, 10);
          } else if (liveCount>2 && liveCount<4)
          {
            stroke(0);
            fill(liveColor);
            rect(i, j, 10, 10);
          } else if (liveCount>3)
          {
            stroke(0);
            fill(deadColor);
            rect(i, j, 10, 10);
          }
        }//else if alive
      }//for j
    }//for i
  }
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