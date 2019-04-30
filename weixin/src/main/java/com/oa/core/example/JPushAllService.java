package com.oa.core.example;

/**
 * @ClassName:JPushAllService
 * @author:zxd
 * @Date:2019/04/10
 * @Time:下午 5:19
 * @Version V1.0
 * @Explain
 */
import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;

import java.util.ArrayList;

public class JPushAllService {

    public static void jpushAndroid2(ArrayList<String> user, String msg,String url) {
        String appKey = "691e22b59bceb586843fee65";
        String masterSecret = "efa6a890cffc0a7d808ff667";
        JPushClient jpushClient = new JPushClient(masterSecret, appKey);
        PushPayload payload = PushPayload.newBuilder()
                .setPlatform(Platform.android())
                .setAudience(Audience.alias(user))
                .setNotification(Notification.newBuilder()
                        .addPlatformNotification(AndroidNotification.newBuilder()
                                .setAlert(msg)
                                .addExtra("param", url)
                                .build())
                        .build())
                .setOptions(Options.newBuilder().setApnsProduction(false).build())
                .setMessage(Message.content(msg))
                .build();

        try {
            PushResult pu = jpushClient.sendPush(payload);
        } catch (APIConnectionException e) {
            e.printStackTrace();
        } catch (APIRequestException e) {
            e.printStackTrace();
        }
    }


    public static  void jpushIOS(ArrayList<String> user,String msg,String url) {
        String appKey = "fcec92e224f867fd7a93c703";
        String masterSecret = "2893313eeafe7130e7b7a389";
        JPushClient jpushClient = new JPushClient(masterSecret, appKey);
        PushPayload payload = PushPayload.newBuilder()
                .setPlatform(Platform.ios())
                .setAudience(Audience.alias(user))
                .setNotification(Notification.newBuilder()
                        .addPlatformNotification(IosNotification.newBuilder()
                                .setAlert(msg)
                                .setBadge(+1)
                                .setSound("happy")
                                .addExtra("param", url)
                                .build())
                        .build())
                .setOptions(Options.newBuilder().setApnsProduction(false).build())
                .setMessage(Message.content(msg))
                .build();

        try {
            PushResult pu = jpushClient.sendPush(payload);

        } catch (APIConnectionException e) {
            e.printStackTrace();
        } catch (APIRequestException e) {
            e.printStackTrace();
        }
    }
}
