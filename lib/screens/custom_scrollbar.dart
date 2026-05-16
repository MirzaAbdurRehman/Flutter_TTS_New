import 'package:flutter/material.dart';

class CustomScrollbarScreen extends StatefulWidget {
  const CustomScrollbarScreen({super.key});

  @override
  State<CustomScrollbarScreen> createState() => _CustomScrollbarScreenState();
}

class _CustomScrollbarScreenState extends State<CustomScrollbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 120,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.cancel,color: Colors.white,),
                Icon(Icons.shop, color: Colors.white,),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Center(
                    child: Text('Nature', style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                    ),),
                  ),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                ),
            ),
            pinned: true,
            backgroundColor: Colors.orangeAccent,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://images.unsplash.com/photo-1469474968028-56623f02e42e?q=80&w=1474&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                width: double.maxFinite,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_not_supported, 
                            size: 50, 
                            color: Colors.grey[600]
                          ),
                          SizedBox(height: 10),
                          Text('Image failed to load',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'Nature is one of the most beautiful and essential parts of life on Earth. It includes mountains, rivers, forests, oceans, animals, plants, and the fresh air we breathe every day. Nature provides us with food, water, medicine, and shelter, making human life possible. The beauty of green trees, colorful flowers, and singing birds brings peace and happiness to our minds. Spending time in nature helps reduce stress and improves both physical and mental health. Every season in nature has its own charm, from the blooming flowers of spring to the snowy landscapes of winter. Animals and plants live together in balance, creating a healthy ecosystem. Humans must protect nature by reducing pollution, planting trees, and saving wildlife. If nature is harmed, the future of all living beings will be at risk. Therefore, we should respect, protect, and care for nature so future generations can also enjoy its beauty and benefits.'
                          'Nature is one of the most beautiful and essential parts of life on Earth. It includes mountains, rivers, forests, oceans, animals, plants, and the fresh air we breathe every day. Nature provides us with food, water, medicine, and shelter, making human life possible. The beauty of green trees, colorful flowers, and singing birds brings peace and happiness to our minds. Spending time in nature helps reduce stress and improves both physical and mental health. Every season in nature has its own charm, from the blooming flowers of spring to the snowy landscapes of winter. Animals and plants live together in balance, creating a healthy ecosystem. Humans must protect nature by reducing pollution, planting trees, and saving wildlife. If nature is harmed, the future of all living beings will be at risk. Therefore, we should respect, protect, and care for nature so future generations can also enjoy its beauty and benefits.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                      height: 1.5,
                    fontFamily: 'Roboto'
                  ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
