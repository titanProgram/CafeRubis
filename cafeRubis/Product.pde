class Product
{
  // DATA
  String name;
  float price;
  
  // CONSTRUCTOR
  Product( TableRow row )
  {
    this.name = row.getString( "Name" );
    this.price = row.getFloat( "Price" );
  }
}