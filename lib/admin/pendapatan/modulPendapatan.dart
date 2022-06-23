class modulPendapatan {
  String namalengkap;
  String alamat;
  String namakantong;

  modulPendapatan({
    required this.namalengkap,
    required this.alamat,
    required this.namakantong,
  });

  get json => modulPendapatan(
      namalengkap: this.namalengkap,
      alamat: this.alamat,
      namakantong: this.namakantong);
}
