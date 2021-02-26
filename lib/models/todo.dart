class Todo {
  int id;
  String name;
  String description;

  Todo({this.name, this.description});
  Todo.withId({this.id, this.name, this.description});

  //Kaynak videodan yararlanıldı.(BTK flutter eğitimi)
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["description"] = description;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  //Kaynak videodan yararlanıldı.(BTK flutter eğitimi)
  Todo.fromObject(dynamic o) {
    this.id = o["id"];
    this.name = o["name"];
    this.description = o["description"];
  }
}