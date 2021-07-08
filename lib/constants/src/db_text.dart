part of constants;

class DBText {

  static const String tableCellNo = 'No';
  static const String tableCellAction = 'Aksi';

  static const String formName = 'Nama';
  static const String formDescription = 'Deskripsi';

  static const String buttonAdd = 'Tambah';
  static const String buttonSave = 'Simpan';
  static const String buttonBack = 'Kembali';
  static const String buttonEdit = 'Ubah';
  static const String buttonDelete = "Hapus";
  static const String buttonDetail = "Detail";
  static const String buttonShow = "Tampilkan";
  static const String buttonModalSave = 'Simpan';
  static const String buttonModalDelete = 'Hapus';
  static const String buttonModalFinish = 'Selesai';
  static const String buttonModalCancel = 'Batal';
  static const String buttonClose = 'Tutup';
  static const String buttonProcessing = 'Sedang Memproses ...';

  static const String home = 'Admin Panel';
  static const String master = 'Master';
  static const String settings = 'Pengaturan';
  static const String report = 'Laporan';
  static const String transaction = 'Transaksi';

  static const String data = 'Data';
  static const String dataNotFound = 'Tidak ada data ditemukan';

  static const String form = 'Form';

  static const String formEdit = 'Ubah';

  static const String detail = 'Detail';

  static const String information = 'Informasi';
  static const String informationData = '$information $data';

  static String placeholder(String value) {
    return ('Masukan ${value.toLowerCase()} disini ...').trim();
  }

  static String placeholderSelect(String value) {
    return ('Pilih salah satu ${value.toLowerCase()}').trim();
  }

  static String placeholderDate(String value) {
    return ('Klik untuk pilih tanggal ${value.toLowerCase()}').trim();
  }

  static String buttonEditTitle(String value) {
    return '$buttonEdit $value';
  }

  static String masterTitle(String value) {
    return '$master $value';
  }

  static String dataTitle(String value) {
    return '$data $value';
  }

  static String formTitle(String value) {
    return '$form $value';
  }

  static String formEditTitle(String value) {
    return '$formEdit $value';
  }

  static String informationTitle(String value) {
    return '$information $value';
  }
}