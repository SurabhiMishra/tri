import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'empty_content.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);
class ListItemBuilder<T> extends StatelessWidget {
  //const ListItemBuilder<T>({Key? key}) : super(key: key);

  const ListItemBuilder({required this.snapshot,required this.itemBuilder});
  final AsyncSnapshot<List<T>> snapshot;
  final ItemWidgetBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    if(snapshot.hasData){
      final List<T>? items = snapshot.data;
      return _buildList(items);
      // if(items.isNotEmpty){
      //   return _buildList(items);
      // } else{
      //   return EmptyContent();
      // }
    } else if(snapshot.hasError){
      EmptyContent(
        title: 'Something went wrong',
        message: 'Can\'t load items right now',
      );
    }
    return Center(
      child: Text('No Opportunities avaialable ',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),),
    );
  }

  Widget _buildList(List<T>? items) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context,index)=> Divider(height: 0.5),
      itemCount: items!=null? items.length+2: 0,
      itemBuilder: (context,index){
        if(items!=null){
          if(index==0 || index==items.length+1){
            return Container();
          }
          return itemBuilder(context, items[index-1]);
        }
        return Placeholder();
      },
    );
  }
}
