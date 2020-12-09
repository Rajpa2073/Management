import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';

Map<String, List> _elements = {
  'SETUP': [
    'BATCH',
    'BOARD/UNIVERSITY',
    'CLASS/PROGRAM',
    'SECTION',
    'HOUSE',
    'SCOLORSHIP'
  ],
  'ENTRY': ['STUDENT ADMISSION', 'UPDATE STUDENT'],
  'REPORT': ['STUDENT LIST', 'STUDENT PROFILE'],
};

class StudentManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Name'),
      ),
      body: GroupListView(
        sectionsCount: _elements.keys.toList().length,
        countOfItemInSection: (int section) {
          return _elements.values.toList()[section].length;
        },
        itemBuilder: _itemBuilder,
        groupHeaderBuilder: (BuildContext context, int section) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
              _elements.keys.toList()[section],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 10),
        sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, IndexPath index) {
    String user = _elements.values.toList()[index.section][index.index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          var value = _elements.values.toList()[index.section][index.index];
          if (value.toLowerCase() == "batch") {
            Navigator.pushNamed(context, '/batchs');
          }
        },
        child: Card(
          elevation: 8,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
            leading: CircleAvatar(
              child: Text(
                _getInitials(user),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            title: Text(
              _elements.values.toList()[index.section][index.index],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }

  String _getInitials(String user) {
    var buffer = StringBuffer();
    var split = user.split(" ");
    for (var s in split) buffer.write(s[0]);

    return buffer.toString().substring(0, split.length);
  }
}
