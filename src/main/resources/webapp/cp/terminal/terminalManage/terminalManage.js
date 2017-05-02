
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

var Header = React.createClass({
    render:function () {
        return(
            <ul className="operateMenu">
                <li> <img src="/img/terminal/terminal_add.png"/><a data-remodal-target="modal">添加</a></li>
                <li><img src="/img/terminal/terminal_add.png"/><a>删除</a></li>
                <li><img src="/img/terminal/terminal_add.png"/><a>重命名</a></li>
            </ul>
        )

    }
});

var Remodal = React.createClass({
    render:function () {
        return(
            <div className="remodal-bg">
                <div className="remodal" data-remodal-id="modal">
                    <button data-remodal-action="close" className="remodal-close"></button>
                    <form action={this.props.remodalDate.url}>
                    <h1>Remodal</h1>
                    <p>
                        {this.props.remodalDate.text}
                    </p>
                    <button data-remodal-action="cancel" className="remodal-cancel">删除</button>
                    <button data-remodal-action="confirm" className="remodal-confirm">确认</button>
                    </form>
                </div>
            </div>
        )

    }
});
var List = React.createClass({
    render:function () {
       return (
           <ul>
        {/*this.props.groupData.map(function (item,index){*/}
            {/*return <li>{item}</li>*/}
        {/*});*/}
               {
        this.props.groupData.map(function(item,index){
               return <li key={index}>{item}</li>
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
            tagData:[]

        }
    },
    componentWillMount:function () {
        // $.ajax({
        //     url:"getGroup.java",
        //     success:function (data) {
        //         this.setState(data)
        //     }
        // }
        // )
        var data = ["1","2","3"];
        this.setState({
            groupData:data
        })
        var data2 = [4,5,6];
        this.setState({
            tagData:data2
        }
        )
    },
    componentDidMount: function() {
        //注册函数
        var updateGroupState = (data)=> {
            this.setState( {
                data: data.lists
            } )
        };
        // subscribe( updateGroupState.bind( this ), taskListPub );
    },
    tagChange :function(index){
            return this.setState({currentIndex: index})
    },
    render:function(){
        const remodalDate = {
            text:this.state.currentIndex?"请输入分组的名称":"清输入标签的名称",
            url:this.state.currentIndex?"group.java":"tag.java"

        };
        return (<div className="container">
            <TabsControl baseWidth={400} tagChange = {this.tagChange} currentIndex = {this.state.currentIndex}>
                <Tab name="终端分组">
                    <Header/>
                    {/*<div className="terminal_group">我是终端分组</div>*/}
                    <List groupData={this.state.groupData}/>
                </Tab>
                <Tab name="终端标签">
                    <Header/>
                    {/*<div className="terminal_tag">我是终端标签</div>*/}
                    <List groupData={this.state.tagData}/>
                </Tab>
            </TabsControl>
            <Remodal remodalDate = {remodalDate}/>
        </div>);
    }
});

ReactDOM.render(
    <App/>,
    document.getElementById('app')
);
$(document).on('opening', '.remodal', function () {
    console.log('opening');
});

$(document).on('opened', '.remodal', function () {
    console.log('opened');
});

$(document).on('closing', '.remodal', function (e) {
    console.log('closing' + (e.reason ? ', reason: ' + e.reason : ''));
});

$(document).on('closed', '.remodal', function (e) {
    console.log('closed' + (e.reason ? ', reason: ' + e.reason : ''));
});

$(document).on('confirmation', '.remodal', function () {
    console.log('confirmation');
});

$(document).on('cancellation', '.remodal', function () {
    console.log('cancellation');
});

//  Usage:
//  $(function() {
//
//    // In this case the initialization function returns the already created instance
//    var inst = $('[data-remodal-id=modal]').remodal();
//
//    inst.open();
//    inst.close();
//    inst.getState();
//    inst.destroy();
//  });

//  The second way to initialize:
$('[data-remodal-id=modal]').remodal({
    modifier: 'with-red-theme'
});