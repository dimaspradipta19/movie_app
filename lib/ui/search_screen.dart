// SEARCH CONTENT
              // Expanded(
              //   child: Consumer<SearchProvider>(
              //     builder: (context, SearchProvider providerSearch, _) {
              //       if (providerSearch.state == ResultState.loading) {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       } else if (providerSearch.state == ResultState.hasData) {
              //         return ListView.builder(
              //           itemCount: providerSearch.result.length,
              //           itemBuilder: (context, index) {
              //             return Center(
              //               child: Text(providerSearch.result[index].id.toString()),
              //             );
              //           },
              //         );
              //       } else if (providerSearch.state == ResultState.noData) {
              //         return const Center(
              //           child: Text("Data not loaded"),
              //         );
              //       } else if (providerSearch.state == ResultState.error) {
              //         return const Center(
              //           child: Text("Not loaded"),
              //         );
              //       } else {
              //         return Container();
              //       }
              //     },
              //   ),
              // ),