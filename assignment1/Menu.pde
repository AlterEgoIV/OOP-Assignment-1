class Menu
{ 
  boolean inMenu;
  
  Menu()
  {
    inMenu = false;
  }
  
  void display()
  { 
    inMenu = true;
    fill(255);
    stroke(255, 215, 0);
    strokeWeight(5);
    rect(0, 0, width, height / 5);
    fill(0);
    textSize(width / 25);
    textAlign(CENTER);
    text("Menu", width / 2, height / 10);
    fill(255, 0, 0);
    rect(0, height / 5, width / 4, height / 5);
    fill(0, 190, 255);
    rect(width / 2, height / 5, width, height);
    fill(0);
    text("Graph 1", width / 4, height / 2);
    fill(0);
    text("Graph 2", width - (width / 4), height / 2);
    
    
  }
  
  void changeDisplay()
  {
    textSize(width / 50);
    
    if(mouseX < width / 2 && mouseY > height / 5)
    {
      inMenu = false;
      background(0);
      barchart.display();
    }
    
    if(mouseX > width / 2 && mouseY > height / 5)
    {
      inMenu = false;
      background(0);
      bubblechart.display();
    }
  }
}
