import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DetailPage extends StatefulWidget {
  final heroTag; 
  final foodName;
  final foodPrice; 
  DetailPage({this.heroTag,this.foodName,this.foodPrice}) ;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var selectedCard = 'WEIGHT' ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        leading: IconButton(
          onPressed:(){
            Navigator.of(context).pop();
          } ,
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Details',
          style: TextStyle(
            fontFamily: 'Montsserat',fontSize:18.0,color: Colors.white
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: (){},
            color: Colors.white,
          )
        ],
      ),
      body:ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child:Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0)
                    ),
                    color: Colors.white,
                  ), 
                  height: MediaQuery.of(context).size.height - 100,   
                  width: MediaQuery.of(context).size.width,              
                ) ,
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width/2) - 100.0,
                child: Hero(
                  tag: widget.heroTag,
                  child:Container(
                    decoration:BoxDecoration(
                      image: DecorationImage(image: AssetImage(widget.heroTag),
                      fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(102),
                    ),
                    height: 200.0,
                    width: 200.0,
                  ) 
                  /****************************************************** */ 
                  
                ),
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.foodName,
                      style: TextStyle(
                        fontFamily: 'Montsserat',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.foodPrice,
                          style: TextStyle(
                            fontFamily: 'Montsserat',
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 25.0,
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: Colors.black87
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(7.0),
                                    color: Colors.black
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20.0,

                                  ),
                                ),
                              ),
                              Text(
                                '2',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(7.0),
                                    color: Colors.grey
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 150.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                           _BuildInfoCard("WEIGHT","300","G"),
                           SizedBox(width: 10.0,),
                           _BuildInfoCard("CALORIES","235","CAL"),
                           SizedBox(width: 10.0,),
                           _BuildInfoCard("VITAMINS","A, B6","VIT"),
                           SizedBox(width: 10.0,),
                           _BuildInfoCard("AVAIL","NO","AV"),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        height:(MediaQuery.of(context).size.height)/8,
                        width:(MediaQuery.of(context).size.width) ,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.only(topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0),bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(50.0)),
                          color: Colors.black87
                        ),
                        
                        child: Center(
                           child: Text(
                          widget.foodPrice,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold 
                          ),
                        ),
                        )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),         
        ],
      )
    ); 
  }
  Widget _BuildInfoCard(String cardTitle,String info,String unit){
  return InkWell(
    onTap: () {
      selectCard(cardTitle);
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 700),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(25.0),
        color: cardTitle == selectedCard ? Color(0xFF7A9BEE):Colors.white,
        border: Border.all(
          color: cardTitle == selectedCard ?
          Colors.transparent:
          Colors.grey.withOpacity(1.0), 
          style: BorderStyle.solid,
          width: 0.75,          
        ),     
      ),
      height: 100.0,
      width: 100.0,
      child: Column(       
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0,),
          Text(cardTitle,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                color: cardTitle == selectedCard
                      ?Colors.white
                      :Colors.grey,
                fontWeight: FontWeight.bold
              ),
          ),
           SizedBox(height: 60.0,),
          Text(info,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                color: cardTitle == selectedCard
                      ?Colors.white
                      :Colors.black,
                fontWeight: FontWeight.bold
              ),
          ),
          SizedBox(height: 7.0,),
          Text(unit,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12.0,
              color: cardTitle == selectedCard 
                    ? Colors.white
                    :Colors.black
            ),
          )
              ],
            ) ,
          )
          
        ],
      ),
    ),
    
  );
}
selectCard(cardTitle){
  setState((){
    selectedCard = cardTitle ; 
  });
}
}
