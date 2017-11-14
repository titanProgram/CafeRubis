/*
  Name: Byron Farrell
  Student Number: C16503843
*/

ArrayList<Product> products = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();



void setup()
{
  size( 500, 500 );
  
  loadData();
  printProducts();
}

void draw()
{
displayProducts();  
  
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
  //println(boxHeight);
  boxWidth = width / 3;
  //println(boxWidth);
  /*for ( float i = margin; i < height; i += boxHeight + margin )
  {
    fill(255);
    rect( margin, i, boxWidth, boxHeight );
    
  }*/
  float i = margin;
  for ( Product product : products )
  {
    fill(255);
    rect( margin, i, boxWidth, boxHeight );
    fill(0);
    text( product.name, margin + ( boxWidth / 2 ), i + ( boxHeight / 2 ) );
    i += boxHeight + margin;
  }
  
}