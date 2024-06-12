import 'package:flutter/material.dart';

class MyBagRoute extends StatefulWidget {
  const MyBagRoute({super.key});
  @override
  State<MyBagRoute> createState() => _MyBagRouteState();
}

class _MyBagRouteState extends State<MyBagRoute> {

  void checkOutAlertDialog(BuildContext context, message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: const Center(child: Text('Congratulations')),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Ensure the column takes minimum space
            children: [
              Center(
                child: Text(
                  'Total amount:   $message\$',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20), // Add some space between the text and the button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(80,13,80,13),
                    child: Text('OKAY'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void productFull(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: const Center(child: Text('Congratulations')),
          content: Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ensure the column takes minimum space
              children: [
                const Center(child: Text('You have Added')),
                const Center(child: Text('5')),
                Center(child: Text('$message on your bag')),
              ],
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(80,13,80,13),
                  child: Text('OKAY'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }



  int totalAddedItem = 0;
  List myItems = [
    {'title': 'Pullover', 'color': 'Black', 'size': 'L', 'price': 50, 'image': 'images/pullover.jpg', 'productAmount':1},
    {'title': 'T-Shirt', 'color': 'Gray', 'size': 'L', 'price': 30, 'image': 'images/tshirt.jpg', 'productAmount':1},
    {'title': 'Sport Dress', 'color': 'Black', 'size': 'M', 'price': 40, 'image': 'images/sportDress.jpg', 'productAmount':1},
  ];
  late num totalPrice;
  @override
  void initState() {
    super.initState();
    totalPrice= calculateTotalPrice();
  }
  num calculateTotalPrice() {
    double total = 0;
    totalPrice=0;
    for (var item in myItems) {
      total += item['price'] * item['productAmount'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Text('My Bag', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: ListView.builder(
                itemCount: myItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    width: double.infinity,
                    height: 120,
                    child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: [
                            // image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                myItems[index]['image']!,
                                width: 100, // Fixed width
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          myItems[index]['title']!,
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.4,
                                          child: Row(
                                            children: [
                                              const Text('Color:', style: TextStyle(color: Colors.grey)),
                                              Text(myItems[index]['color']!),
                                              const Text('   Size: ', style: TextStyle(color: Colors.grey)),
                                              Text(myItems[index]['size']!),
                                            ],
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            // - button
                                            Container(
                                              margin: const EdgeInsets.only(top: 10),
                                              width: 35, // Adjust the size as needed
                                              height: 35, // Adjust the size as needed
                                              decoration: BoxDecoration(
                                                color: Colors.white, // Background color
                                                shape: BoxShape.circle, // Circular shape
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.3), // Shadow color
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    offset: const Offset(0, 2), // Shadow position
                                                  ),
                                                ],
                                              ),
                                              child: IconButton(
                                                icon: const Icon(Icons.horizontal_rule),
                                                onPressed: () {
                                                  if(myItems[index]['productAmount']>0){
                                                    num unitPrice =(myItems[index]['price']/myItems[index]['productAmount']);
                                                    myItems[index]['productAmount'] = myItems[index]['productAmount']-1;
                                                    myItems[index]['price']=unitPrice*(myItems[index]['productAmount']);
                                                    totalPrice=totalPrice-unitPrice;
                                                    setState(() {});
                                                  }
                                                },
                                                iconSize: 20, // Adjust the icon size as needed
                                                padding: EdgeInsets.zero, // Remove default padding
                                                alignment: Alignment.center, // Center the icon within the button
                                              ),
                                            ),
                                            //number
                                            Container(
                                              padding: const EdgeInsets.only(left: 10),
                                              margin: const EdgeInsets.only(top: 10),
                                              child: Text('${myItems[index]['productAmount']}',style: const TextStyle(fontSize: 17),),),
                                            //+ button
                                            Container(
                                              margin: const EdgeInsets.only(top: 10,left: 14),
                                              width: 35, // Adjust the size as needed
                                              height: 35, // Adjust the size as needed
                                              decoration: BoxDecoration(
                                                color: Colors.white, // Background color
                                                shape: BoxShape.circle, // Circular shape
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.3), // Shadow color
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    offset: const Offset(0, 2), // Shadow position
                                                  ),
                                                ],
                                              ),
                                              child: IconButton(
                                                icon: const Icon(Icons.add),
                                                onPressed: () {


                                                  num unitPrice =(myItems[index]['price']/myItems[index]['productAmount']);
                                                  myItems[index]['productAmount'] = myItems[index]['productAmount']+1;
                                                  myItems[index]['price']=unitPrice*(myItems[index]['productAmount']);
                                                  totalPrice=totalPrice+unitPrice;
                                                  setState(() {});
                                                  if(myItems[index]['productAmount'] == 5){
                                                    productFull(context, myItems[index]['title']);
                                                  }

                                                },
                                                iconSize: 20, // Adjust the icon size as needed
                                                padding: EdgeInsets.zero, // Remove default padding
                                                alignment: Alignment.center, // Center the icon within the button
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.menu, color: Colors.grey),
                                          onPressed: () {},
                                        ),
                                        Text(
                                          '${myItems[index]['price']} \$',
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15,bottom: 15),
                  child: Text('Total amount:',style: TextStyle(color: Colors.grey),),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15,bottom: 15),
                  alignment: Alignment.center,
                  child: Text('$totalPrice\$',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
                margin: const EdgeInsets.only(bottom: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(120))),
                onPressed: (){
                  checkOutAlertDialog(context,totalPrice);
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(135,15,135,15),
                  child: Text('CHECK OUT',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                ))))
        ],
      ),
    );
  }
}
