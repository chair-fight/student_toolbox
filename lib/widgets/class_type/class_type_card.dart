import 'package:flutter/material.dart';
import 'package:student_toolbox/models/class_type_model.dart';

class ClassTypeCard extends StatelessWidget {
  final ClassTypeModel classTypeModel;
  final Function onTap;

  const ClassTypeCard({
    Key key,
    @required this.classTypeModel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8, right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: classTypeModel.color,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bookmark, size: 16),
                  Text(classTypeModel.string),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
