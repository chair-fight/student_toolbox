import 'package:flutter/material.dart';
import 'file:///D:/Projects/student_toolbox/lib/widgets/buttons/button_close.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onType;
  final Function(String) onSearch;
  final Function onCancel;

  const SearchBar({Key key, this.onSearch, this.onType, this.onCancel})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _searched = false;
  String _searchString = "";

  @override
  void initState() {
    _searched = false;
    super.initState();
  }

  void _cancelSearch() {
    setState(() {
      _searched = false;
      _searchString = "";
    });
    widget.onCancel.call();
  }

  void _updateOnType(String value) {
    setState(() {
      _searched = widget.onType != null;
      _searchString = value;
    });
    if (value.isEmpty) {
      _cancelSearch();
    } else {
      widget.onType.call(_searchString);
    }
  }

  void _submitSearch() {
    setState(() {
      _searched = true;
    });
    widget.onSearch.call(_searchString);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          if (_searched)
            Container(
              padding: EdgeInsets.all(4),
              child: ButtonClose(
                onPressed: _cancelSearch,
              ),
            ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                isDense: true,
                hintText: "Search...",
              ),
              onChanged: _updateOnType,
              onFieldSubmitted: (value) => _submitSearch,
            ),
          ),
          Container(
            width: 64,
            child: FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
              splashColor: Theme.of(context).colorScheme.secondary,
              child: Container(child: Icon(Icons.search)),
              onPressed: _submitSearch,
            ),
          ),
        ],
      ),
    );
  }
}
