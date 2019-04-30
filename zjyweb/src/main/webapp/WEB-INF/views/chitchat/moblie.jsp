<%--
  User: zxd
  Date: 2019/04/16
  Time: 上午 9:16
  Explain: 说明
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>LayIM 移动版 本地演示</title>

    <link rel="stylesheet" href="../layui/css/layui.mobile.css">

</head>
<body>


<script src="../layui/layui.js"></script>
<script>
    layui.use('mobile', function(){
        var mobile = layui.mobile
            ,layim = mobile.layim;

        //演示自动回复
        var autoReplay = [
            '您好，我现在有事不在，一会再和您联系。',
            '你没发错吧？face[微笑] ',
            '洗澡中，请勿打扰，偷窥请购票，个体四十，团体八折，订票电话：一般人我不告诉他！face[哈哈] ',
            '你好，我是主人的美女秘书，有什么事就跟我说吧，等他回来我会转告他的。face[心] face[心] face[心] ',
            'face[威武] face[威武] face[威武] face[威武] ',
            '<（@￣︶￣@）>',
            '你要和我说话？你真的要和我说话？你确定自己想说吗？你一定非说不可吗？那你说吧，这是自动回复。',
            'face[黑线]  你慢慢说，别急……',
            '(*^__^*) face[嘻嘻] ，是贤心吗？'
        ];

        layim.config({
            //上传图片接口
            uploadImage: {
                url: '/upload/image' //（返回的数据格式见下文）
                ,type: '' //默认post
            }

            //上传文件接口
            ,uploadFile: {
                url: '/upload/file' //（返回的数据格式见下文）
                ,type: '' //默认post
            }

            ,init: {
                mine: {
                    "username": "佟丽娅" //我的昵称
                    ,"id": 123 //我的ID
                    ,"avatar": "http://tp4.sinaimg.cn/1345566427/180/5730976522/0" //我的头像
                }
            }
        });

        //创建一个会话
        layim.chat({
            id: 111111
            ,name: '许闲心'
            ,type: 'kefu' //friend、group等字符，如果是group，则创建的是群聊
            ,avatar: 'http://tp1.sinaimg.cn/1571889140/180/40030060651/1'
        });


        //监听发送消息
        layim.on('sendMessage', function(data){
            var To = data.to;
            //console.log(data);

            //演示自动回复
            setTimeout(function(){
                var obj = {};
                if(To.type === 'group'){
                    obj = {
                        username: '模拟群员'+(Math.random()*100|0)
                        ,avatar: layui.cache.dir + 'images/face/'+ (Math.random()*72|0) + '.gif'
                        ,id: To.id
                        ,type: To.type
                        ,content: autoReplay[Math.random()*9|0]
                    }
                } else {
                    obj = {
                        username: To.name
                        ,avatar: To.avatar
                        ,id: To.id
                        ,type: To.type
                        ,content: autoReplay[Math.random()*9|0]
                    }
                }
                layim.getMessage(obj);
            }, 1000);
        });

        //监听查看更多记录
        layim.on('chatlog', function(data){
            console.log(data);
            layer.msg('do something');
        });
    });
</script>
</body>
</html>
