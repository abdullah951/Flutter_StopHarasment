import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/model/GetCategory.dart';
import 'package:flutter_app/ui/Incident_type/incident_type2.dart';
import 'package:flutter_app/widgets/incident_type_item.dart';
import 'package:flutter_app/widgets/incident_type_item_divider.dart';

class MyIncidentTypeList{


  setMyIncidentTypeList(context,List<GetCategory> _newsArticles,Function action) {
    return ListView.separated(
      itemCount: _newsArticles == null ? 0 : _newsArticles.length,


      itemBuilder: (context, index) {
        return MyIncidentItem().setMyIncidentItem(
            context, _newsArticles[index].name, action, index);
      }, separatorBuilder: (BuildContext context, int index) {
      return MyIncidentItemDivider().setMyIncidentItemDivider(context);
    },

    );
  }}