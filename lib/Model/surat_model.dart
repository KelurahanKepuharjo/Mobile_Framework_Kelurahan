class MasterSurat {
  int? idSurat;
  String? uuid;
  String? image;
  String? namaSurat;

  MasterSurat({this.idSurat, this.uuid, this.namaSurat});

  MasterSurat.fromJson(Map<String, dynamic> json) {
    idSurat = json['id_surat'];
    uuid = json['uuid'];
    image = json['image'];
    namaSurat = json['nama_surat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_surat'] = this.idSurat;
    data['uuid'] = this.uuid;
    data['image'] = this.image;
    data['nama_surat'] = this.namaSurat;
    return data;
  }
}
