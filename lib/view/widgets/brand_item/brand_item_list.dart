import 'package:denari_app/store/brand_item_select_state/brand_item_select_state.dart';
import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'brand_item_widget.dart';

class BrandItemList extends StatefulWidget {
  final List<BrandItemWidget> brandItems;
  final int? itemsToLoad;

  const BrandItemList(
      {super.key, required this.brandItems, this.itemsToLoad = 8});

  @override
  _BrandItemListState createState() => _BrandItemListState();
}

class _BrandItemListState extends State<BrandItemList> {
  final ScrollController _scrollController = ScrollController();
  BrandItemSelectState brandItemSelectState = BrandItemSelectState();
  List<BrandItemWidget> _displayedItems = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _displayedItems = widget.brandItems.take(widget.itemsToLoad!).toList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreItems();
      }
    });
    print(_displayedItems);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMoreItems() async {
    if (_isLoading || _displayedItems.length >= widget.brandItems.length) {
      return;
    }
    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      final nextItems = widget.brandItems
          .skip(_displayedItems.length)
          .take(widget.itemsToLoad!)
          .toList();
      _displayedItems.addAll(nextItems);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _displayedItems[index];
              },
              childCount: _displayedItems.length,
            ),
          ),
          // Show loading indicator at the end of the list
          if (_isLoading)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
