import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_git_commit/home/model/commite_model.dart';

class MyProfileService {
  Future<CommitHistoryModel> getCommitHistory() async {
    String _url = '';
    print('===>> URL : $_url');
    return http.get(_url).then((response) {
      Map<String, dynamic> _resDic =
      Map<String, dynamic>.from(json.decode(response.body));
      print('===>> Response : $_resDic');
      return Future.value(CommitHistoryModel.fromJson(_resDic));
    });
  }
}
