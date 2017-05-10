//分页
function pagination( id, total, callBack, currentPage ) {
    var options = {
        bootstrapMajorVersion: 3,
        currentPage: currentPage || 1, //当前页数
        totalPages: total, //总页数
        numberOfPages: 8,
        itemTexts: function (type, page, current) {
            switch (type) {
                case "first":
                  return "首页";
                case "prev":
                  return "上一页";
                case "next":
                  return "下一页";
                case "last":
                  return "末页";
                case "page":
                  return page;
            }
        },

        //点击事件，用于通过Ajax来刷新整个list列表
        onPageChanged: function ( event, type, page ) {
            callBack( page );
        }
    };
    return $( '#' + id ).bootstrapPaginator( options );
}
//请求url对应的json数据，fun为请求成功回调函数
function requestAjax( url, dataType, successFun, errorFun ) {
    dataType = dataType || 'text';
    errorFun = errorFun || $.noop;

    $.ajax( {
        type: 'POST',
        url: url,
        dataType: dataType,
        success: function( json ) {
            successFun( json );
        },
        error: function() {
            errorFun();
        }
    } );
}
