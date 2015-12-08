class Bubblechart extends Visualisation
{
  float colWidth;
  float pointHeight;
  float radius;
  
  // Goals conceded / number of games
  ArrayList<Float> goalsConcededPerGame;
  
  Bubblechart()
  {
    colWidth = horiGraphLength / season.size();
    pointHeight = 0.0f;
    radius = 0.0f;
    
    maxValue = 0.0f;
    goalsConcededPerGame = new ArrayList<Float>();
    
    calcGoalsConcededPerGame();
  } 
  
  void calcGoalsConcededPerGame()
  {
    for(int i = 0; i < season.size(); i++)
    {
      goalsConcededPerGame.add(season.get(i).conceded / season.get(i).played);
    }
  }
  
  void display()
  {
    stroke(255);
    strokeWeight(1);
    
    // Menu button
    fill(255, 0, 0);
    rect(0, 0, horiBorder, vertBorder / 2);
    fill(255);
    textAlign(CENTER);
    text("Menu", horiBorder / 2, vertBorder / 3);
    
    // Calculate max value from ArrayList to map range
    for(int i = 0; i < season.size(); i++)
    {
      if(goalsConcededPerGame.get(i) > maxValue)
      {
        maxValue = goalsConcededPerGame.get(i);
      }
    }
    
    // Assigns biggest value in array / 10 as there are 10 vertical points
    vertPointValue = maxValue / 10;
    
    for(int i = 0; i <= season.size(); i++)
    {    
      // Horizontal line
      textSize(width / 50);
      textAlign(CENTER);
      fill(255);
      text("Seasons", width / 2, height - (vertBorder / 4));
      
      textSize(width / 100.0f);
      line(horiBorder, height - vertBorder, horiBorder + x, height - vertBorder);
      line(horiBorder + x, (height - vertBorder), horiBorder + x, (height - vertBorder) + vertSmallLineLength);
      
      // Out of bounds error without if() statement
      if(i < season.size())
      {
        // Map Range
        pointHeight = map(goalsConcededPerGame.get(i), 0, maxValue, 0, vertGraphLength);
        
        /*
          Extra 3 spacing aligns years properly
          Extra 20 spacing at end drops the years down a bit - looks neater
        */
        fill(255);
        textAlign(BASELINE);
        text(round(season.get(i).year), horiBorder + x + 3, (height - vertBorder) + vertSmallLineLength + 20);
        
        // Draw bubbles
        radius = (goalsConcededPerGame.get(i) * colWidth) / 2;
        colour = (int)map(pointHeight, 0, vertGraphLength, 0, 255);
        fill(colour, 0, 0);
        ellipse(horiBorder + radius + x, (height - vertBorder) - pointHeight, radius * 2, radius * 2);
        fill(255);
        textAlign(CENTER);
        
        // Draw horizontal axis values
        text(round(season.get(i).year), horiBorder + x + radius, (height - vertBorder) - pointHeight);
      }
      
      /*
        Increments of y points are sufficiently bigger than increments of x points that to draw the 
        entire vertical line the points need only be drawn half as many times as there are elements in the ArrayList.
      */
      if(i < season.size() / 2)
      {
        // Converts vertPointValue to string with 2 decimal places
        tempS = nf(vertPointValue, 1, 2);
        // Assigns vertPointValue tempS as float
        vertPointValue = float(tempS);
        
        // Allows text to be drawn sideways
        pushMatrix();
        translate(horiBorder / 3, height / 2);
        rotate(-HALF_PI);
        textSize(height / 50);
        textAlign(CENTER);
        fill(255);
        text("Goals Conceded per Game", 0, 0);
        popMatrix();
        
        // Vertical line
        textSize(width / 100.0f);
        line(horiBorder, height - vertBorder, horiBorder, (height - vertBorder) - y);
        line(horiBorder - horiSmallLineLength, (height - vertBorder) - y, horiBorder, (height - vertBorder) - y);
        
        fill(255);
        textAlign(BASELINE);
        
        // Draw vertical axis values
        text(Float.toString(vertPointValue * i), horiBorder - horiSmallLineLength - 25, (height - vertBorder) - y);
      } 
      
      // Increment coordinates being drawn to
      x += colWidth;
      y += vertPoints;
    }
  }
  
  void changeDisplay()
  {
    textSize(width / 50);
    
    if(mouseX < horiBorder && mouseY < vertBorder / 2)
    {
      background(0);
      menu.display();
    }
  }
  
  void animateMenuButton()
  {
    if(!menu.inMenu)
    {
      // Mouse hover colours
      if(mouseX > 0 && mouseY > 0 && mouseX < barchart.horiBorder && mouseY < barchart.vertBorder / 2)
      {
        fill(255);
        rect(0, 0, barchart.horiBorder, barchart.vertBorder / 2);
        fill(255, 0, 0);
        textSize(width / 50);
        text("Menu", barchart.horiBorder / 2, barchart.vertBorder / 3);
      }
      else
      {
        // Default colours
        fill(255, 0, 0);
        rect(0, 0, barchart.horiBorder, barchart.vertBorder / 2);
        fill(255);
        textSize(width / 50);
        text("Menu", barchart.horiBorder / 2, barchart.vertBorder / 3);
      }
    }
  }
}
