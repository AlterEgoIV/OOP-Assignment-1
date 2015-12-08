class Menu
{ 
  boolean inMenu;
  PImage banner = loadImage("banner.png");
  
  Menu()
  {
    inMenu = false;
    banner.resize(width, height / 5);
  }
  
  void display()
  { 
    inMenu = true;
    fill(255);
    stroke(255, 215, 0);
    strokeWeight(4);
    image(banner, 0, 0);
    fill(255);
    textSize(width / 25);
    textAlign(CENTER);
    fill(255, 0, 0);
    rect(0, height / 5, width / 4, height / 10);
    rect(0, (height / 5) * 1.5, width / 4, height / 10);
    fill(255);
    text("Barchart", width / 8, height / 5 * 1.35);
    text("Bubblechart", width / 8, height / 5 * 1.85); 
  }
  
  void changeDisplay()
  {
    textSize(width / 50);
    
    if(mouseX < width / 4 && mouseY < (height / 5) + (height / 10) && mouseY > height / 5)
    {
      inMenu = false;
      background(0);
      barchart.display();
    }
    
    if(mouseX < width / 4 && mouseY < (height / 5) * 2 && mouseY > (height / 5) + (height / 10))
    {
      inMenu = false;
      background(0);
      bubblechart.display();
    }
  }
  
  void animateVisualisationButtons()
  {
    if(menu.inMenu)
    {
      if(mouseX < width / 4 && mouseY < (height / 5) + (height / 10) && mouseY > height / 5)
      {
        fill(255);
        rect(0, height / 5, width / 4, height / 10);
        fill(255, 0, 0);
        textSize(width / 25);
        text("Barchart", width / 8, height / 5 * 1.35);
      }
      else
      {
        fill(255, 0, 0);
        rect(0, height / 5, width / 4, height / 10);
        fill(255);
        textSize(width / 25);
        text("Barchart", width / 8, height / 5 * 1.35);
      }
      
      if(mouseX < width / 4 && mouseY < (height / 5) * 2 && mouseY > (height / 5) + (height / 10))
      {
        fill(255);
        rect(0, (height / 5) * 1.5, width / 4, height / 10);
        fill(255, 0, 0);
        textSize(width / 25);
        text("Bubblechart", width / 8, height / 5 * 1.85);
      }
      else
      {
        fill(255, 0, 0);
        rect(0, (height / 5) * 1.5, width / 4, height / 10);
        fill(255);
        textSize(width / 25);
        text("Bubblechart", width / 8, height / 5 * 1.85);
      }
    }
  }
}
