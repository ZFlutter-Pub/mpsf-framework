// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:mpsf_framework/mpsf_framework.dart';

class TestNetworkImageScreen extends StatefulWidget {
  TestNetworkImageScreen({Key? key}) : super(key: key);

  @override
  State<TestNetworkImageScreen> createState() => _TestNetworkImageScreenState();
}

class _TestNetworkImageScreenState extends State<TestNetworkImageScreen> {
  List _imgUrls = [
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2014%2F0827%2Fc0c92bd51bb72e6d12d5b877dce338e8.jpg&refer=http%3A%2F%2Ffile02.16sucai.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649494838&t=e9012b91de5ffce94c39d668f22f61c0",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp08%2F01042323313046.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649494838&t=82f49b584b8674e97642c661f8ae862c",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2F68%2Fc8%2F7d%2F68c87deaf34b1b521135181ebfb12633.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1649494838&t=3abd1c1c1d317c8dab71873e66af8911",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络图片封装"),
      ),
      body: ListView.builder(
        itemCount: _imgUrls.length,
        itemBuilder: (context, index) {
          return MpsfNetworkImage(_imgUrls[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
