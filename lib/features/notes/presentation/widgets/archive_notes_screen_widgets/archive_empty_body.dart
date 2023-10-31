import 'package:flutter/material.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
import 'package:nota/core/utils/app_strings.dart';
class ArchiveEmptyBody extends StatelessWidget {
  const ArchiveEmptyBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.archive_outlined,size: 135),
          15.ph,
          Text(AppStrings.archiveBodyTitle,style: Theme.of(context).textTheme.titleSmall)
        ],
      ),
    );
  }
}
