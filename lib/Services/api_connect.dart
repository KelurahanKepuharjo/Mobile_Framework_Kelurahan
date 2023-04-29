import 'package:kepuharjo_framework/Model/berita_model.dart';

class Api {
  static const connectHost = "http://192.168.0.117:8000/api";

  static const login = "$connectHost/auth/login";
  static const register = "$connectHost/auth/register";
  static const logout = "$connectHost/auth/logout";
  static const me = "$connectHost/auth/me";
  static const berita = "$connectHost/berita";
  static const surat = "$connectHost/surat";
  static const suratmasuk = "$connectHost/suratmasuk";
}
