class UserModel {
    UserModel({
        this.id,
        this.name,
        this.email,
        this.pass,
    });

    int id;
    String name;
    String email;
    String pass;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        pass: json["pass"],
    );

    Map<String, dynamic> toJson() => {
      // NO SE DEBERIA MANDAR EL ID, ESTE DEBE SER AUTOGENERADO
        "name": name,
        "email": email,
        "pass": pass,
    };
}
