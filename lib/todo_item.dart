import 'package:floor/floor.dart';

@entity
class todo_item{

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String itemName;
  //final String dateCreated;

  todo_item(this.id, this.itemName);
}

