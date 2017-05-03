"use strict";

(function e(t, n, r) {
    function s(o, u) {
        if (!n[o]) {
            if (!t[o]) {
                var a = typeof require == "function" && require;if (!u && a) return a(o, !0);if (i) return i(o, !0);throw new Error("Cannot find module '" + o + "'");
            }var f = n[o] = { exports: {} };t[o][0].call(f.exports, function (e) {
                var n = t[o][1][e];return s(n ? n : e);
            }, f, f.exports, e, t, n, r);
        }return n[o].exports;
    }var i = typeof require == "function" && require;for (var o = 0; o < r.length; o++) {
        s(r[o]);
    }return s;
})({ 1: [function (require, module, exports) {
        var taskListPub = new Deliver();
        var TabsControl = React.createClass({ displayName: "TabsControl",
            // getInitialState: function(){
            //     return {currentIndex: 0}
            // },
            getTitleItemCssClasses: function getTitleItemCssClasses(index) {
                return index === this.props.currentIndex ? "tab-title-item active" : "tab-title-item";
            },

            getContentItemCssClasses: function getContentItemCssClasses(index) {
                return index === this.props.currentIndex ? "tab-content-item active" : "tab-content-item";
            },
            tagChange: function tagChange(index) {
                this.props.tagChange(index);
            },
            render: function render() {
                var that = this;
                var baseWidth = this.props.baseWidth;

                var childrenLength = this.props.children.length;
                return React.createElement("div", null, React.createElement("nav", { className: "tab-title-items" }, React.Children.map(this.props.children, function (element, index) {
                    return React.createElement("div", { onClick: function onClick() {
                            that.tagChange(index);
                        }, className: that.getTitleItemCssClasses(index) }, element.props.name);
                })), React.createElement("div", { className: "tab-content-items" }, React.Children.map(this.props.children, function (element, index) {
                    return React.createElement("div", { className: that.getContentItemCssClasses(index) }, element);
                })));
            }
        });
        var Tab = React.createClass({ displayName: "Tab",
            render: function render() {
                return React.createElement("div", null, this.props.children);
            }
        });

        var GroupHeader = React.createClass({ displayName: "GroupHeader",
            render: function render() {
                var _this = this;

                return React.createElement("ul", { className: "operateMenu" }, React.createElement("li", null, React.createElement("a", { "data-remodal-target": "modal" }, "添加")), React.createElement("li", null, React.createElement("a", { onClick: function onClick() {
                        _this.props.deleteGroup();
                    } }, "删除")), React.createElement("li", null, React.createElement("a", null, "重命名")), React.createElement("li", null, React.createElement("a", null, "刷新")), React.createElement("li", null, React.createElement("a", null, "设置")));
            }
        });
        var TagHeader = React.createClass({ displayName: "TagHeader",
            render: function render() {
                return React.createElement("ul", { className: "operateMenu" }, React.createElement("li", null, React.createElement("a", { "data-remodal-target": "modal" }, "添加")), React.createElement("li", null, React.createElement("a", null, "删除")), React.createElement("li", null, React.createElement("a", null, "重命名")), React.createElement("li", null, React.createElement("a", null, "刷新")), React.createElement("li", null, React.createElement("a", null, "设置")));
            }
        });

        var Remodal = React.createClass({ displayName: "Remodal",

            add: function add(url) {
                var parentGroupId = $("#parentGroupId").val();
                var groupName = $("#name").val();
                console.log(parentGroupId);
                console.log(groupName);
                requestAjax(url, 'json', function (stateObj) {
                    taskListPub.deliver(stateObj.data);
                });
            },
            render: function render() {
                var _this2 = this;

                var that = this;
                return React.createElement("div", { className: "remodal-bg" }, React.createElement("div", { className: "remodal", "data-remodal-id": "modal" }, React.createElement("button", { "data-remodal-action": "close", className: "remodal-close" }), React.createElement("form", { action: this.props.remodalDate.url, method: "get" }, React.createElement("h1", null, "Remodal"), React.createElement("p", null, this.props.remodalDate.text), React.createElement("input", { name: "parentGroupId", value: this.props.remodalDate.selectedParentGroup, type: "hidden", id: "parentGroupId" }), React.createElement("input", { type: "text", name: "name", id: "name" }), React.createElement("br", null), React.createElement("button", { "data-remodal-action": "cancel", className: "remodal-cancel" }, "删除"), React.createElement("button", { className: "remodal-confirm", onClick: function onClick() {
                        that.add(_this2.props.remodalDate.url);
                    } }, "确定"))));
            }
        });
        var List = React.createClass({ displayName: "List",
            getParentNum: function getParentNum(parentId) {
                if (this.props.groupData) {
                    this.props.getSelectedParentGroup(parentId);
                }
            },
            render: function render() {
                var that = this;
                var groupObj = {};
                this.props.groupData.map(function (item, index) {
                    groupObj[item.id] = item;
                });
                return React.createElement("ul", { className: "list" },
                /*this.props.groupData.map(function (item,index){*/
                /*return <li>{item}</li>*/
                /*});*/

                this.props.groupData.map(function (item, index) {

                    var parentGroupName = item.id != item.parent_id ? groupObj[item.parent_id]['name'] + "/" : "";
                    var item2 = item;
                    do {
                        item2 = groupObj[item2.parent_id];
                        parentGroupName = groupObj[item2.parent_id]['name'] + "/";
                    } while (item2.id != item2.parent_id);
                    return React.createElement("li", { key: index, onClick: function onClick() {
                            that.getParentNum(item.id);
                        } }, parentGroupName, item.name);
                }));
            }
        });
        var App = React.createClass({ displayName: "App",

            getInitialState: function getInitialState() {
                return {
                    currentIndex: 0,
                    groupData: [],
                    selectedParentGroup: -1, //当前选择的分组的id,没有选择时候为负数
                    tagData: []

                };
            },
            componentWillMount: function componentWillMount() {},
            componentDidMount: function componentDidMount() {
                var _this3 = this;

                //注册函数
                var updateGroupState = function updateGroupState(data) {
                    _this3.setState({
                        groupData: data
                    });
                };
                subscribe(updateGroupState.bind(this), taskListPub);
            },
            //选项卡切换
            tagChange: function tagChange(index) {
                return this.setState({ currentIndex: index });
            },
            //获取选中的父分组
            getSelectedParentGroup: function getSelectedParentGroup(parentId) {
                return this.setState({ selectedParentGroup: parentId });
            },
            //删除分组
            deleteGroup: function deleteGroup() {
                requestAjax('deleteGroup?groupId=' + this.state.selectedParentGroup, 'json', function (stateObj) {
                    taskListPub.deliver(stateObj.data);
                });
            },
            render: function render() {
                var remodalDate = {
                    text: this.state.currentIndex ? "请输入标签的名称" : "清输入分组的名称",
                    url: this.state.currentIndex ? "group.java" : "/addTerminalGroup",
                    selectedParentGroup: this.state.currentIndex ? -1 : this.state.selectedParentGroup
                };
                return React.createElement("div", { className: "container" }, React.createElement(TabsControl, { baseWidth: 400, tagChange: this.tagChange, currentIndex: this.state.currentIndex }, React.createElement(Tab, { name: "终端分组" }, React.createElement(GroupHeader, { deleteGroup: this.deleteGroup }),
                /*<div className="terminal_group">我是终端分组</div>*/
                React.createElement(List, { groupData: this.state.groupData, getSelectedParentGroup: this.getSelectedParentGroup })), React.createElement(Tab, { name: "终端标签" }, React.createElement(TagHeader, null),
                /*<div className="terminal_tag">我是终端标签</div>*/
                React.createElement(List, { groupData: this.state.tagData }))), React.createElement(Remodal, { remodalDate: remodalDate }));
            }
        });

        ReactDOM.render(React.createElement(App, null), document.getElementById('app'));

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
        //
        // $('[data-remodal-id=modal]').remodal({
        //     modifier: 'with-red-theme'
        // });
        requestAjax('getAllGroup', 'json', function (stateObj) {
            taskListPub.deliver(stateObj.data);
        });
        $(function () {

            $(".list li").click(function () {

                $(this).siblings('li').removeClass('selected'); // 删除其他兄弟元素的样式

                $(this).addClass('selected'); // 添加当前元素的样式
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
    }, {}] }, {}, [1]);