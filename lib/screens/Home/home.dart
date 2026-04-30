import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final List<Map<String, dynamic>>  users = [
    {
      'name': 'Huzaifa',
      'role': 'Developer'
    },
    {
      'name': 'Ali',
      'role': 'Designer'
    },
    {
      'name': 'Ahmed',
      'role': 'Tester'
    },
    {
      'name': 'Huzaifa',
      'role': 'Developer'
    },
    {
      'name': 'Ali',
      'role': 'Designer'
    },
    {
      'name': 'Ahmed',
      'role': 'Tester'
    },
    {
      'name': 'Huzaifa',
      'role': 'Developer'
    },
    {
      'name': 'Ali',
      'role': 'Designer'
    },
    {
      'name': 'Ahmed',
      'role': 'Tester'
    },
    {
      'name': 'Huzaifa',
      'role': 'Developer'
    },
    {
      'name': 'Ali',
      'role': 'Designer'
    },
    {
      'name': 'Ahmed',
      'role': 'Tester'
    },
    {
      'name': 'Huzaifa',
      'role': 'Developer'
    },
    {
      'name': 'Ali',
      'role': 'Designer'
    },
    {
      'name': 'Ahmed',
      'role': 'Tester'
    },
    
  ];

  int selectIndex = 0;
  final List<Map<String, dynamic>> drawerItems =[
    {
      'icon': Icons.home,
      'title': 'Home'
    },
    {
      'icon': Icons.search,
      'title': 'Search'
    },
    {
      'icon': Icons.person,
      'title': 'Profile'
    },
     {
      'icon': Icons.settings,
      'title': 'Settings'
    },
     {
      'icon': Icons.logout,
      'title': 'Logout'
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.orange
                    ],
                )
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Muzammil',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                  ),),
                  SizedBox(
                    height: 10,
                  ),

                  Text('muzammil@gmail.com',style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)
                  ),
                ],
              ),
            ),

            Expanded(
                child: ListView.builder(
                  itemCount: drawerItems.length,
                    itemBuilder: (context, index) {
                     final items = drawerItems[index];
                     final isSelected = selectIndex == index;

                     return InkWell(
                       onTap: () {
                         setState(() {
                           selectIndex = index;
                         });
                         Navigator.pop(context);
                       },
                       child: Row(
                         children: [
                           Icon(items['index'],
                           color: isSelected ? Colors.red: Colors.grey,),
                           SizedBox(
                             width: 10,
                           ),
                           Text(items['title'],style: TextStyle(
                               color: isSelected ? Colors.red : Colors.grey,
                               fontSize: 16,
                               fontWeight: FontWeight.w500)
                           ),
                         ],
                       ),
                     );
                    }
                )
            ,)
          ],
        ),
      ),



      // body: ListView(
      //   children: [
      //     ListTile(
      //       leading: Icon(Icons.person,color: Colors.blue,),
      //       title: Text('Huzaifa'),
      //       subtitle: Text('Developer'),
      //     ),
      //
      //     ListTile(
      //       leading: Icon(Icons.person,color: Colors.blue,),
      //       title: Text('Ali'),
      //       subtitle: Text('Designer'),
      //     ),
      //
      //     ListTile(
      //       leading: Icon(Icons.person,color: Colors.blue,),
      //       title: Text('Ahmed'),
      //       subtitle: Text('Tester'),
      //     ),
      //   ],
      // ),
      
      
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context , index){
          return ListTile(
            leading: Icon(Icons.phone,color: Colors.blue,),
            title: Text(users[index]['name']),
            subtitle: Text(users[index]['role']),
          );
        },
      )
    );
  }
}
