import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/services/validators/nonempty_validator.dart';
import 'package:student_toolbox/widgets/button_primary.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/surface.dart';

class PostCreateScreen extends StatefulWidget {
  final GroupModel group;

  const PostCreateScreen({Key key, @required this.group}) : super(key: key);

  @override
  _PostCreateScreenState createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _title="";
  String _text="";

  void _createPost() {
    Database.addPost(AuthService().currentUser.uid, widget.group.id,
        _title, _text, DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "New Post",
        subScreen: true,
      ).get(context),
      body: Form(
        key: formKey,
        child: Surface(
          children: [
            TextFormField(
              maxLines: 1,
              maxLength: 64,
              validator: NonEmptyValidator.validate,
              decoration: InputDecoration(
                labelText: "Title",
              ),
              onChanged: (value) {_title = value;},
            ),
            TextFormField(
              minLines: 5,
              maxLines: 10,
              maxLength: 1024,
              maxLengthEnforced: true,
              validator: NonEmptyValidator.validate,
              decoration: InputDecoration(
                labelText: "Text",
                alignLabelWithHint: true,
              ),
              onChanged: (value) {_text = value;},
            ),
            Container(
              padding: EdgeInsets.only(top: 64, bottom: 8),
              child: ButtonPrimary(
                label: "Publish",
                width: 148,
                onPressed: () {
                  _createPost();
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
