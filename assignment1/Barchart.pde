class Barchart extends Visualisation
{
  float barWidth;
  float barHeight;
  
  // Goals scored / number of games
  ArrayList<Float> goalsScoredPerGame;
  
  Barchart()
  {
    // The width of each bar is the horizontal graph length / number of seasons
    barWidth = horiGraphLength / season.size();
    barHeight = 0.0f;
    goalsScoredPerGame = new ArrayList<Float>();
    
    calcGoalsPerGame();
  } 
  
  void calcGoalsPerGame()
  {
    for(int i = 0; i < season.size(); i++)
    {
      goalsScoredPerGame.add(season.get(i).scored / season.get(i).played);
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
      if(goalsScoredPerGame.get(i) > maxValue)
      {
        maxValue = goalsScoredPerGame.get(i);
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
        barHeight = map(goalsScoredPerGame.get(i), 0, maxValue, 0, vertGraphLength);
        
        /*
          Extra 3 spacing aligns years properly
          Extra 20 spacing at end drops the years down a bit - looks neater
        */
        fill(255);
        textAlign(BASELINE);
        
        // Draw horizontal axis values
        text(round(season.get(i).year), horiBorder + x + 3, (height - vertBorder) + vertSmallLineLength + 20);
        
        // Draw bars
        colour = (int)map(barHeight, 0, vertGraphLength, 0, 255);
        fill(colour, 0, 0);
        rect(horiBorder + x, (height - vertBorder) - barHeight, barWidth, barHeight);
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
        text("Goals Scored per Game", 0, 0);
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
      x += barWidth;
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
      if(mouseX > 0 && mouseY > 0 && mouseX < barchart.horiBorder && mouseY < barchart.vertBorder / 2)
      {
        // Mouse hover colours
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
