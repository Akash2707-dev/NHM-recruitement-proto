import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Amount: INR 800',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Select Payment Method:',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_circle, color: Colors.green, size: 80),
                            SizedBox(height: 20),
                            Text('Payment Successful', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () => Get.back(),
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.phone_android, size: 40, color: Colors.white),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'PhonePe',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_circle, color: Colors.green, size: 80),
                            SizedBox(height: 20),
                            Text('Payment Successful', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () => Get.back(),
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.payment, size: 40, color: Colors.white),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'GPay',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_circle, color: Colors.green, size: 80),
                            SizedBox(height: 20),
                            Text('Payment Successful', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () => Get.back(),
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.account_balance, size: 40, color: Colors.white),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Bank Transfer',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}