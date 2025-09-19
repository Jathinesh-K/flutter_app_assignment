import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../view_model/book_search_view_model.dart';

class BookSearchBar extends StatefulWidget implements PreferredSizeWidget {
  final BookSearchViewModel viewModel;
  const BookSearchBar({super.key, required this.viewModel});

  @override
  State<BookSearchBar> createState() => _BookSearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(SizeConstants.s72);
}

class _BookSearchBarState extends State<BookSearchBar> {
  late final TextEditingController _controller;
  late FocusNode _focusNode;
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      if (_controller.text.isNotEmpty && !_showClearIcon) {
        setState(() {
          _showClearIcon = true;
        });
      } else if (_controller.text.isEmpty && _showClearIcon) {
        setState(() {
          _showClearIcon = false;
        });
      }
    });
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: SizeConstants.s16,
        right: SizeConstants.s16,
        bottom: SizeConstants.s16,
      ),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
        onSubmitted: (value) {
          widget.viewModel.searchBooks(title: value);
        },
        onTapOutside: (_) {
          if (_focusNode.hasFocus) {
            _focusNode.unfocus();
          }
        },
        leading: const Icon(Icons.search),
        trailing: _showClearIcon
            ? [
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ]
            : null,
        hintText: AppConstants.searchBarHint,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConstants.s12),
          ),
        ),
      ),
    );
  }
}
