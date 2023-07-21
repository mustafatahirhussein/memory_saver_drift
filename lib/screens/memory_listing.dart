import 'package:flutter/material.dart';
import 'package:memory_saver_drift/main.dart';
import 'package:memory_saver_drift/memorysaver.dart';
import 'package:memory_saver_drift/screens/add_new_memory.dart';
import 'package:memory_saver_drift/screens/widgets/memory_view_widget.dart';

class MemoryListing extends StatelessWidget {
  const MemoryListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Memories"),
      ),
      body: FutureBuilder<List<MemorysaverData>>(
        future: memoryDb!.getAllMemory(),
        builder: (context, memorySnapshot) {

          if(memorySnapshot.hasData) {

            return memorySnapshot.data!.isEmpty ? const Center(
              child: Text("No Memories yet!!\nAdd some...", style: TextStyle(
                fontSize: 30
              ),),
            ) : ListView.separated(
              shrinkWrap: true,
              itemCount: memorySnapshot.data!.length,
              itemBuilder: (context, i) {
                MemorysaverData item = memorySnapshot.data![i];

                return MemoryViewWidget(item: item);
              },
              separatorBuilder: (context, i) {
                return const Divider();
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Text("Add a new Memory"),
        label: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddNewMemory())),
      ),
    );
  }
}
