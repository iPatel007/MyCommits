import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_git_commit/helper/constant.dart';
import 'package:my_git_commit/home/model/commite_model.dart';

class HomePageService {
  Future<ListCommitHistoryModel> getCommitHistory() async {
    print('===>> URL : $GitURL');
    return http.get(GitURL).then((response) {
      List<Map<String, dynamic>> _resList =
      List<Map<String, dynamic>>.from(json.decode(response.body));
      print('===>> Response : $_resList');
      return Future.value(ListCommitHistoryModel.fromJson(_resList ?? []));
    });
  }
}
