let File = new Object({
    getFile: function (field) {
        let html = "";
        let id = field.name;
        let name = field.title;
        let value = field.value;
        let length = field.length;
        let required = field.required;
        let placeholder = field.placeholder;
        let decimal = field.decimal;
        let options = field.option;
        let option = [];
        if (options != null && options !== "") {
            var opval = options.split(/[\n,]/g);
            for (var i = 0, len = opval.length; i < len; i++) {
                var kn = opval[i].split(";");
                option[i] = {"id": kn[0], "name": kn[1]}
            }
        }
        if (length == null || length == "") {
            length = "30";
        }
        let data = {
            "id": id,
            "name": name,
            "value": value,
            "length": length,
            "placeholder": placeholder,
            "decimal": decimal,
            "option": option,
            "type": field.type,
            "taskName": field.taskName
        };
        oA.transform.content.helper("getidtoname", function (type, value) {
            return oa.decipher(type, value);
        });
        switch (field.type) {
            case 'pkid': //单行文本
                html = oA.transform.content("form-pkid", data);
                break;
            case 'text': //单行文本
                html = oA.transform.content("form-text", data);
                break;
            case 'textarea': //多行文本
                html = oA.transform.content("form-textarea", data);
                break;
            case 'select': //单选
                html = oA.transform.content("form-select", data);
                break;
            case 'selects': //多选
                html = oA.transform.content("form-selects", data);
                break;
            case 'date': //日期选择
                html = oA.transform.content("form-date", data);
                break;
            case 'datetime': //日期时间
                html = oA.transform.content("form-datetime", data);
                break;
            case 'int': //整数
                html = oA.transform.content("form-int", data);
                break;
            case 'decimal': //小数
                html = oA.transform.content("form-decimal", data);
                break;
            case 'user': //单选人
                html = oA.transform.content("form-user", data);
                break;
            case 'users': //多选人
                html = oA.transform.content("form-users", data);
                break;
            case 'dept': //单选部门
                html = oA.transform.content("form-dept", data);
                break;
            case 'depts': //多选部门
                html = oA.transform.content("form-depts", data);
                break;
            case 'form': //携带添加(单)
                html = oA.transform.content("form-form", data);
                break;
            case 'forms': //携带添加(多)
                html = oA.transform.content("form-forms", data);
                break;
            case 'upload': //单文件上传
                html = oA.transform.content("form-upload", data);
                break;
            case 'uploads': //多文件上传
                html = oA.transform.content("form-uploads", data);
                break;
            case 'child': //子表
                html = "child";
                break;
            case 'editor': //富文本
                html = "editor";
                break;
            default:
                html = oA.transform.content("form-text", data);
                break;
        }
        return html;
    }
});

function getFieldHtml(pageid, formid) {
    OA.axios("/weixin/tableform/formfield.do", {
        status: OA.operation.getQueryString("status"),
        pageid: OA.operation.getQueryString("pageid"),
        formid: OA.operation.getQueryString("formid"),
        recno: OA.operation.getQueryString("recno")
    }).done(function (data) {
        let fields = data.field;
        $("#formtitle").text(data.title);
        fields.forEach(function (item) {
            $('#formtable').append(File.getFile(item));
            switch (item.type) {
                case "selects":
                    $("#" + item.name + "_Value").selectpicker('refresh');
                    break;
                case "textarea":
                    autoTextarea(document.getElementById(item.name + "_Value"));
                    break;
                case "date":
                    fielddate(item.name + "_Value");
                    break;
                case "datetime":
                    fielddatetime(item.name + "_Value");
                    break;
                default:
                    break;
            }
        });
    });
}

function fielddate(id) {
    // 日期控件
    var currYear = (new Date()).getFullYear();
    var def = {
        theme: 'android-ics light', //皮肤样式
        display: 'modal', //显示方式
        mode: 'scroller', //日期选择模式
        dateFormat: 'yyyy-mm-dd',
        lang: 'zh',
        showNow: true,
        nowText: "今天",
        startYear: currYear - 3, //开始年份
        endYear: currYear + 2 //结束年份
    };
    $("#" + id).mobiscroll($.extend({preset: 'date'}, def));
}

function fielddatetime(id) {
    // 日期控件
    var currYear = (new Date()).getFullYear();
    var def = {
        theme: 'android-ics light', //皮肤样式
        display: 'modal', //显示方式
        mode: 'scroller', //日期选择模式
        dateFormat: 'yyyy-mm-dd',
        lang: 'zh',
        showNow: true,
        nowText: "今天",
        startYear: currYear - 3, //开始年份
        endYear: currYear + 2 //结束年份
    };
    $("#" + id).mobiscroll($.extend({preset: 'datetime'}, def));
}