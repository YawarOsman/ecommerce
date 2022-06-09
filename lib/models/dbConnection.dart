import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mongo_dart/mongo_dart.dart';

class DbCon {
  Db? db;
  void connection() async {
    final conStr = dotenv.env['CON_STR'];
    print(conStr);
    db = await Db.create(conStr!);
    await db!.open();
    print('connection was successful');
  }

  void closeCon() async {
    db!.close();
  }
}
