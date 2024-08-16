import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Payment method'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductDetails(),
            SizedBox(height: 16.0),
            _buildShippingAddress(),
            SizedBox(height: 16.0),
            _buildBillingAddressOption(),
            SizedBox(height: 16.0),
            _buildApplyCouponOption(),
            SizedBox(height: 16.0),
            _buildSelectGiftOption(),
            SizedBox(height: 16.0),
            _buildOrderSummary(),
            SizedBox(height: 32.0),
            _buildSelectPaymentButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Row(
      children: [
        Image.network(
          'https://via.placeholder.com/50', // Replace with your image URL
          width: 50,
          height: 50,
        ),
        SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seventeen Mukhi from Nepal CXLIII',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'View Details',
              style: TextStyle(
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShippingAddress() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('Ship to'),
      subtitle: Text(
        '3910 Crim Lane, Greendale County, Colorado. Zip Code 410348',
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildBillingAddressOption() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (bool? value) {
            // Handle checkbox change
          },
        ),
        Text('Billing address as same as shipping address'),
        Spacer(),
        TextButton(
          onPressed: () {
            // Handle add billing address
          },
          child: Text(
            '+ Add billing address',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildApplyCouponOption() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.local_offer, color: Colors.amber),
      title: Text('Apply Coupon'),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle apply coupon
      },
    );
  }

  Widget _buildSelectGiftOption() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.card_giftcard, color: Colors.red),
      title: Text('Select a Free Gift'),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle select gift
      },
    );
  }

  Widget _buildOrderSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Product'),
            Text('Amount'),
          ],
        ),
        SizedBox(height: 8.0),
        _buildOrderSummaryRow('Seventeen Mukhi from Nepal...', 'INR 51,000'),
        _buildOrderSummaryRow('Subtotal', 'INR 51,000'),
        _buildOrderSummaryRow('Discount 10%', 'INR 5,100', isDiscount: true),
        _buildOrderSummaryRow('Shipping Charges', 'INR 0'),
      ],
    );
  }

  Widget _buildOrderSummaryRow(String label, String amount,
      {bool isDiscount = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          amount,
          style: TextStyle(
            color: isDiscount ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectPaymentButton() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          // Handle select payment method
        },
        child: Text(
          'Select Payment Method',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
