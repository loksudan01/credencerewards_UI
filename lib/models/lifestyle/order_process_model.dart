class LifestyleOrderProcessModel{
  String processId;
  String totalAmount;
  String orderId;
  String paymentId;
  String status;

  LifestyleOrderProcessModel(
      {this.processId = '',
      this.totalAmount = '',
      this.orderId = '',
      this.paymentId = '',
      this.status = ''});
}