class Status {
  String? uuid;
  String? status;
  String? keterangan;
  DateTime? createdAt;
  String? filePdf;
  String? idMasyarakat;
  int? idSurat;
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
  String? updatedAt;
  String? id;
  String? namaSurat;
  String? image;

  Status(
      {this.uuid,
      this.status,
      this.keterangan,
      this.createdAt,
      this.filePdf,
      this.idMasyarakat,
      this.idSurat,
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
      this.updatedAt,
      this.id,
      this.namaSurat,
      this.image});

  Status.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    status = json['status'];
    keterangan = json['keterangan'];
    if (json['created_at'] != null) {
      createdAt = DateTime.parse(json['created_at']);
    }
    filePdf = json['file_pdf'];
    idMasyarakat = json['id_masyarakat'];
    idSurat = int.parse(json['id_surat'].toString());
    nik = int.parse(json['nik'].toString());
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
    updatedAt = json['updated_at'];
    id = json['id'];
    namaSurat = json['nama_surat'];
    image = json['image'];
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
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    data['nama_surat'] = this.namaSurat;
    data['image'] = this.image;
    return data;
  }
}
