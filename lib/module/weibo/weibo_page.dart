import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/module/weibo/weibo_item.dart';
import 'package:flutter_module/module/weibo/weibo_model.dart';
import 'package:flutter_module/module/weibo/weibo_navigation.dart';
import 'package:flutter_module/service/network_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WeiBo extends StatelessWidget {
  const WeiBo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [WeiboNavigation()],
      ),
      body: WeiBoContent(),
    );
  }
}


class WeiBoContent extends StatefulWidget {
  const WeiBoContent({Key? key}) : super(key: key);

  @override
  State<WeiBoContent> createState() => _WeiBoContentState();
}

class _WeiBoContentState extends State<WeiBoContent> {

  List<Status> statuses = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    NetWorkManager.getStatusListData().then((value){
      setState(() {statuses = value;});
    });
  }


  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 500));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 500));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),

      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode){
            Widget body;
            if(mode==LoadStatus.idle){body =  Text("上拉加载");}
            else if(mode==LoadStatus.loading){body =  CupertinoActivityIndicator();}
            else if(mode == LoadStatus.failed){body = Text("加载失败！点击重试！");}
            else if(mode == LoadStatus.canLoading){body = Text("松手,加载更多!");}
            else{body = Text("没有更多数据了!");}

            return Container(height: 55.0, child: Center(child: body,),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
            itemCount: statuses.length,
            itemBuilder: (BuildContext context, int index){
              return WeiBoItem(statuses[index]);
            }
        ),
      ),
    );
  }
}


