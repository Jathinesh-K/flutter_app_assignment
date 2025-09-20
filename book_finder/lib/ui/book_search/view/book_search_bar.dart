import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants.dart';
import '../view_model/book_search_view_model.dart';

class BookSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const BookSearchBar({super.key});

  @override
  State<BookSearchBar> createState() => _BookSearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(SizeConstants.s72);
}

class _BookSearchBarState extends State<BookSearchBar> {
  late final TextEditingController _controller;
  late FocusNode _focusNode;
  bool _showClearIcon = false;
  late BookSearchViewModel _viewModel;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = Provider.of<BookSearchViewModel>(context, listen: false);
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
          _viewModel.searchBooks(title: value);
        },
        onTapOutside: (_) {
          if (_focusNode.hasFocus) {
            _focusNode.unfocus();
          }
        },
        trailing: [
          if (_showClearIcon)
            _buildIconButton(icon: Icons.clear, onPressed: _controller.clear),
          _buildIconButton(
            icon: Icons.search,
            onPressed: () {
              _viewModel.searchBooks(title: _controller.text);
            },
          ),
        ],
        hintText: AppConstants.searchBarHint,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConstants.s12),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) => IconButton(
    padding: EdgeInsets.zero,
    icon: Icon(icon),
    constraints: const BoxConstraints(minWidth: SizeConstants.s32),
    style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
    onPressed: onPressed,
  );
}
