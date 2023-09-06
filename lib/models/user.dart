class User {
  int id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  User(this.id, {this.email, this.first_name, this.last_name, this.avatar});

  factory User.fromJson(Map<String, dynamic> data) => User(data['id'],
      email: data['email'],
      first_name: data['first_name'],
      last_name: data['last_name'],
      avatar: data['avatar']);

  Map<String, dynamic> toJson() => {
    'id' : id, 
    'email' : email ?? "", 
    'first_name' : first_name ?? "", 
    'last_name' : last_name ?? "", 
    'avatar' : avatar ?? ""
  };
}
