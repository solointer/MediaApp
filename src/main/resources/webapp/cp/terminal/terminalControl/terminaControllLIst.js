var terminalListPub = new Deliver();
var terminalUpdateChecked = new Deliver();
var TerminalListHeader = React.createClass({
    render:function () {
        let that = this;
        return(
            <ul className="operateMenu">
                <li><a>刷新</a></li>
                <li><a id="excel_btn">导出</a></li>
                <li><a>详细信息</a></li>
            </ul>
        )
    }
});

var Table = React.createClass( {
    componentDidMount: function() {
        // $('#excel_btn').click(function(){
        //     $('#terminalListExport').tableExport({type:'excel',escape:'false', tableName:'终端列表'});
        // });
    },
    render: function() {
        var lists = this.props.terminalList.map( function( list, index ) {
            return <TableCell key={index+1}  data={list}/>
        } );
        return <table className='table table-bordered table-hover' id='#terminalListExport'>
            <thead>
            <tr>
                <td></td>
                <th>名称</th>
                <th>MAC地址</th>
                <th>审核状态</th>
                <th>分组</th>
                <th>安装位置</th>
                <th>型号</th>
                <th>屏幕类型</th>
                <th>输出接口</th>
                <th>到期时间</th>
            </tr>
            </thead>
            <tbody>
            {lists}
            </tbody>
        </table>
    }
} );

var TableCell = React.createClass( {
    handleChange:function (id) {
            terminalUpdateChecked.deliver(id);
    },
    render: function() {
        let that = this;
        let audit = this.props.data.audit_state>0?"已通过":"待审批";
        let time = convertTime(this.props.data.expired_date);
        let id = this.props.data.id;
        return  <tr>
            <td><input type="checkbox" onClick={()=>{that.handleChange(this.props.data.id)}} ref="terCheckBox" data-id = {id}/></td>
            <td>{this.props.data.name }</td>
            <td>{this.props.data.mac}</td>
            <td>{audit}</td>
            <td>{this.props.data.groupName}</td>
            <td>{this.props.data.location}</td>
            <td>{this.props.data.attrid}</td>
            <td>{this.props.data.output_res_h + '*' + this.props.data.output_res_v}</td>
            <td>{this.props.data.output_mode}</td>
            <td>{time}</td>
        </tr>
    }
} );

var App = React.createClass({
    getInitialState: function() {
        return {
            terminalList:[],
            checkedTer:[]
        }
    },
    componentWillMount:function () {
        console.log(this.state.checkedTer)
    },
    componentDidMount: function() {
        //注册函数
        var updateTerminalListState = (data)=> {
            this.setState( {
                terminalList: data
            } )
        };
        var updateCheckedTerminal = (id)=>{
            console.log(id);
            if(this.state.checkedTer.indexOf(id)>=0){
                this.setState({
                    checkedTer:this.state.checkedTer.remove(id)}
                )
            }else{
                this.setState({
                    checkedTer:this.state.checkedTer.push(id)}
            )
            }
        };
        subscribe( updateTerminalListState.bind( this ), terminalListPub );
        subscribe( updateCheckedTerminal.bind( this ), terminalUpdateChecked );
    },
    render:function(){

        return (
            <div>
                <TerminalListHeader/>
                <Table terminalList={this.state.terminalList} ></Table>
            </div>
        );
    }
});

ReactDOM.render(
    <App/>,
    document.getElementById('terminalTableDisplay')

);

$(function () {
    var timeid;
    $("#tab").find("li").each(function (index) {
        var sLi = $(this);
        sLi.click(function () {
            timeid = setTimeout(function () {
                sLi.addClass("current").siblings().removeClass("current");
                sLi.parent().next().find("ul:eq(" + index + ")").show().siblings().hide();
            }, 300);
        }).mouseleave(function () {
            clearTimeout(timeid);
        })
    })

    //初始化终端列表

    requestAjax( 'getAllTerminalList', 'json', function( obj ) {
        terminalListPub.deliver(obj.data);
    } );


});
window.onload = function () {
    $('#excel_btn').click(function(){
        $('table').tableExport({type:'excel',escape:'false', tableName:'终端列表'});
    });
}