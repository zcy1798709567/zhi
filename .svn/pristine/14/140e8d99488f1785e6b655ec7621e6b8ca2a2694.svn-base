package com.oa.core.util;

import com.oa.core.bean.dd.FieldData;
import com.oa.core.bean.module.Department;
import com.oa.core.helper.StringHelper;
import com.oa.core.listener.InitDataListener;
import com.oa.core.service.ListenerService;
import com.oa.core.service.dd.DictionaryService;
import com.oa.core.service.module.DepartmentService;
import com.oa.core.tag.UserDict;

import java.util.*;

public class DDUtil {

    private static Map<String, FieldData> data = null;
    public boolean fieldCheck(String type,String value){
        return checkWeight("fieldData",type,value);
    }
    public boolean tableCheck(String type,String value){
        return checkWeight("tableData",type,value);
    }
    public boolean taskCheck(String type,String value){
        return checkWeight("taskData",type,value);
    }

    static {
        initFieldData();
    }

    public static void resetData() {
        if (data != null) {
            data.clear();
        }
        data = null;
    }

    public static void initFieldData() {
        ListenerService listenerService = (ListenerService) SpringContextUtil.getBean("listenerService");
        List<FieldData> tableList = listenerService.listenerField();
        if (tableList.size() > 0) {
            data = new HashMap<String, FieldData>();
            for (FieldData f : tableList) {
                data.put(f.getFieldName(), f);
            }
        }
    }
    public static void initFieldData(String name) {
        DictionaryService d = (DictionaryService) SpringContextUtil.getBean("dictionaryService");
        FieldData fieldData = d.selectFieldName(name);
        if (fieldData != null) {
            data.put(fieldData.getFieldName(), fieldData);
        }
    }
    public static FieldData getFieldData(String name) {
        if (data == null) {
            initFieldData();
        }
        if (data != null) {
            FieldData result = data.get(name);
            if (result == null) {
                initFieldData(name);
                return data.get(name);
            } else {
                return result;
            }
        }
        return null;
    }

    public boolean checkWeight(String key, String type,String value){
        Hashtable<String,String> fd = InitDataListener.getMapData(key);
        if(type.equals("name")) {
            if(fd.containsKey(value)){
                return true;
            }else{
                return false;
            }
        }else if(type.equals("title")){
            if(fd.containsValue(value)){
                return true;
            }else{
                return false;
            }
        }
        return false;
    }

    public String fieldIDtoName(String id){
        return idtoname("fieldData",id);
    }

    public String tableIDtoName(String id){
        return idtoname("tableData",id);
    }

    public String taskIDtoName(String id){
        return idtoname("taskData",id);
    }

    public String userIDtoName(String id){
        return idtoname("user",id);
    }

    public String idtoname(String key,String id){
        Hashtable<String,String> fd = InitDataListener.getMapData(key);
        return fd.get(id);
    }

    public static String selectIdToName(String name,String fieldValue) {
        FieldData fieldData = getFieldData(name);
        String value = "";
        if (fieldData != null) {
            String optionVal = fieldData.getOptionVal();
            if(optionVal!=null) {
                String[] option = optionVal.split("\n");
                if (fieldValue.indexOf(",") >= 0) {
                    for (String o : option) {
                        if(o.contains(";")) {
                            String[] op = o.split(";");
                            Vector<String> val = StringHelper.string2Vector(fieldValue, ",");
                            if (val.contains(op[0])) {
                                value += op[1] + " ";
                            }
                        }else{
                            value += fieldValue + " ";
                        }
                    }
                } else {
                    for (String o : option) {
                        if(o.contains(";")) {
                            String[] op = o.split(";");
                            if (fieldValue.equals(op[0])) {
                                value += op[1] + " ";
                            }
                        }else{
                            value += fieldValue + " ";
                        }
                    }
                }
                return value;
            }else{
                return fieldValue;
            }
        } else{
            return fieldValue;
        }

    }
}
