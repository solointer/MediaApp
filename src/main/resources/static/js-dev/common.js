
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
