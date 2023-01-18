import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_intern/future/home/presentation/bloc/search_post/search_post_cubit.dart';
import 'package:mega_intern/future/home/presentation/widget/news_card_widget.dart';

class SearchDelegatePage extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.length > 2){
      context.read<SearchPostCubit>().searchPost(query);
    }
    return BlocBuilder<SearchPostCubit, SearchPostState>(
      builder: (context, state) {
        if (state is SearchPostLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchPostSuccess) {
          final post = state.searchResult;
          return SizedBox(
            child: ListView.separated(
              itemCount: post.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return NewsCardWidget(
                  post: post[index],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1.4,
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromRGBO(217, 217, 217, 1),
                );
              },
            ),
          );
        } else if (state is SearchPostError) {
          return const Center(
            child: Text('Something get wrong'),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
