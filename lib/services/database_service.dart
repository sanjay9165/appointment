import 'package:appointment/utilities/common_exports.dart';

class DatabaseService {
  factory DatabaseService() => _singleton;

  static final DatabaseService _singleton = DatabaseService._internal();
  late String _dbName;
  late String _tableName;
  late Database _db;

  DatabaseService._internal();

  // Initialise DatabaseName and TableName
  Future<void> initialiseApp() async {
    await dotenv.load(fileName: ".env");
    _dbName = (dotenv.env['DB_NAME'] ?? "");
    _tableName = (dotenv.env['TABLE_NAME'] ?? "");
  }

  // Open Database and Create Table if it is not present
  Future<void> getDatabase() async {
    try {
      final String databaseDirPath = await getDatabasesPath();
      final String databasePath = join(databaseDirPath, _dbName);
      _db = await openDatabase(
        version: 1,
        databasePath,
        onCreate: (db, version) => db.execute(
            'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY,name TEXT NOT NULL,dateOfBirth TEXT NOT NULL,gender TEXT NOT NULL,purpose TEXT NOT NULL)'),
      );
    } catch (e) {
      log("ERROR ON CREATE: $e");
    }
  }

  // Insert Appointment data into Database
  Future<bool> insertAppointment({required Appointment appointment}) async {
    try {
      int result = await _db.insert(_tableName, appointment.toJson());
      return result == 0 ? false : true;
    } catch (e) {
      log("ERROR ON INSERT: $e");
    }
    return false;
  }

  // Retrive all appointments from Database
  Future<List<Appointment>?> getAppointment() async {
    try {
      List<Map<String, Object?>> result = await _db.query(_tableName);
      return result
          .castToListOfMapOfStringDynamic()
          .map((e) => Appointment.fromJson(e))
          .toList();
    } catch (e) {
      log("ERROR ON FETCH: $e");
    }
    return null;
  }

  // Delete an Appointement based on id
  Future<bool> deleteAppointment({required int id}) async {
    try {
      int result =
          await _db.delete(_tableName, where: 'id = ?', whereArgs: ['$id']);
      return result == 0 ? false : true;
    } catch (e) {
      log("ERROR ON DELETE AN APPOINTMENT: $e");
    }
    return false;
  }

  //Update  Appointment data into Database
  Future<bool> updateAppointment({required Appointment appointment}) async {
    try {
      int result = await _db.update(_tableName, appointment.toJson(),
          where: 'id = ?', whereArgs: ['${appointment.id}']);

      return result == 0 ? false : true;
    } catch (e) {
      log("ERROR ON UPDATE APPOINTMENT: $e");
    }
    return false;
  }
}
