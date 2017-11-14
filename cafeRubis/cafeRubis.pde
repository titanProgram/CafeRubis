/*
  Name: Byron Farrell
  Student Number: C16503843
*/

ArrayList<Product> products;
ArrayList<Product> bill;



void setup()
{
  size( 800, 800 );  
}

void draw()
{
  
}

void loadData()
{
  Table table = loadTable( "products.csv", "header" );
  TableRow row;
  for( int i = 0; i < table.getRowCount(); i++ )
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
    println( row.getString( "Name" ) + " " + row.getString( "Price " ) );
  }
}