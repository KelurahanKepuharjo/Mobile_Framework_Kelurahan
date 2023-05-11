class Keluarga {
  String? id;
  int? noKk;
  String? namaKepalaKeluarga;
  String? alamat;
  int? rt;
  int? rw;
  int? kodePos;
  String? kelurahan;
  String? kecamatan;
  String? kabupaten;
  String? provinsi;
  String? kkTgl;
  Null? createdAt;
  Null? updatedAt;
  List<Masyarakat>? masyarakat;

  Keluarga(
      {this.id,
      this.noKk,
      this.namaKepalaKeluarga,
      this.alamat,
      this.rt,
      this.rw,
      this.kodePos,
      this.kelurahan,
      this.kecamatan,
      this.kabupaten,
      this.provinsi,
      this.kkTgl,
      this.createdAt,
      this.updatedAt,
      this.masyarakat});

  Keluarga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noKk = json['no_kk'];
    namaKepalaKeluarga = json['nama_kepala_keluarga'];
    alamat = json['alamat'];
    rt = json['rt'];
    rw = json['rw'];
    kodePos = json['kode_pos'];
    kelurahan = json['kelurahan'];
    kecamatan = json['kecamatan'];
    kabupaten = json['kabupaten'];
    provinsi = json['provinsi'];
    kkTgl = json['kk_tgl'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['masyarakat'] != null) {
      masyarakat = <Masyarakat>[];
      json['masyarakat'].forEach((v) {
        masyarakat!.add(new Masyarakat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_kk'] = this.noKk;
    data['nama_kepala_keluarga'] = this.namaKepalaKeluarga;
    data['alamat'] = this.alamat;
    data['rt'] = this.rt;
    data['rw'] = this.rw;
    data['kode_pos'] = this.kodePos;
    data['kelurahan'] = this.kelurahan;
    data['kecamatan'] = this.kecamatan;
    data['kabupaten'] = this.kabupaten;
    data['provinsi'] = this.provinsi;
    data['kk_tgl'] = this.kkTgl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.masyarakat != null) {
      data['masyarakat'] = this.masyarakat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Masyarakat {
  String? idMasyarakat;
  int? nik;
  String? namaLengkap;
  String? jenisKelamin;
  String? tempatLahir;
  String? tglLahir;
  String? agama;
  String? pendidikan;
  String? pekerjaan;
  String? golonganDarah;
  String? statusPerkawinan;
  String? tglPerkawinan;
  String? statusKeluarga;
  String? kewarganegaraan;
  String? noPaspor;
  String? noKitap;
  String? namaAyah;
  String? namaIbu;
  String? createdAt;
  String? updatedAt;
  String? id;

  Masyarakat(
      {this.idMasyarakat,
      this.nik,
      this.namaLengkap,
      this.jenisKelamin,
      this.tempatLahir,
      this.tglLahir,
      this.agama,
      this.pendidikan,
      this.pekerjaan,
      this.golonganDarah,
      this.statusPerkawinan,
      this.tglPerkawinan,
      this.statusKeluarga,
      this.kewarganegaraan,
      this.noPaspor,
      this.noKitap,
      this.namaAyah,
      this.namaIbu,
      this.createdAt,
      this.updatedAt,
      this.id});

  Masyarakat.fromJson(Map<String, dynamic> json) {
    idMasyarakat = json['id_masyarakat'];
    nik = json['nik'];
    namaLengkap = json['nama_lengkap'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tglLahir = json['tgl_lahir'];
    agama = json['agama'];
    pendidikan = json['pendidikan'];
    pekerjaan = json['pekerjaan'];
    golonganDarah = json['golongan_darah'];
    statusPerkawinan = json['status_perkawinan'];
    tglPerkawinan = json['tgl_perkawinan'];
    statusKeluarga = json['status_keluarga'];
    kewarganegaraan = json['kewarganegaraan'];
    noPaspor = json['no_paspor'];
    noKitap = json['no_kitap'];
    namaAyah = json['nama_ayah'];
    namaIbu = json['nama_ibu'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_masyarakat'] = this.idMasyarakat;
    data['nik'] = this.nik;
    data['nama_lengkap'] = this.namaLengkap;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tempat_lahir'] = this.tempatLahir;
    data['tgl_lahir'] = this.tglLahir;
    data['agama'] = this.agama;
    data['pendidikan'] = this.pendidikan;
    data['pekerjaan'] = this.pekerjaan;
    data['golongan_darah'] = this.golonganDarah;
    data['status_perkawinan'] = this.statusPerkawinan;
    data['tgl_perkawinan'] = this.tglPerkawinan;
    data['status_keluarga'] = this.statusKeluarga;
    data['kewarganegaraan'] = this.kewarganegaraan;
    data['no_paspor'] = this.noPaspor;
    data['no_kitap'] = this.noKitap;
    data['nama_ayah'] = this.namaAyah;
    data['nama_ibu'] = this.namaIbu;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    return data;
  }
}
