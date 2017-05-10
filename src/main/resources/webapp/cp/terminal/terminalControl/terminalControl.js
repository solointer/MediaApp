 var taskListPub = new Deliver();
 var tagListPub = new Deliver();
var TabsControl = React.createClass({
    // getInitialState: function(){
    //     return {currentIndex: 0}
    // },
    getTitleItemCssClasses: function(index){
        return index === this.props.currentIndex ? "tab-title-item active" : "tab-title-item";
    },

    getContentItemCssClasses: function(index){
        return index === this.props.currentIndex ? "tab-content-item active" : "tab-content-item";
    },
    tagChange:function (index) {
        this.props.tagChange(index)
    },
    render: function(){
        let that = this;
        let {baseWidth} = this.props;
        let childrenLength = this.props.children.length;
        return (
            <div>
                <nav className="tab-title-items">
                    {React.Children.map(this.props.children, (element, index) => {
                        return (<div onClick={()=>{that.tagChange(index)}} className={that.getTitleItemCssClasses(index)}>{element.props.name}</div>)
                    })}
                </nav>
                <div className="tab-content-items">
                    {React.Children.map(this.props.children, (element, index) => {
                        return (<div className={that.getContentItemCssClasses(index)}>{element}</div>)
                    })}
                </div>
            </div>
        )
    }
});
var Tab = React.createClass({
    render: function(){
        return (<div>{this.props.children}</div>);
    }
});

var GroupHeader = React.createClass({
    render:function () {
        return(
            <ul className="operateMenu">
                <li><a data-remodal-target="modal">添加</a></li>
                <li><a onClick={()=>{this.props.deleteGroup()}}>删除</a></li>
                <li><a data-remodal-target="modalUpdate">重命名</a></li>
                <li><a>刷新</a></li>
                <li><a>设置</a></li>
            </ul>
        )

    }
});
 var TagHeader = React.createClass({
     render:function () {
         return(
             <ul className="operateMenu">
                 <li><a data-remodal-target="createTagRemodal">添加</a></li>
                 <li><a onClick={()=>{this.props.deleteTag()}}>删除</a></li>
                 <li><a data-remodal-target="modalUpdateTag">重命名</a></li>
                 <li><a>刷新</a></li>
                 <li><a>设置</a></li>
             </ul>
         )

     }
 });

var Remodal = React.createClass({

    addGroup:function () {
        var groupName = $("#name").val();
       this.props.remodalDate.createGroup(groupName)
    },
    render:function () {
        let that = this;
        return(
            <div className="remodal-bg">
                <div className="remodal" data-remodal-id="modal">
                    <button data-remodal-action="close" className="remodal-close"></button>
                    <h1>Remodal</h1>
                    <p>
                        {this.props.remodalDate.text}
                    </p>
                        {/*<input  name="parentGroupId" value={this.props.remodalDate.selectedParentGroup} type="hidden" id="parentGroupId"/>*/}
                        {/*<input type="text" name="name" id="name"/>*/}
                            <div className="form-group">
                                <input type="text" class="form-control" name="name" id="name"/>
                            </div>
                        <br/>
                    <button data-remodal-action="cancel" className="remodal-cancel">删除</button>
                    <button  className="remodal-confirm" onClick={()=>{that.addGroup()}}>确定</button>
                </div>
            </div>
        )

    }
});
 var UpdateGroupRemodal = React.createClass({
     updateGroup:function () {
         var groupName = $("#newGroupName").val();
         inst.clsose();
         this.props.updateGroup(groupName)
     },
     render:function () {
         let that = this;
         return(
             <div className="remodal-bg">
                 <div className="remodal" data-remodal-id="modalUpdate">
                     <button data-remodal-action="close" className="remodal-close"></button>
                     <h1>分组更新</h1>
                     <p>
                         请输入新的分组名称
                     </p>
                     {/*<input  name="parentGroupId" value={this.props.remodalDate.selectedParentGroup} type="hidden" id="parentGroupId"/>*/}
                     {/*<input type="text" name="newGroupName" id="newGroupName"/>*/}
                     <div className="form-group">
                         <input type="text" class="form-control" name="newGroupName" id="newGroupName"/>
                     </div>
                     <br/>
                     <button data-remodal-action="cancel" className="remodal-cancel">删除</button>
                     <button  className="remodal-confirm" onClick={()=>{that.updateGroup()}}>确定</button>
                 </div>
             </div>
         )

     }
 });
 var UpdateTagRemodal = React.createClass({
     updateTag:function () {
         var tagName = $("#newTagName").val();
         modalUpdateTag.close();
         this.props.updateTag(tagName)
     },
     render:function () {
         let that = this;
         return(
             <div className="remodal-bg">
                 <div className="remodal" data-remodal-id="modalUpdateTag">
                     <button data-remodal-action="close" className="remodal-close"></button>
                     <h1>标签更新</h1>
                     <p>
                         请输入新的标签名称
                     </p>
                     {/*<input  name="parentGroupId" value={this.props.remodalDate.selectedParentGroup} type="hidden" id="parentGroupId"/>*/}
                     {/*<input type="text" name="newTagName" id="newTagName"/>*/}
                     <div className="form-group">
                         <input  class="form-control"type="text" name="newTagName" id="newTagName"/>
                     </div>
                     <br/>
                     <button data-remodal-action="cancel" className="remodal-cancel">删除</button>
                     <button  className="remodal-confirm" onClick={()=>{that.updateTag()}}>确定</button>
                 </div>
             </div>
         )

     }
 });
 var CreateTagRemodal = React.createClass({
     createTag:function () {
         var tagName = $("#TagName").val();
         createTagRemodal.close();
         this.props.createTag(tagName)
     },
     render:function () {
         let that = this;
         return(
             <div className="remodal-bg">
                 <div className="remodal" data-remodal-id="createTagRemodal">
                     <button data-remodal-action="close" className="remodal-close"></button>
                     <h1>创建标签</h1>
                     <p>
                         请输入标签名称
                     </p>
                     {/*<input  name="parentGroupId" value={this.props.remodalDate.selectedParentGroup} type="hidden" id="parentGroupId"/>*/}
                     {/*<input type="text" name="newTagName" id="TagName"/>*/}
                     <div className="form-group">
                         <input  class="form-control"type="text" name="newTagName" id="TagName"/>
                     </div>
                     <br/>
                     <button data-remodal-action="cancel" className="remodal-cancel">删除</button>
                     <button  className="remodal-confirm" onClick={()=>{that.createTag()}}>确定</button>
                 </div>
             </div>
         )

     }
 });
var List = React.createClass({
    getParentNum:function (parentId) {
        if(this.props.groupData){
            this.props.getSelectedParentGroup(parentId);
        }
    },
    render:function () {
        let that = this;
        let groupObj = {}
        this.props.groupData.map(function(item,index){
           groupObj[item.id] = item;
        });
       return (
           <ul className="list">
        {/*this.props.groupData.map(function (item,index){*/}
            {/*return <li>{item}</li>*/}
        {/*});*/}
               {
        this.props.groupData.map(function(item,index){

            var parentGroupName = item.id != item.parent_id?groupObj[item.parent_id]['name']+"/":"";
            {/*var item2 = item;*/}
            {/*do{*/}
                {/*item2 = groupObj[item2.parent_id];*/}
                {/*parentGroupName = groupObj[item2.parent_id]['name']+"/"*/}
            {/*}while (item2.id != item2.parent_id);*/}
               return <li key={index} onClick={()=>{that.getParentNum(item.id)}}>{parentGroupName}{item.name}</li>
           })
               }
        </ul>
       )
    }
});
var TagList = React.createClass({
    getSelectedTagId:function (parentId) {

             this.props.getSelectedTagId(parentId);
     },
     render:function () {
         let that = this;
         return (
             <ul className="list">
                 {
                     this.props.tagData.map(function(item,index){
                         return <li key={index} onClick={()=>{that.getSelectedTagId(item.id)}}>{item.name}</li>
                     })
                 }
             </ul>
         )
     }
 });
var App = React.createClass({

    getInitialState: function() {
        return {
            currentIndex: 0,
            groupData:[],
            selectedParentGroup:-1,//当前选择的分组的id,没有选择时候为负数
            tagData:[],
            selectedTagId:-1

        }
    },
    componentWillMount:function () {
    },
    componentDidMount: function() {
        //注册函数
        var updateGroupState = (data)=> {
            this.setState( {
                groupData: data
            } )
        };
        subscribe( updateGroupState.bind( this ), taskListPub );
        var updateTagState = (data)=> {
            this.setState( {
                tagData: data
            } )
        };
        subscribe( updateTagState.bind( this ), tagListPub );
    },
    //选项卡切换
    tagChange :function(index){
            return this.setState({currentIndex: index})
    },
    //获取选中的父分组
    getSelectedParentGroup:function (parentId) {
        return this.setState({selectedParentGroup:parentId})
    },
    //
    getSelectedTagId:function (id) {
        return this.setState({selectedTagId:id})
    },
    //删除分组
    deleteGroup:function () {
        requestAjax( 'deleteGroup?groupId='+this.state.selectedParentGroup, 'json', function( stateObj ) {
            taskListPub.deliver(stateObj.data);
        } );
    },
    deleteTag:function () {
        requestAjax( 'deleteTag?tagId='+this.state.selectedTagId, 'json', function( stateObj ) {
            tagListPub.deliver(stateObj.data);
        } );
    },
    //分组的重命名
    updateGroup:function (newGroupName) {
        requestAjax( "updateGroup?newGroupName="+newGroupName+"&groupId="+this.state.selectedParentGroup, 'json', function( stateObj ) {
            taskListPub.deliver(stateObj.data);
        } );
    },
    updateTag:function (newTagName) {
        requestAjax( "updateTag?newTagName="+newTagName+"&tagId="+this.state.selectedTagId, 'json', function( stateObj ) {
            tagListPub.deliver(stateObj.data);
        } );
    },
    createGroup:function (groupName) {
        requestAjax( "addTerminalGroup?name="+groupName+"&parentGroupId="+this.state.selectedParentGroup, 'json', function( stateObj ) {
            taskListPub.deliver(stateObj.data);
        } );
    },
    createTag:function (tagName) {
        requestAjax( "createTag?tagName="+tagName, 'json', function( stateObj ) {
            tagListPub.deliver(stateObj.data);
        } );
    },
    render:function(){
        const remodalDate = {
            text:"清输入分组的名称",
            selectedParentGroup:this.state.selectedParentGroup,
            createGroup:this.createGroup
        };
        return (<div className="container">
            <TabsControl baseWidth={400} tagChange = {this.tagChange} currentIndex = {this.state.currentIndex}>
                <Tab name="终端分组">
                    <GroupHeader deleteGroup={this.deleteGroup}/>
                    {/*<div className="terminal_group">我是终端分组</div>*/}
                    <List groupData={this.state.groupData} getSelectedParentGroup={this.getSelectedParentGroup}/>
                </Tab>
                <Tab name="终端标签">
                    <TagHeader deleteTag={this.deleteTag}/>
                    {/*<div className="terminal_tag">我是终端标签</div>*/}
                    <TagList tagData={this.state.tagData} getSelectedTagId={this.getSelectedTagId}/>
                </Tab>
            </TabsControl>
            <Remodal remodalDate = {remodalDate}/>
            <UpdateGroupRemodal updateGroup={this.updateGroup}/>
            <UpdateTagRemodal updateTag={this.updateTag}/>
            <CreateTagRemodal createTag={this.createTag}/>
        </div>);
    }
});

ReactDOM.render(
    <App/>,
    document.getElementById('app')
);

// $(document).on('opening', '.remodal', function () {
//     console.log('opening');
// });
//
// $(document).on('opened', '.remodal', function () {
//     console.log('opened');
// });
//
// $(document).on('closing', '.remodal', function (e) {
//     console.log('closing' + (e.reason ? ', reason: ' + e.reason : ''));
// });
//
// $(document).on('closed', '.remodal', function (e) {
//     console.log('closed' + (e.reason ? ', reason: ' + e.reason : ''));
// });
//
// $(document).on('confirmation', '.remodal', function () {
//     console.log('confirmation');
// });
//
// $(document).on('cancellation', '.remodal', function () {
//     console.log('cancellation');
// });
 var inst = $('[data-remodal-id=modalUpdate]').remodal();
 var modalUpdateTag = $('[data-remodal-id=modalUpdateTag]').remodal();
 var createTagRemodal = $('[data-remodal-id=createTagRemodal]').remodal();

requestAjax( 'getAllGroup', 'json', function( stateObj ) {
    taskListPub.deliver(stateObj.data);
} );
 requestAjax( 'getAllTags', 'json', function( stateObj ) {
     tagListPub.deliver(stateObj.data);
 } );
 $(function(){

     $(".list li").click(function() {

         $(this).siblings('li').removeClass('selected');  // 删除其他兄弟元素的样式

         $(this).addClass('selected');                            // 添加当前元素的样式

     });

 });
 // requestAjax( 'getAllTags', 'json', function( stateObj ) {
//     // if( stateObj.bizNo > 0 ) {
//     //     //无论是否成功都去更新状态
//     //     fillTalbeConfig( stateObj.netConf );
//     //     mySlider.bootstrapSlider( 'setValue', stateObj.netConf.bandwidth );
//     //     if( stateObj.netConfNo > 0 ) {
//     //         $loading.hide();
//     //         pop.success( '修改成功!' );
//     //     } else {
//     //         pop.error( '修改失败!' );
//     //     }
//     // } else {
//     //     pop.error( bizMsg );
//     // }
//     // $loading.hide();
//     // $( '#configModel' ).modal( 'hide' );
//     taskListPub.deliver(stateObj.data);
// } );