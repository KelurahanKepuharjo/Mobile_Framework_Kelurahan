class Api {
  static const connectapi = "http://192.168.0.118:8000";
  static const connectHost = "$connectapi/api";
  static const connectimage = "$connectapi/images/";

  //auth
  static const login = "$connectHost/auth/login";
  static const register = "$connectHost/auth/register";
  static const logout = "$connectHost/auth/logout";
  static const me = "$connectHost/auth/me";

  static const berita = "$connectHost/berita";
  static const surat = "$connectHost/surat";

  static const suratmasuk = "$connectHost/suratmasuk";
  static const rekap = "$connectHost/rekap";
  static const keluarga = "$connectHost/keluarga";
  static const disetujui = "$connectHost/disetujui";
  static const pengajuan = "$connectHost/pengajuan";

  //status
  static const status = "$connectHost/statusdiajukan";
  static const ditolak = "$connectHost/statusditolak";
  static const diproses = "$connectHost/statusproses";
  static const pembatalan = "$connectHost/pembatalan";

  //editnohp
  static const editnohp = "$connectHost/editnohp";
}
