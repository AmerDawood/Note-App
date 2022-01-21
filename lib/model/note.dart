class Note{
  late int id;
  late String name;
  // null  constructor
  Note();

  Note.fromMap(Map<String,dynamic>rowMap){
    id= rowMap['id'];
    name =rowMap['content'];

  }
  Map<String,dynamic>toMap(){
    Map<String,dynamic>map = Map<String,dynamic>();
    map ['name']=name;
    return map;
}

}