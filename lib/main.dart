import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.yellowAccent,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          "Sydney CBD",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 21,
                vertical: 5.0,
              ),
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[500],
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for restaurants...",
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            FittedBox(
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                  children: <Widget>[
                    Featured(),
                    Featured(),
                    Featured(),
                    Featured(),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Most Popular",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          "See All",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        OfferContainer(id: 0),
                        OfferContainer(id: 1),
                        OfferContainer(id: 2),
                        OfferContainer(id: 3),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Meal Deals",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          "See All",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        OfferContainer(id: 4),
                        OfferContainer(id: 5),
                        OfferContainer(id: 6),
                        OfferContainer(id: 7),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey[400],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Discovery();
              }),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "Home",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            title: Text(
              "Discovery",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text(
              "Bookmark",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            title: Text(
              "Top Foodie",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text(
              "Profile",
            ),
          ),
        ],
      ),
    );
  }
}

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(
            "https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2012/10/Food.jpg",
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(11.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white10, Colors.black87],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    "Thai Style",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "12 Places",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OfferContainer extends StatelessWidget {
  final int id;

  const OfferContainer({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AllPhotos();
                },
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 3.0,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            margin: EdgeInsets.all(5.0),
            width: 251,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: "food$id",
                  child: Image.network(
                    "https://www.producteursdoeufs.ca/wp-content/uploads/2019/01/Food_Trends_2019_960x650-2.jpg",
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 7.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "KFC BROADWAY",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "122 Queen Street Fried Kitchen, USA",
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AllPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.yellowAccent,
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          "All Photos",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: <Widget>[
          PhotoPublicationContainer(id: 0,),
          PhotoPublicationContainer(id: 1),
          PhotoPublicationContainer(id: 2),
        ],
        scrollDirection: Axis.vertical,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "Home",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            title: Text(
              "Discovery",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text(
              "Bookmark",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            title: Text(
              "Top Foodie",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text(
              "Profile",
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoPublicationContainer extends StatelessWidget {
  final int id;

  const PhotoPublicationContainer({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      height: 331,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TopInfoWidget(),
          SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: Hero(
              tag: "food$id",
              child: Image.network(
                "https://www.producteursdoeufs.ca/wp-content/uploads/2019/01/Food_Trends_2019_960x650-2.jpg",
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  size: 15,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.comment,
                  size: 15,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  size: 15,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopInfoWidget extends StatelessWidget {
  final String reviews, followers;

  const TopInfoWidget({Key key, this.reviews, this.followers})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(
              "https://ak9.picdn.net/shutterstock/videos/33081259/thumb/1.jpg",
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Amazigh Halzoun",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                Text(
                  "151 Reviews, 12031 Followers",
                  style: TextStyle(color: Colors.grey[400]),
                ),
                Text(
                  "Gold Foodies",
                  style: TextStyle(color: Colors.yellowAccent),
                )
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Container(
                  child: Text(
                    "Follow",
                    style: TextStyle(fontSize: 19, color: Colors.blue),
                  ),
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeef0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Discovery",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 251,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: DiscoveryContainer(
                      availablePlaces: 42,
                      containerTitle: "Bars & Hotels",
                      isActive: false,
                      iconUrl:
                          "https://static.vecteezy.com/system/resources/previews/000/553/847/non_2x/beer-mug-vector-icon.jpg",
                    ),
                  ),
                  Expanded(
                    child: DiscoveryContainer(
                      availablePlaces: 15,
                      containerTitle: "Fine Dining",
                      isActive: false,
                      iconUrl:
                          "http://chittagongit.com/images/fine-dining-icon/fine-dining-icon-14.jpg",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 251,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: DiscoveryContainer(
                      availablePlaces: 61,
                      containerTitle: "Cafes",
                      isActive: false,
                      iconUrl:
                          "https://cdn4.iconfinder.com/data/icons/building-1/512/build11-512.png",
                    ),
                  ),
                  Expanded(
                    child: DiscoveryContainer(
                      availablePlaces: 35,
                      containerTitle: "Nearby",
                      iconUrl:
                          "https://cdn3.iconfinder.com/data/icons/map/500/nearby-512.png",
                      isActive: true,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 251,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: DiscoveryContainer(
                      availablePlaces: 41,
                      containerTitle: "Fast Food",
                      isActive: false,
                      iconUrl:
                          "https://cdn4.iconfinder.com/data/icons/building-6/512/16-512.png",
                    ),
                  ),
                  Expanded(
                    child: DiscoveryContainer(
                      availablePlaces: 21,
                      containerTitle: "Featured Foods",
                      iconUrl:
                          "http://cdn.onlinewebfonts.com/svg/img_483572.png",
                      isActive: false,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey[400],
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Home();
              }),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "Home",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            title: Text(
              "Discovery",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text(
              "Bookmark",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            title: Text(
              "Top Foodie",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text(
              "Profile",
            ),
          ),
        ],
      ),
    );
  }
}

class DiscoveryContainer extends StatelessWidget {
  final String iconUrl, containerTitle;
  final int availablePlaces;
  final bool isActive;
  const DiscoveryContainer(
      {Key key,
      this.iconUrl,
      this.containerTitle,
      this.availablePlaces,
      this.isActive})
      : assert(isActive != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return
        // FittedBox(
        // child:
        Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(11.0),
      decoration: BoxDecoration(
        color: isActive ? Colors.yellow : Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey[300], blurRadius: 3.0),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            iconUrl,
            height: 151,
            width: 151,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            containerTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
          Text("$availablePlaces Place"),
        ],
      ),
      // ),
    );
  }
}
