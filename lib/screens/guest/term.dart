import 'package:flutter/material.dart';

class TermScreen extends StatefulWidget {
  final Function(int) onChangeSteps;
  final String terms;
  const TermScreen({Key? key,
  required this.onChangeSteps,
  required this.terms,
  }) : super(key: key);
  @override
  _TermScreenState createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {

  bool _isReadded = false ;
  late ScrollController _scrollController;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _scrollController = ScrollController();
      _scrollController.addListener((){
        if(_scrollController.offset >=_scrollController.position.maxScrollExtent&&
        !_scrollController.position.outOfRange){
          setState(() {
                      _isReadded = true;
                    });
        }
      });
    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleSpacing: 0.0,
          elevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Terms & Conditions",
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () => widget.onChangeSteps(0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(widget.terms),
                    ],
                  ),
                ),
              ),
              
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextButton(
                  onPressed: !_isReadded ? null:() => widget.onChangeSteps(2),
                  child: Text(
                    "accept".toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
