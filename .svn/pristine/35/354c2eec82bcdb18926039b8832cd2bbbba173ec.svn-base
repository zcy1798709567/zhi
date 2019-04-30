package com.oa.core.util;

import com.oa.core.bean.system.FormCustomMade;
import com.oa.core.bean.system.MyUrlRegist;
import com.oa.core.bean.user.UserManager;
import com.oa.core.bean.work.WorkFlowDefine;
import com.oa.core.service.system.AccessRightsService;
import com.oa.core.service.system.FormCustomMadeService;
import com.oa.core.service.system.MyUrlRegistService;
import com.oa.core.service.system.RoleDefinesService;
import com.oa.core.service.user.UserComputerService;
import com.oa.core.service.util.TableService;
import com.oa.core.service.work.WorkFlowDefineService;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.*;
/**
 * @ClassName:AccessUtil
 * @author:zxd
 * @Date:2018/11/15
 * @Time:下午 4:54
 * @Version V1.0
 * @Explain 权限工具类
 */
public class AccessUtil {

    private static FormCustomMadeService formCustomMadeService = (FormCustomMadeService) SpringContextUtil.getBean("formCustomMadeService");
    private static UserComputerService userComputerService = (UserComputerService) SpringContextUtil.getBean("userComputerService");
    private static RoleDefinesService roleDefinesService = (RoleDefinesService) SpringContextUtil.getBean("roleDefinesService");
    private static AccessRightsService accessRightsService = (AccessRightsService) SpringContextUtil.getBean("accessRightsService");
    private static MyUrlRegistService myUrlRegistService = (MyUrlRegistService) SpringContextUtil.getBean("myUrlRegistService");
    private static TableService tableService = (TableService) SpringContextUtil.getBean("tableService");
    private static WorkFlowDefineService workFlowDefineService = (WorkFlowDefineService) SpringContextUtil.getBean("workFlowDefineService");

    private static Map<String, Map<String, List<String>>> accmap = new HashMap<String, Map<String, List<String>>>();
    /**
     * 根据每个人不同的权限获取相应的菜单树
     * @param userName 账号
     * @return json格式菜单树
     * */
    public String resetMenu(String userName) {
        String menu = "";
        try {
            if ("admin".equals(userName)) {
                List<MyUrlRegist> plist = myUrlRegistService.selectAll();
                Map<String, JSONArray> maps = new HashMap<String, JSONArray>();
                for (MyUrlRegist myurl : plist) {
                    int menuNum = myurl.getMenuNum();
                    if (menuNum == 1) {
                        maps.put(myurl.getPageId(), new JSONArray());
                    }
                }
                menu = nextMenu(plist, maps);
            } else {
                List<String> roleids = roleDefinesService.getRoleIds(userName);
                roleids.add("allemployees");
                String rolestr = StringUtils.join(roleids, "','");
                rolestr = "'" + rolestr + "'";
                if (rolestr.length() > 3) {
                    List<String> pages = accessRightsService.selectPageids(rolestr);
                    String page = StringUtils.join(pages, "','");
                    page = "'" + page + "'";
                    if (page.length() > 3) {
                        List<MyUrlRegist> plist = myUrlRegistService.selectByIds(page);
                        Map<String, JSONArray> maps = new HashMap<String, JSONArray>();
                        for (int n = 0; n < plist.size(); n++) {
                            MyUrlRegist myurl = plist.get(n);
                            int menuNum = myurl.getMenuNum();
                            if (menuNum == 1) {
                                maps.put(myurl.getPageId(), new JSONArray());
                            }
                        }
                        menu = nextMenu(plist, maps);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            menu = "";
        }
        return menu;
    }

    /**
     * 根据每个人不同的权限获取相应的菜单树
     * @param plist 所有菜单
     * @param maps 根据pageid生成的集合
     * @return json格式菜单树
     * */
    public String nextMenu(List<MyUrlRegist> plist, Map<String, JSONArray> maps) {
        for (int i = 0; i < plist.size(); i++) {
            MyUrlRegist myurl = plist.get(i);
            int menuNum = myurl.getMenuNum();
            String id = myurl.getPageId();
            String pid = myurl.getParentId();
            String title = myurl.getPageTitle();
            String formid = myurl.getFormId();
            if (menuNum == 2) {
                int type = myurl.getFormType();
                String url = "/userpage/viewpage/" + id + ".do";
                if (type == 2) {
                    try {
                        WorkFlowDefine wkflw = workFlowDefineService.selectByPageId(id);
                        String wkflwId = wkflw.getWkflwID();
                        url = "/flowpage/flowviewpage/" + formid + ".do?wkflwId=" + wkflwId;
                    } catch (Exception e) {

                    }
                } else if (type == 3) {
                    FormCustomMade formcm = formCustomMadeService.selectFormCMByID(formid);
                    String page = formcm.getEditPage();
                    if(page.contains(".do")){
                        url = page;
                    }
                }
                JSONArray jsonArray = maps.get(pid);
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", id);
                jsonObject.put("title", title);
                jsonObject.put("url", url);
                jsonArray.put(jsonObject);
                maps.put(pid, jsonArray);
            }
        }
        JSONArray jsona = new JSONArray();
        for (int i = 0; i < plist.size(); i++) {
            MyUrlRegist myurl = plist.get(i);
            int menuNum = myurl.getMenuNum();
            String id = myurl.getPageId();
            String title = myurl.getPageTitle();
            if (menuNum == 1) {
                String menus = "";
                JSONArray jsonArray = maps.get(id);
                if (jsonArray != null) {
                    menus = jsonArray.toString();
                }
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", id);
                jsonObject.put("title", title);
                jsonObject.put("menus", menus);
                jsona.put(jsonObject);
            }
        }
        return jsona.toString();
    }

    /**
     * 生成菜单树的树状格式
     * @param myurllist 所有菜单
     * @return json格式菜单树
     * */
    public static String getMenu(List<MyUrlRegist> myurllist) {
        String menu = "";
        if (myurllist != null) {
            Map<String, Map<String, Object>> lmaps = new HashMap<String, Map<String, Object>>();
            Map<String, Object> maps = new HashMap<String, Object>();
            List<Map<String, Object>> lmap = new ArrayList<Map<String, Object>>();
            Map<String, Object> map = new HashMap<String, Object>();
            for (int n = 0; n < myurllist.size(); n++) {
                MyUrlRegist myurl = myurllist.get(n);
                int menuNum = myurl.getMenuNum();
                String id = myurl.getPageId();
                String pid = myurl.getParentId();
                String title = myurl.getPageTitle();
                if (menuNum == 1) {
                    maps = lmaps.get(id);
                    if (maps == null || maps.size() <= 0) {
                        maps = new HashMap<String, Object>();
                        maps.put("id", id);
                        maps.put("name", title);
                        maps.put("spread", true);
                        maps.put("alias", title);
                        maps.put("menuNum", 1);
                        lmap = new ArrayList<Map<String, Object>>();
                        maps.put("children", lmap);
                    } else {
                        if (maps.get("name") == "") {
                            maps.put("name", title);
                            maps.put("alias", title);
                        }
                    }
                    lmaps.put(id, maps);
                } else if (menuNum == 2) {
                    maps = lmaps.get(pid);
                    if (maps == null || maps.size() <= 0) {
                        maps = new HashMap<String, Object>();
                        maps.put("id", pid);
                        maps.put("name", "");
                        maps.put("spread", true);
                        maps.put("alias", "");
                        maps.put("menuNum", 1);
                        lmap = new ArrayList<Map<String, Object>>();
                        map = new HashMap<String, Object>();
                        map.put("id", id);
                        map.put("name", title);
                        map.put("spread", true);
                        map.put("alias", title);
                        map.put("menuNum", 2);
                        lmap.add(map);
                        maps.put("children", lmap);
                    } else {
                        lmap = (List<Map<String, Object>>) maps.get("children");
                        map = new HashMap<String, Object>();
                        map.put("id", id);
                        map.put("name", title);
                        map.put("spread", true);
                        map.put("alias", title);
                        map.put("menuNum", 2);
                        lmap.add(map);
                        maps.put("children", lmap);
                    }
                    lmaps.put(pid, maps);
                }
            }
            JSONArray json = new JSONArray(lmaps.values());
            menu = json.toString();
        }
        return menu;
    }

    /**
     * 获取个人常用菜单
     */
    public static List<Map<String,Object>> getUserMenuValue(String userId){
        List<Map<String, Object>> sqlvalue = null;
        if(userId!=null && !userId.equals("")) {
            String table = "wdcyc18121001";
            List<String> field = new ArrayList<>();
            field.add("cdmc181210001");
            field.add("cdzj181210001");
            field.add("cddz181210001");
            List<String> where = new ArrayList<>();
            where.add("(recordName='" + userId + "' or recordName='all')");
            String delsql = MySqlUtil.getSql(field, table, where, "order by cdpx181210001 asc");
            sqlvalue = tableService.selectSqlMapList(delsql);
        }
        return sqlvalue;
    }


    public static void initData() {
        initData("info");
        initData("add");
        initData("modi");
        initData("delete");
        initData("import");
        initData("export");
        initData("send");
    }

    public static void initData(String type) {
        String sql = "SELECT a.pageid as pageid,r.userName as userName FROM (select pageid,roleId from AccessRights where accessType ='" + type + "' and curStatus=2 GROUP BY roleid) a join roledefines r on a.roleId = r.roleId where r.curStatus=2";
        List<Map<String, String>> sqlvalue = accessRightsService.selectSqlMapList(type);
        for (Map<String, String> map : sqlvalue) {
            String pageid = map.get("pageid");
            Map<String, List<String>> acc = accmap.get(pageid);
            if (acc == null) {
                acc = new HashMap<String, List<String>>();
            }
            String userName = map.get("userName");
            List<String> users = Arrays.asList(userName.split(";"));
            acc.put(type, users);
            accmap.put(pageid, acc);
        }
    }

    /**
     * 获取每个页面按钮权限
     * @param loginid 登录人
     * @param pageid 页面ID
     * @param type 权限类型
     * @return 是否有权限
     * */
    public static boolean getData(String loginid, String pageid, String type) {
        if ("admin".equals(loginid)) {
            return true;
        }
        if (accmap == null) {
            initData(type);
            return false;
        } else {
            Map<String, List<String>> acc = accmap.get(pageid);
            if (acc == null) {
                initData(type);
                acc = accmap.get(pageid);
                if (acc == null) {
                    return false;
                } else {
                    List<String> userIds = acc.get(type);
                    if (userIds == null) {
                        return false;
                    } else {
                        return userIds.contains(loginid);
                    }
                }
            } else {
                List<String> userIds = acc.get(type);
                if (userIds == null) {
                    acc = accmap.get(pageid);
                    if (acc == null) {
                        return false;
                    } else {
                        userIds = acc.get(type);
                        if (userIds == null) {
                            return false;
                        } else {
                            return userIds.contains(loginid);
                        }
                    }
                } else {
                    return userIds.contains(loginid);
                }
            }
        }
    }

    /**
     * 获取每个页面按钮权限
     * @param user 登录人
     * @param pageid 页面ID
     * @return 按钮权限
     * */
    public static String getDataNum(String user, String pageid) {
        if ("admin".equals(user)) {
            return "111111";
        } else {
            boolean a = AccessUtil.getData(user, pageid, "add");
            boolean m = AccessUtil.getData(user, pageid, "modi");
            boolean d = AccessUtil.getData(user, pageid, "delete");
            boolean i = AccessUtil.getData(user, pageid, "import");
            boolean e = AccessUtil.getData(user, pageid, "export");
            boolean s = AccessUtil.getData(user, pageid, "send");
            String num = (a ? "1" : "0") + (m ? "1" : "0") + (d ? "1" : "0") + (i ? "1" : "0") + (e ? "1" : "0") + (s ? "1" : "0");
            return num;
        }
    }

    /**
     * 添加按钮权限
     * @param num 按钮权限
     * @return 是否存在
     * */
    public static boolean getAdd(String num) {
        //return "100".equals(num) || "110".equals(num) || "101".equals(num) || "111".equals(num);
        return num.substring(0,1).equals("1");
    }

    /**
     * 修改按钮权限
     * @param num 按钮权限
     * @return 是否存在
     * */
    public static boolean getModi(String num) {
        //return "010".equals(num) || "110".equals(num) || "011".equals(num) || "111".equals(num);
        return num.substring(1,2).equals("1");
    }

    /**
     * 删除按钮权限
     * @param num 按钮权限
     * @return 是否存在
     * */
    public static boolean getDelete(String num) {
        //return "001".equals(num) || "011".equals(num) || "101".equals(num) || "111".equals(num);
        return num.substring(2,3).equals("1");
    }

    /**
     * 导入Excel按钮权限
     * @param num 按钮权限
     * @return 是否存在
     * */
    public static boolean getImport(String num) {
        //return "001".equals(num) || "011".equals(num) || "101".equals(num) || "111".equals(num);
        return num.substring(3,4).equals("1");
    }

    /**
     * 导出Excel按钮权限
     * @param num 按钮权限
     * @return 是否存在
     * */
    public static boolean getExport(String num) {
        //return "001".equals(num) || "011".equals(num) || "101".equals(num) || "111".equals(num);
        return num.substring(4,5).equals("1");
    }

    /**
     * 发送按钮权限
     * @param num 按钮权限
     * @return 是否存在
     * */
    public static boolean getSend(String num) {
        //return "001".equals(num) || "011".equals(num) || "101".equals(num) || "111".equals(num);
        return num.substring(5,6).equals("1");
    }
}
