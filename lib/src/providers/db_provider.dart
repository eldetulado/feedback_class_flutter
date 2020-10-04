import 'dart:io';

import 'package:assets_img/src/models/user_model.dart';
export 'package:assets_img/src/models/user_model.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  static Database _dbusers;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  //METODOS GETTER PARA OBTENER LA INFORMACION DE LA PROPIEDAD PRIVADADA _dbuser
  Future<Database> get dbusers async {
    //Si la base de datos no esta vacio retorna la base de datos.
    if (dbusers != null) return dbusers;
    //de lo contrario no existe la base de datos
    _dbusers = await initDB();
    return _dbusers;
  }

  initDB() async {
    //Para inicializar una base de datos necesitamos un path para localizar la base de datos
    //*RECORDAR QUE IMPORTAMOS PATH PROVIDER
    //con esto tenemos la direccion del path
    Directory documentsDyrectory = await getApplicationDocumentsDirectory();

    //para que el join reconozca necesitamos importar path.path.dart
    //los parametros que recibe la direccion donde se encuentra la aplicacion y el nombre del archivo de la base de datos
    final path = join(documentsDyrectory.path, 'UsersDB.db');

    //como necesitamos retornar una base de datos
    //openDatabase en propio de sqflite
    return await openDatabase(path,
        //podemos tener una version de la base de datos
        version: 1,
        onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Users ('
          ' id INTEGER PRIMARY KEY,'
          ' nombre TEXT,'
          ' email TEXT,'
          ' pass TEXT'
          ')');
    });
  }

  //REGISTRO DE USUARIOS
  newUser(UserModel nuevoUsuario) async {
    final db = await dbusers;
    //proceso de insercion
    //el tojson se encarga de transformar el modelo en un mapa que se puede enviar en el insert
    final res = await db.insert('Users', nuevoUsuario.toJson());
    return res;
  }

  //OBTENER INFORMACION
  Future<List<UserModel>> getUser(String correo, String password) async {
    final db = await dbusers;
    final res = await db.rawQuery(
                  "SELECT * FROM Users WHERE email='$correo' AND pass='$password'"
                );
    List<UserModel> list =
        res.isNotEmpty ? res.map((e) => UserModel.fromJson(e)).toList() : [];
    return list;
  }
}
