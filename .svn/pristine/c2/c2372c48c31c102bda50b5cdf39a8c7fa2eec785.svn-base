oA.open = function (that, id, pathName, type,taskName) {
    let parameter = OA.str;
    switch (pathName) {
        case "employees":
            parameter = "?id=" + id + "&type=" + type;
            break;
        case "formselect":
            parameter = "?id=" + id + "&type=" + type + "&userid="+OA.operation.getQueryString('userid')+"&pageid="+taskName;
            break;
        case "department":
            parameter = "?id=" + id + "&type=" + type;
            break;
    }
    parameter = oA.url.alertPage(pathName) + parameter + "&rd=" + Math.random();
    oA.openPage = layer.open({
        type: 1,
        content: "<iframe src='" + parameter + "' width='100%' height='" + document.documentElement.clientHeight + "' scrolling='0' frameborder='no'></iframe>",
        anim: 'up',
        style: 'position:fixed; left:0; top:0; width:100%; height:100%; border: none; -webkit-animation-duration: .5s; animation-duration: .5s;'
    });
}