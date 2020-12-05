class SellerData {
  int id;
  String name;

  SellerData(this.id, this.name);
  static List<SellerData> getSeller() {
    return <SellerData>[
      SellerData(1, "Ananda Shop"),
      SellerData(2, "Krisha Shop"),
      SellerData(3, "Hyper Grocery"),
      SellerData(4, "Big Bazzer"),
      SellerData(5, "AkJ Bazzer Market"),
    ];
  }
}
