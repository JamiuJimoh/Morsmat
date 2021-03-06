import 'package:flutter/material.dart';

import '../../../common_widgets/empty_state_content.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T items);

class ListItemsBuilder<T> extends StatelessWidget {
  final AsyncSnapshot<List<T>> snapshot;
  final ItemWidgetBuilder<T> itemBuilder;
  final Axis? scrollDirection;
  final bool? shrinkWrap;

  const ListItemsBuilder({
    Key? key,
    required this.snapshot,
    required this.itemBuilder,
    this.scrollDirection: Axis.vertical,
    this.shrinkWrap: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      final List<T> items = snapshot.data!;
      if (items.isNotEmpty) {
        return _buildList(items.reversed.toList());
      } else {
        return EmptyStateContent(
          title: 'No meals yet',
          message: 'Start adding meals',
        );
      }
    } else if (snapshot.hasError) {
      print(snapshot.error);
      return EmptyStateContent(
        title: 'An error occurred',
        message: 'Currently unable to load items',
      );
    }
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildList(List<T> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => itemBuilder(context, items[index]),
      scrollDirection: scrollDirection!,
      shrinkWrap: shrinkWrap!,
      physics: shrinkWrap! ? NeverScrollableScrollPhysics() : null,
    );
  }
}
