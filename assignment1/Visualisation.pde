/*
Abstract class used to hold data and functionality common to the
visualisations barchart and bubblechart.
Allows for polymorphic object instantiation providing common interface for 
all types of visualisations.
*/
abstract class Visualisation
{
  float x;
  float y;
  float horiBorder;
  float vertBorder;
  float horiGraphLength;
  float vertGraphLength;
  float vertPoints;
  float vertSmallLineLength;
  float horiSmallLineLength;
  float maxValue;
  float vertPointValue;
  int colour;
  String tempS;
  
  Visualisation()
  {
    x = 0.0f;
    y = 0.0f;
    horiBorder = width / 12.0f;
    vertBorder = height / 12.0f;
    horiGraphLength = width - (horiBorder * 2.0f);
    vertGraphLength = height - (vertBorder * 2.0f);
    vertPoints = vertGraphLength / 10.0f;
    vertSmallLineLength = height / 100.0f;
    horiSmallLineLength = width / 100.0f;
    maxValue = 0.0f;
    vertPointValue = 0.0f;
    colour = 0;
    tempS = "";
  }
  
  abstract void display();
  abstract void changeDisplay();
  abstract void animateMenuButton();
}
