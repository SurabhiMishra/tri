import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/story/story_screen.dart';
import 'package:shop_app/story/components/stories.dart';

class AddStory extends StatelessWidget {
  static String routeName = "/addStory";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();
  final TextEditingController _byController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Share Your Story',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(child: _buildChildren(context)),
    );
  }

  Widget _buildChildren(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: (Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25.0),
          _buildNameTextField(),
          SizedBox(height: 25.0),
          _buildStoryTextField(),
          SizedBox(height: 25.0),
          _buildCompanyTextField(),
          SizedBox(height: 25.0),
          _buildByTextField(),
          SizedBox(height: 18.0),
          _buildTagTextField(),
          SizedBox(height: 18.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: kPrimaryColor, textStyle: TextStyle(fontSize: 17)),
            onPressed: () => _submit(context),
            child: Text(
              "Submit",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )),
    );
  }

  void _submit(BuildContext context) {
    storyValues.add(Stories(
        name: _nameController.text,
        story: _storyController.text,
        by: _byController.text,
        tags: _tagController.text,
        company: _companyController.text,
        upvotes: 0,
        downvotes: 0
       ));
    Navigator.of(context).pop();
  }

  TextField _buildNameTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Title',
        hintText: 'A day at work',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _nameController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextField _buildStoryTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Story',
        hintText: 'It was a sunny day .....',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _storyController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextField _buildCompanyTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Company',
        hintText: 'Bloomberg',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _companyController,
      // focusNode: _emailFocus,
      //cursorColor: Colors.black,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextField _buildByTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Author',
        hintText: 'Udbhav Somani',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _byController,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }

  TextField _buildTagTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Tags',
        hintText: '#work #life',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      controller: _tagController,
      autocorrect: false,
      style: (TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    );
  }
}
