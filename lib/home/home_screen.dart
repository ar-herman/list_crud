import 'package:flutter/material.dart';

class Homescrren extends StatefulWidget {
  const Homescrren({Key? key}) : super(key: key);

  @override
  State<Homescrren> createState() => _HomescrrenState();
}

class _HomescrrenState extends State<Homescrren> {
  List<Map<String, dynamic>> myData = [];

  TextEditingController namaController = TextEditingController();
  TextEditingController skillController = TextEditingController();

  TextEditingController namaEditController = TextEditingController();
  TextEditingController skillEditController = TextEditingController();

  void showDialogEdit(int index, Map<String, dynamic> data) {
    namaEditController.text = data["nama"];
    skillController.text = data["skill"];

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey.shade900,
            title: const Text(
              "Edit Person",
              style: TextStyle(
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: namaEditController,
                  decoration: const InputDecoration(
                    labelText: "Nama",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 3),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: skillEditController,
                  decoration: const InputDecoration(
                    labelText: "Skill",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () {
                  String nama = namaEditController.text;
                  String skill = skillEditController.text;

                  myData[index]["nama"] = nama;
                  myData[index]["skill"] = skill;

                  namaEditController.text = "";
                  skillEditController.text = "";

                  setState(() {});

                  Navigator.pop(context);
                },
                child: const Text("Edit"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ],
          );
        });
  }

  void showDialogAdd() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey.shade900,
            title: const Text(
              "Add Person",
              style: TextStyle(
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: namaController,
                  decoration: const InputDecoration(
                    labelText: "Nama",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 3),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: skillController,
                  decoration: const InputDecoration(
                    labelText: "Skill",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () {
                  String nama = namaController.text;
                  String skill = skillController.text;

                  myData.add({"nama": nama, "skill": skill});

                  namaController.text = "";
                  skillController.text = "";

                  Navigator.pop(context);

                  setState(() {});
                },
                child: const Text("Add"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ],
          );
        });
  }

  void removeIndex(int index) {
    setState(() {
      myData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: const Text(
          "List Person",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: showDialogAdd,
            icon: const Icon(
              Icons.add_task,
              color: Colors.orange,
            ),
          ),
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 130,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama : ${myData[index]["nama"]}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Skil : ${myData[index]["skill"]}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  removeIndex(index);
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "Hapus",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton(
                                onPressed: () {
                                  showDialogEdit(index, myData[index]);
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
