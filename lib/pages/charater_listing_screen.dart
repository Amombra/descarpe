import 'package:flutter/material.dart';
import 'package:descarpe_me/styleguide.dart';
import '../widgets/charater_widget.dart';
import '../models/charater.dart';

class CharaterListingScreen extends StatefulWidget {
  @override
  _CharaterListingScreenState createState() => _CharaterListingScreenState();
}

class _CharaterListingScreenState extends State<CharaterListingScreen> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(
      viewportFraction: 1.0,
      initialPage: currentPage,
      keepPage: false,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(left:32, top: 8),
                          child: RichText(
                            text:TextSpan(
                              children: [
                                TextSpan(text: "Despicate Me", style: AppTheme.display1),
                                TextSpan(text:"\n"),
                                TextSpan(text: "Charaters", style: AppTheme.display2),
                         ]
                          ),
                    ),
            ),
            Expanded(
                    child: PageView( 
                      controller: _pageController,
                        children: <Widget>[
                          for(var i = 0; i<characters.length; i++)
                            CharaterWidget(character: characters[i], pageController: _pageController, currentPage:i),
              ],

              ),
            )
          ],
        ),
              ),
      ),
    );
  }
}
