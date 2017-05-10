var terminalListPub = new Deliver();
var terminalUpdateChecked = new Deliver();
var terminalGroupListPub = new Deliver();
var terminalTagListPub = new Deliver();
var taskListPagenation = pagenation();
var TerminalListHeader = React.createClass({
    deleteCheckedTer:function () {
        this.props.terminalListHeaderProps.deleteCheckedTer();
    },
    render:function () {
        let that = this;
        const createTerminalRemodalProps = {
            terminalGroupList:this.props.terminalListHeaderProps.terminalGroupList,
            terminalTagList:this.props.terminalListHeaderProps.terminalTagList,
            createTerminal:this.props.terminalListHeaderProps.createTerminal
        };
        return(
            <ul className="operateMenu">
                <li><a data-remodal-target="createTerminal">添加</a></li>
                <li><a onClick={()=>{ that.deleteCheckedTer()}}>删除</a></li>
                <li><a>编辑</a></li>
                <li><a>审批</a></li>
                <li><a>设置</a></li>
            <CreateTerminalRemodal createTerminalRemodalProps={createTerminalRemodalProps}/>
            </ul>
        )
    }
});
var CreateTerminalRemodal = React.createClass({
    createTermianl:function () {
        var obj = getTerminalForm();
        createTerminal.close();
        this.props.createTerminalRemodalProps.createTerminal(obj);
    },
    render:function () {
        let that = this;
        var groupLists = this.props.createTerminalRemodalProps.terminalGroupList.map( function( list, index ) {
            return <option key={list.id} data-id={list.id}>{list.name}</option>
        } );
        var tagLists = this.props.createTerminalRemodalProps.terminalTagList.map( function( list, index ) {
            return <option key={list.id} data-id={list.id}>{list.name}</option>
        } );
        return(
            <div className="remodal-bg">
                <div className="remodal" data-remodal-id="createTerminal">
                    <button data-remodal-action="close" className="remodal-close"></button>
                    <ul id="tab">
                        <li className="current">基本属性</li>
                        <li>网络属性</li>
                        <li>播放属性</li>
                        <li>高级属性</li>
                    </ul>
                    <div id="content">
                        <ul>
                            <li>
                            <div className="form-inline">
                                <div className="form-group">
                                    <label>MAC地址</label>
                                    <input type="text" className="form-control terminal_macAddress"/>
                                </div>
                                <div className="form-group">
                                    <label>终端名称</label>
                                    <input type="text" className="form-control terminal_name"/>
                                </div>
                            </div>
                            <div className="form-inline">
                                <div className="form-group">
                                    <label>安装位置</label>
                                    <input type="text"  className="form-control terminal_location"/>
                                </div>
                                <div className="form-group">
                                    <label>安装城市</label>
                                    <input type="text" className="form-control terminal_city"/>
                                </div>
                            </div>
                             <div className="form-inline">
                                <div className="form-group">
                                    <label>分组</label>
                                    <select className="form-control terminal_group">
                                        {groupLists}
                                    </select>
                                </div>
                                 <div className="form-group">
                                     <label>标签</label>
                                     <select className="form-control terminal_tag">
                                         {tagLists}
                                     </select>
                                 </div>
                              </div>

                            </li>
                        </ul>
                        <ul>
                            <li>
                                <div className="form-inline">
                                    <div className="form-group">
                                        <label>网络输入方式</label>
                                            <select className="form-control">
                                               <option>DHCP</option>
                                                <option>3</option>
                                                <option>GPPPOE</option>
                                                <option>静态IP</option>
                                            </select>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <div className="form-inline">
                                <div className="form-group">
                                    <label>信号输出类型</label>
                                    <select className="form-control">
                                        <option>AV</option>
                                        <option>HDMI</option>
                                        <option>YBppr</option>
                                        <option>SVideo</option>
                                        <option>VGA</option>
                                    </select>
                                </div>
                                <div className="form-group">
                                    <label>终端显示类型</label>
                                    <select className="form-control">
                                        <option>横屏</option>
                                    </select>
                                </div>
                            </div>
                                <div className="form-inline">
                                    <div className="form-group">
                                        <label>信号输出分辨率</label>
                                        <select className="form-control terminal_ratio">
                                            <option>1280*70</option>
                                        </select>
                                    </div>
                                    <div className="form-group">
                                        <label>终端显示比例</label>
                                        <select className="form-control terminal_scale">
                                            <option>16：9</option>
                                        </select>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <div className="form-inline">
                                    <div className="form-group">
                                        <label>OSD语言</label>
                                        <select className="form-control terminal_lang">
                                            <option value="chinese">中文</option>
                                            <option value="english">英文</option>
                                        </select>
                                    </div>
                                    <div className="form-group">
                                        <label>下载速度</label>
                                        <input type="text" className="form-control terminal_enable"/>
                                    </div>
                                </div>
                                <div className="form-inline">
                                    <div className="form-group">
                                        <label>心跳时间</label>
                                        <input type="text" className="form-control terminal_interval"/>
                                    </div>
                                    <div className="form-group">
                                        <label>自动清理文件天数</label>
                                        <input type="text" className="form-control terminal_keepDays"/>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <button data-remodal-action="cancel" className="remodal-cancel">删除</button>
                    <button  className="remodal-confirm" onClick={()=>{that.createTermianl()}}>确定</button>
                </div>
            </div>
        )

    }
});

var Table = React.createClass( {
    render: function() {
        var lists = this.props.terminalList.map( function( list, index ) {
            return <TableCell key={index+1}  data={list}/>
        } );
        return <table className='table table-bordered table-hover'>
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
            checkedTer:[],
            terminalGroupList:[],
            terminalTagList:[]

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
        var updateGroupState = (data)=> {
            this.setState( {
                terminalGroupList: data
            })
        };
        var updateTagState = (data)=> {
            this.setState( {
                terminalTagList: data
            } )
        };
        subscribe( updateTerminalListState.bind( this ), terminalListPub );
        subscribe( updateCheckedTerminal.bind( this ), terminalUpdateChecked );
        //注册函数(之所以注册函数实现ajax实现状态的更新，主要是为了避免更新其他的状态无谓的发送ajax)
        subscribe( updateTagState.bind( this ), terminalTagListPub );
        subscribe( updateGroupState.bind( this ), terminalGroupListPub );
    },
    deleteCheckedTer:function () {
        var terIdList = this.state.checkedTer.length>0?this.state.checkedTer.join(","):this.state.checkedTer;
        console.log(terIdList);
        requestAjax( "deleteTerminal?terIdArray="+terIdList ,'json', function( stateObj ) {
            terminalListPub.deliver(stateObj.data);
        } );
    },
    createTerminal:function (data) {
        console.log("----------------");
        console.log(data);
        requestAjax( "createTerminal?"+data ,'json', function( data ) {
            if(data.result){
                taskListPagenation.requestPage( 1 );
            }
        } );
    },
    render:function(){
        const terminalListHeaderProps = {
            deleteCheckedTer:this.deleteCheckedTer,
            terminalGroupList:this.state.terminalGroupList,
            terminalTagList:this.state.terminalTagList,
            createTerminal:this.createTerminal
        };
        return (
            <div>
                <TerminalListHeader terminalListHeaderProps={terminalListHeaderProps}/>
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

    taskListPagenation.init( {
        url: 'ajax_terminal_list',
        isCache: true,
        successCb: function( pageInfo ) {
            terminalListPub.deliver( pageInfo.data );
                pagination( 'project-page',pageInfo.totalPages, function( page ) {
                    taskListPagenation.requestPage( page )
                }, pageInfo.currentPage  );
        }
    } );
    taskListPagenation.requestPage( 1 );
});

requestAjax( 'getAllGroup', 'json', function( result ) {
    terminalGroupListPub.deliver(result.data);
} );
requestAjax( 'getAllTags', 'json', function( result ) {
    terminalTagListPub.deliver(result.data);
} );
//获取终端表单的数据
function getTerminalForm(){
    var obj = {};
    var mac = $(".terminal_macAddress").val();
    obj.mac = mac;
    var name = $(".terminal_name").val();
    obj.name = name;
    var location = $(".terminal_location").val();
    obj.location = location;
    var city = $(".terminal_city").val();
    obj.city = city;
    var group_id = $(".terminal_group").find("option:selected").attr("data-id");
    var no = $(".terminal_group").val();
    obj.group_id = group_id;
    obj.no = no;
    var ratio = $(".terminal_ratio").val().split("*");
    var output_res_h = ratio[0];
    obj.output_res_h = output_res_h;
    var output_res_v = ratio[1];
    obj.output_res_v = output_res_v;
    var display_scale = $(".terminal_scale").val();
    obj.display_scale = display_scale;
    var osd_lang = $(".terminal_lang").val();
    obj.osd_lang = osd_lang;
    var heartbeat_interval = $(".terminal_interval").val();
    obj.heartbeat_interval = heartbeat_interval;
    var enable_rc  = $(".terminal_enable").val();
    obj.enable_rc = enable_rc;
    var file_keep_days  = $(".terminal_keepDays").val();
    obj.file_keep_days = file_keep_days;
    var data = "mac="+obj.mac+"&name="+obj.name+"&location="+obj.location+"&city="+obj.city+"&group_id="+obj.group_id+"&no="+no+
        "&output_res_h="+obj.output_res_h+"&output_res_v="+output_res_v+"&display_scale="+display_scale+"&osd_lang="+osd_lang+
            "&heartbeat_interval="+heartbeat_interval+"&enable_rc="+enable_rc+"&file_keep_days="+file_keep_days;
    console.log(data);
    return data;
}
var createTerminal = $('[data-remodal-id=createTerminal]').remodal();
