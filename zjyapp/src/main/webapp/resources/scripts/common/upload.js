function tclick(id) {//触发文件选择
    $('#'+id).click();
}

function uploadf(_this,id) {//上传
    let fileList = _this.files;
    let len = fileList.length;
    let formData = new FormData();
    for (let i = 0; i < len; i++) {
        formData.append("files", fileList[i]);
    }
    $.ajax({
        url: "/upload/files?pid="+projId,// url地址
        type: 'post',
        data: formData,
        contentType: false,
        processData: false
    }).done(function (data) {
        let urls = "";
        for (let i = 0, j = data.obj.length; i < j; i++) {
            let uplUrl = data.obj[i].message;//获取上传文件相对路径
            urls+= uplUrl+"|";
            let uname = uplUrl.split("/");
            let uplName = uname[uname.length-1];//获取文件名
            let id = uplName.split(".")[0];//获取文件名即id
            let type = uplName.split(".")[1];//获取文件类型
        }
        $('#'+id).val(urls);
    }).fail(function (data) {
        console.info(data);
    });
}