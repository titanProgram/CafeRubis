/*
  Name: Byron Farrell
  Student Number: C16503843
*/

ArrayList<Product> products = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();


int textSize = 14;

void setup()
{
  size( 500, 500 );
  
  loadData();
  printProducts();
}

void draw()
{
  if ( frameCount % 10 == 0 )
  {
    textAlign( "Cafe Rubis Till System", 
    displayProducts();
    displayBill();
  }
}

void loadData()
{
  Table table = loadTable( "products.csv", "header" );
  TableRow row;
  for ( int i = 0; i < table.getRowCount(); i++ )
  {
    row = table.getRow(i);
    products.add( new Product( row ) );
  }
}

void printProducts()
{
  Table table = loadTable( "products.csv", "header" );
  TableRow row;
  for( int i = 0; i < table.getRowCount(); i++ )
  {
    row = table.getRow(i);
    println( row.getString( "Name" ) + " " + row.getString( "Price" ) );
  }
}

void displayProducts()
{
  int count = 0;
  float boxHeight;
  float boxWidth;
  float margin = height / 20;
  
  textAlign( CENTER,CENTER );
  
  // Counting how many elements are in the ArrayList products
  for ( Product product : products )
  {
    count++;
  }
  
  boxHeight = ( height - ( margin * count + ( margin ) ) ) / count;
  boxWidth = width / 3;

  float i = margin;
  for ( Product product : products )
  {
    fill(255);
    rect( margin, i, boxWidth, boxHeight );
    fill(0);
    text( product.name, margin + ( boxWidth / 2 ), i + ( boxHeight / 2 ) );
    
    // checking if user clicked on a product
    if ( mousePressed && mouseX < margin + boxWidth && mouseX > margin && mouseY < i + boxHeight && mouseY > i )
    {
      bill.add( product );
      println( product.name );
    }
    
    i += boxHeight + margin;
    
  }
}

void displayBill()
{
  textSize( textSize );
  float margin = height / 20;
  float boxWidth = width / 2;
  float boxHeight = height - ( margin * 2 );
  float textSpacing = margin * 2;
  float total = 0;
  fill( 255 );
  rect( width - ( boxWidth + margin ), margin, boxWidth, boxHeight );
  
  textAlign( CENTER, CENTER );
  fill( 0 );
  text( "Your Bill", width - ( ( boxWidth / 2 ) + margin ), margin + textSize );
  
  for ( Product product : bill )
  {
    textAlign( LEFT );
    text( product.name, width - ( boxWidth + margin - textSize ), textSpacing + margin );
    textAlign( RIGHT );
    text( product.price, width - ( margin + textSize ), textSpacing + margin );
    
    textSpacing += textSize;
    total += product.price;
  }
  textAlign( LEFT );
  text( "Total", width - ( boxWidth + margin - textSize ), textSpacing + margin );
  textAlign( RIGHT );
  text( total, width - ( margin + textSize ), textSpacing + margin );
}