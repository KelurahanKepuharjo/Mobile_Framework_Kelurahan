class Pengajuan {
  String? uuid;
  String? status;
  String? keterangan;
  String? createdAt;
  String? filePdf;
  String? idMasyarakat;
  int? idSurat;
  String? namaSurat;
  String? image;
  String? updatedAt;
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
  int? id;
  Surat? surat;

  Pengajuan(
      {this.uuid,
      this.status,
      this.keterangan,
      this.createdAt,
      this.filePdf,
      this.idMasyarakat,
      this.idSurat,
      this.namaSurat,
      this.image,
      this.updatedAt,
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
      this.id,
      this.surat});

  Pengajuan.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    status = json['status'];
    keterangan = json['keterangan'];
    createdAt = json['created_at'];
    filePdf = json['file_pdf'];
    idMasyarakat = json['id_masyarakat'];
    idSurat = json['id_surat'];
    namaSurat = json['nama_surat'];
    image = json['image'];
    updatedAt = json['updated_at'];
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
    id = json['id'];
    surat = json['surat'] != null ? new Surat.fromJson(json['surat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['status'] = this.status;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['file_pdf'] = this.filePdf;
    data['id_masyarakat'] = this.idMasyarakat;
    data['id_surat'] = this.idSurat;
    data['nama_surat'] = this.namaSurat;
    data['image'] = this.image;
    data['updated_at'] = this.updatedAt;
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
    data['id'] = this.id;
    if (this.surat != null) {
      data['surat'] = this.surat!.toJson();
    }
    return data;
  }
}

class Surat {
  int? idSurat;
  String? namaSurat;
  String? image;
  Null? createdAt;
  Null? updatedAt;

  Surat(
      {this.idSurat,
      this.namaSurat,
      this.image,
      this.createdAt,
      this.updatedAt});

  Surat.fromJson(Map<String, dynamic> json) {
    idSurat = json['id_surat'];
    namaSurat = json['nama_surat'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_surat'] = this.idSurat;
    data['nama_surat'] = this.namaSurat;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
