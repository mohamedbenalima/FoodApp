import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodseller/detailPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food  Seller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0,top:15.0 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                   icon: Icon(Icons.arrow_back),
                   color: Colors.white,
                   onPressed: () {
                    
                   },
                ),
                
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon:Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon:Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children:<Widget>[
              Text(
                "Restaurant",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: 10.0,),
              Text(
                "Hadil",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: "Montserrat",
                ),
              ),
             ]
            ),
          ),
          SizedBox(height: 40.0,),
          Container(
             height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0))
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0,right: 20.0), 
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: <Widget>[
                        _BuildFoodItem('images/avocado.jpg','أفوكادو بالتن','50 TND'),
                        _BuildFoodItem('images/batata.jpg','سلاطة صحية','6 TND'),
                        _BuildFoodItem('images/equilibre.jpg','صحن بنين','10 TND'),
                        _BuildFoodItem('images/kasskroutKafteji.jpg','كسكروة كفتاجي','4 TND'),
                        _BuildFoodItem('images/kosksiBel3ossben.jpg','كسكسي بالعصبان','8 TND'),
                        _BuildFoodItem('images/kosksibel9adidi.jpg','كسكسي بالقديد','10 TND'),
                        _BuildFoodItem('images/platTunisien.jpg','صحن تونسي','5 TND'),
                        _BuildFoodItem('images/sa7faLablebi.jpg','صحفة لبلابي','2 TND'),
                        _BuildFoodItem('images/chapaty.jpg','شباطي المكنين','10 TND'),
                      ],
                    ),                   
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0,right:10.0 ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 65.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1.0
                        ),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Center(
                        child: Icon(Icons.search,color:Colors.black),
                      ),
                    ),
                    Container(
                      width: 65.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1.0
                        ),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Center(
                        child: Icon(Icons.shopping_basket,color:Colors.black),
                      ),
                    ),
                     Container(
                      width: 120.0,
                      height: 65.0,
                      
                      decoration: BoxDecoration(
                        color:Colors.black,
                        border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1.0
                          
                        ),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Center(
                        child: Text(
                          "CHECK-OUT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),                        
                        )
                      ),
                    )
                  ],                
                ),
                )
                
              ],
            ),
          )

        ],
      ),
    );
  }
  Widget _BuildFoodItem(String imgPath, String foodName, String price ){
    return(
      Padding(
        padding: EdgeInsets.only(left:10.0,right: 10.0,top: 15.0 ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>DetailPage(heroTag: imgPath,foodName: foodName,foodPrice: price,)
              ));
          },

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                       Hero(
                tag: imgPath,
                child: Image(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                  height: 75.0,
                  width: 75.0,
                ),
              ),
                SizedBox(width: 10.0,),
                 Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: <Widget>[
                  Text(
                    foodName,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                    ), 
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.grey,
                      
                    ),
                  )  
                ],
              )
            ],
          ),
        ),               
        IconButton(
          icon: Icon(Icons.add),
          color: Colors.black,
          onPressed: (){},
        )     
     ],
          ),
        ),
      )
    );
  }
}
