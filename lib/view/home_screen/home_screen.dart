import 'package:fake_store_api_integration/controller/cart_screen_controller.dart';
import 'package:fake_store_api_integration/controller/home_screen_controller.dart';
import 'package:fake_store_api_integration/global_widgets/reusable_loading_indicator.dart';
import 'package:fake_store_api_integration/view/home_screen/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
   void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<HomeScreenController>(context, listen: false)
          .getProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenState = context.watch<HomeScreenController>();
    return Scaffold(
      // comment action codes in appbar to get flipscreen on both side using drawer property
      appBar: AppBar(
        leading: Builder(
         builder: (context) => IconButton(
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
           icon: Icon(Icons.star)),
        ),

        actions: [
          IconButton(
          onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => CartScreen(),
          ));
        },
      icon: Icon(Icons.shopping_cart)),
        
    Builder(
      builder: (context)=>IconButton(
        onPressed: (){
          Scaffold.of(context).openEndDrawer();
           },
        icon: Icon(Icons.star),
         ),
      ),
      ],
      ),
        
      
     
       // flip screen - used after appbar( its scaffold class property)
      drawer: Drawer(
        child: Container(
          color: Colors.lightGreen,
          child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                color:Colors.red,
              )
            ),
           UserAccountsDrawerHeader(
              accountName: Text("Name"),
              accountEmail: Text("Email"),
              currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://images.pexels.com/photos/415263/pexels-photo-415263.jpeg?auto=compress&cs=tinysrgb&w=600 "),
               ),
               decoration: BoxDecoration(
                image: DecorationImage(
                 image: NetworkImage("https://images.pexels.com/photos/20655478/pexels-photo-20655478/free-photo-of-a-field-of-white-and-orange-tulips.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
                  fit: BoxFit.fill,
                ),
               ),
              
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage("https://images.pexels.com/photos/20192549/pexels-photo-20192549/free-photo-of-blue-mountains.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
                ),
              ],
              ),
          // ],
          // ),
              
          //   ),

          ListTile(
            leading: Icon(Icons.camera),
          title: Text("Camera"),
          trailing: Icon(Icons.arrow_right),
          ),

         
         ListTile(
            leading: Icon(Icons.camera),
          title: Text("Home"),
          trailing: Icon(Icons.home),
          ),

          ListTile(
            leading: Icon(Icons.camera),
          title: Text("Profile"),
          trailing: Icon(Icons.person),
          ),

          ListTile(
            leading: Icon(Icons.camera),
          title: Text("Settings"),
          trailing: Icon(Icons.settings),
          ),
          ],
          ),
        ),
      
        ),
      
      
      
       // flip screen from sides
      body: homeScreenState.isLoading
          ? Center(child: ReusableLoadingIndicator())
          : ListView.builder(
              itemCount: homeScreenState.productsList.length,
              itemBuilder: (context, index) => Container(
                child: ListTile(
                  leading: Image.network(
                      homeScreenState.productsList[index].image ?? ""),
                  title: Text(
                      homeScreenState.productsList[index].title.toString()),
                  subtitle: Text(
                      homeScreenState.productsList[index].price.toString()),
                  trailing: IconButton(
                      onPressed: () {
                        Provider.of<CartScreenController>(context,
                                listen: false)
                            .addToCart(
                                homeScreenState.productsList[index], context);
                      },
                      icon: Icon(Icons.add_shopping_cart)),
                ),
              ),
            ),
    );
  }
}