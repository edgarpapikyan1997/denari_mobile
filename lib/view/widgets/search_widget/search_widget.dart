import 'package:denari_app/store/search_field_state/search_field_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/themes/app_colors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  final SearchFieldState searchState = SearchFieldState();

  final List<String> searchList = [
    "Apple",
    "Banana",
    "Cherry",
    "Date",
    "Fig",
    "Grapes",
    "Kiwi",
    "Lemon",
    "Mango",
    "Orange",
    "Papaya",
    "Raspberry",
    "Strawberry",
    "Tomato",
    "Watermelon",
  ];

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaddingUtility.symmetric(
      horizontal: 16,
      vertical: 16,
      child: Observer(builder: (context) {
        return Column(
          children: [
            TextField(

              onTap: () {
                searchState.showCancel = true;
                searchState.showSuggestion = true;
              },
              onChanged: (value) {
                searchState.showSuggestion = true;
                searchState.filterSuggestions(value, searchList);
              },
              onTapOutside: (value) {
                FocusScope.of(context).unfocus();
                searchState.showCancel = false;
                searchState.showSuggestion = false;
              },
              controller: _textEditingController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: PaddingUtility.only(
                  left: 12,
                  right: 8,
                  child: Assets.media.icons.search.svg(height: 24, width: 24),
                ),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 24.0, minHeight: 24.0),
                suffixIcon: PaddingUtility.only(
                    right: 12,
                    child: searchState.showCancel
                        ? GestureDetector(
                            onTap: () {
                              _textEditingController.clear();
                              searchState.showCancel = false;
                              searchState.showSuggestion = false;
                              searchState.filteredSuggestions.clear();
                            },
                            child: Assets.media.icons.sloseCenter.svg(),
                          )
                        : const SizedBox()),
                suffixIconConstraints:
                    const BoxConstraints(minWidth: 24.0, minHeight: 24.0),
                fillColor: AppColors.searchBarColor,
                filled: true,
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            if (searchState.filteredSuggestions.isEmpty &&
                _textEditingController.text != '')
              Expanded(
                child: NoDataWidget(
                  title: 'main.nothingFound'.tr(),
                  asset: Assets.media.images.taskListClock.image(),
                  description: 'main.trySearchAgain'.tr(),
                ),
              ),
            if (searchState.showSuggestion)
              Expanded(
                child: ListView.builder(
                  itemCount: searchState.filteredSuggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(searchState.filteredSuggestions[index]),
                      onTap: () {
                        _textEditingController.text =
                            searchState.filteredSuggestions[index];
                        searchState.showSuggestion = false;
                        searchState.showCancel = false;
                        FocusScope.of(context).unfocus();
                      },
                    );
                  },
                ),
              ),
          ],
        );
      }),
    );
  }
}
