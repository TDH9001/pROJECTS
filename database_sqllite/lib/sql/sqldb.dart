import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";

class sqldb {
  static Database? _db;
  //the database that is inicilized an sued ont he app
  Future<Database?> get db async {
    // the flutter getter used with private members
    if (_db == null) {
      // if i have not used it before > fetches the database
      _db = await initDb();
    } else {
      //if i did fetch it already > pass it
      return _db;
    }
    return _db;
  }

//this function inicilizes the database > either returniong it from the path given
//>or making a dffresh on eif the app ahs not been used before
  initDb() async {
    String databasePath =
        await getDatabasesPath(); //gets the path of the DB stored on this app
    String path =
        join(databasePath, "note.db"); // corrects the path to make it usable
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    // the one that passes the databse itself by either > fetching or creating
    return mydb;
  }

  //the functiont aht create sthe database that we use
  _onCreate(Database db, int version) async {
    //creation of my sql database
    await db.execute("""
    CREATE TABLE "notes"(
      "id" integer primary key autoincrement not null,
      "note" TEXT NOT NULL 
    )
  """);
    //jsut making sure the code runs or not> no try{}catch(e){} here
    print("CREATED DB ");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {}

//FUNCTIONALITY
//NOTE:  the int return of the non-select operations > returns the number of row affected

//select
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> ans = await mydb!.rawQuery(sql);
    return ans;
  }

  //inserrt
  insertData(String sql) async {
    Database? mydb = await db;
    int ans = await mydb!.rawInsert(sql);
    return ans;
  }

  //delete
  deleteData(String sql, List<String> x) async {
    Database? mydb = await db;
    int ans = await mydb!.rawDelete(sql, x);
    return ans;
  }

  //update data
  updateData(String sql, List<String> x) async {
    Database? mydb = await db;
    int ans = await mydb!.rawUpdate(sql, x);
    return ans;
  }
}
