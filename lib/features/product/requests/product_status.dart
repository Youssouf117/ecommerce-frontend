enum ProductStatus{
  ACTIVE,
  INACTIVE,
  OUT_OF_STOCK
}

ProductStatus productStatusFromString(String value){
  return ProductStatus.values.firstWhere((status) => status.name==value);
}