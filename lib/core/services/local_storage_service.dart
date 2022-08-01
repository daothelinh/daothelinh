import 'package:get_storage/get_storage.dart';
import 'package:login_ui_aicycle_seta/features/auth/data/models/auth_res.dart';
import '../../services/damage_types.dart';
import 'package:login_ui_aicycle_seta/services/damage_types.dart';

enum AppMode { testEngine, collectData }

class LocalStorageService {
  final GetStorage _getStorage = GetStorage();

  LocalStorageService();

  // remove all
  Future<void> removeAll() async {
    _getStorage.erase();
  }

  // Token
  String? get authToken {
    return _getStorage.read<String>(LocalDBConstant.token);
  }

  Future<void> saveAuthToken(String token) async {
    return _getStorage.write(LocalDBConstant.token, token);
  }

  Future<void> removeAuthToken() async {
    return _getStorage.remove(LocalDBConstant.token);
  }

  // users info
  Future<void> saveUserInfo(AssessorInfo user) async {
    return _getStorage.write(LocalDBConstant.user, user.toJson());
  }

  AssessorInfo? get userInfo {
    var json = _getStorage.read<Map<String, dynamic>?>(LocalDBConstant.user);
    if (json != null) {
      return AssessorInfo.fromJson(json);
    }
    return null;
  }

  Future<void> removeCurrentUser() async {
    return _getStorage.remove(LocalDBConstant.user);
  }

  // Mode 0 is Test engine mode
  // 1 is data collection mode
  Future<void> saveMode(AppMode mode) async {
    if (mode == AppMode.testEngine) {
      return _getStorage.write(LocalDBConstant.mode, 0);
    } else {
      return _getStorage.write(LocalDBConstant.mode, 1);
    }
  }

  AppMode? get mode {
    var modeInt = _getStorage.read(LocalDBConstant.mode);
    if (modeInt == 0) {
      return AppMode.testEngine;
    } else {
      return AppMode.collectData;
    }
  }

  Future<void> removeMode() async {
    return _getStorage.remove(LocalDBConstant.mode);
  }

  Future<void> saveDamageTypes(List<DamageTypes> types) async {
    return _getStorage.write(
        LocalDBConstant.damageTypes, types.map((e) => e.toJson()).toList());
  }

  List<DamageTypes> get damageTypes {
    var json = _getStorage
        .read<List<Map<String, dynamic>>>(LocalDBConstant.damageTypes);
    if (json != null) {
      return List<DamageTypes>.from(
          json.map((e) => DamageTypes.fromJson(e)).toList());
    }
    return [];
  }
}

class LocalDBConstant {
  LocalDBConstant._();

  static const String token = 'token';
  static const String user = 'current-user';
  static const String mode = 'app-mode';
  static const String damageTypes = 'damage-types';
}
