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
        var terminalGroupListPub = new Deliver();
        var terminalTagListPub = new Deliver();
        // 选项卡切组件
        //实现选项卡的切换
        var TabsControl = React.createClass({ displayName: "TabsControl",
            getTitleItemCssClasses: function getTitleItemCssClasses(index) {
                return index === this.props.tabsControlProps.currentIndex ? "tab-title-item active" : "tab-title-item";
            },
            getContentItemCssClasses: function getContentItemCssClasses(index) {
                return index === this.props.tabsControlProps.currentIndex ? "tab-content-item active" : "tab-content-item";
            },
            render: function render() {
                var _this = this;

                var that = this;
                var baseWidth = this.props.baseWidth;

                var childrenLength = this.props.children.length;
                return React.createElement("div", null, React.createElement("nav", { className: "tab-title-items" }, React.Children.map(this.props.children, function (element, index) {
                    return React.createElement("div", { onClick: function onClick() {
                            _this.props.tabsControlProps.tabsControlChanged(index);
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
        //终端分组的导航,创建分组以及修改分组的弹出框
        var CreateTerminalGroupModal = React.createClass({ displayName: "CreateTerminalGroupModal",
            groupManage: function groupManage() {
                var groupName = $("#terminalGroupName").val();
                createTerminalGroupModal.close();
                this.props.createGroup(groupName);
            },
            render: function render() {
                var that = this;
                return React.createElement("div", { className: "remodal-bg" }, React.createElement("div", { className: "remodal", "data-remodal-id": "createTerminalGroupModal" }, React.createElement("button", { "data-remodal-action": "close", className: "remodal-close" }), React.createElement("p", null, "请输入分组名称"), React.createElement("div", { className: "form-group" }, React.createElement("input", { type: "text", className: "form-control", name: "terminalGroupName", id: "terminalGroupName" })), React.createElement("br", null), React.createElement("button", { "data-remodal-action": "cancel", className: "remodal-cancel" }, "删除"), React.createElement("button", { className: "remodal-confirm", onClick: function onClick() {
                        that.groupManage();
                    } }, "确定")));
            }
        });
        var UpdateTerminalGroupmodal = React.createClass({ displayName: "UpdateTerminalGroupmodal",
            updateGroup: function updateGroup() {
                var groupName = $("#newGroupName").val();
                updateTerminalGroupModal.close();
                this.props.updateGroup(groupName);
            },
            render: function render() {
                var that = this;
                return React.createElement("div", { className: "remodal-bg" }, React.createElement("div", { className: "remodal", "data-remodal-id": "updateTerminalGroupModal" }, React.createElement("button", { "data-remodal-action": "close", className: "remodal-close" }), React.createElement("h1", null, "分组更新"), React.createElement("p", null, "请输入新的分组名称"), React.createElement("div", { className: "form-group" }, React.createElement("input", { type: "text", className: "form-control", name: "newGroupName", id: "newGroupName" })), React.createElement("br", null), React.createElement("button", { "data-remodal-action": "cancel", className: "remodal-cancel" }, "删除"), React.createElement("button", { className: "remodal-confirm", onClick: function onClick() {
                        that.updateGroup();
                    } }, "确定")));
            }
        });
        var GroupHeader = React.createClass({ displayName: "GroupHeader",
            render: function render() {
                var _this2 = this;

                return React.createElement("ul", { className: "operateMenu" }, React.createElement("li", null, React.createElement("a", { "data-remodal-target": "createTerminalGroupModal" }, "添加")), React.createElement("li", null, React.createElement("a", { onClick: function onClick() {
                        _this2.props.groupHeaderProps.deleteTerminalGroup();
                    } }, "删除")), React.createElement("li", null, React.createElement("a", { "data-remodal-target": "updateTerminalGroupModal" }, "重命名")), React.createElement("li", null, React.createElement("a", null, "刷新")), React.createElement("li", null, React.createElement("a", null, "设置")), React.createElement(CreateTerminalGroupModal, { createGroup: this.props.groupHeaderProps.createTerminalGroup }), React.createElement(UpdateTerminalGroupmodal, { updateGroup: this.props.groupHeaderProps.updateTerminalGroup }));
            }
        });
        var TerminalGroupList = React.createClass({ displayName: "TerminalGroupList",
            getParentNum: function getParentNum(parentId) {
                this.props.terminalGroupListProps.getSelectedParentGroup(parentId);
            },
            render: function render() {
                var that = this;
                var groupObj = {};
                this.props.terminalGroupListProps.terminalGroupList.map(function (item, index) {
                    groupObj[item.id] = item;
                });
                return React.createElement("ul", { className: "list" }, this.props.terminalGroupListProps.terminalGroupList.map(function (item, index) {

                    var parentGroupName = item.id != item.parent_id ? groupObj[item.parent_id]['name'] + "/" : "";
                    return React.createElement("li", { key: index, onClick: function onClick() {
                            that.getParentNum(item.id);
                        } }, parentGroupName, item.name);
                }));
            }
        });

        //终端标签的导航以及标签的创建删除以及修改
        //终端标签头部
        var UpdateTerminalTagmodal = React.createClass({ displayName: "UpdateTerminalTagmodal",
            updateTag: function updateTag() {
                var tagName = $("#newTagName").val();
                updateTerminalTagmodal.close();
                this.props.updateTag(tagName);
            },
            render: function render() {
                var that = this;
                return React.createElement("div", { className: "remodal-bg" }, React.createElement("div", { className: "remodal", "data-remodal-id": "updateTerminalTagmodal" }, React.createElement("button", { "data-remodal-action": "close", className: "remodal-close" }), React.createElement("h1", null, "标签更新"), React.createElement("p", null, "请输入新的标签名称"), React.createElement("div", { className: "form-group" }, React.createElement("input", { className: "form-control", type: "text", name: "newTagName", id: "newTagName" })), React.createElement("br", null), React.createElement("button", { "data-remodal-action": "cancel", className: "remodal-cancel" }, "删除"), React.createElement("button", { className: "remodal-confirm", onClick: function onClick() {
                        that.updateTag();
                    } }, "确定")));
            }
        });
        var CreateTerminalTagmodal = React.createClass({ displayName: "CreateTerminalTagmodal",
            createTag: function createTag() {
                var tagName = $("#TagName").val();
                createTerminalTagmodal.close();
                this.props.createTag(tagName);
            },
            render: function render() {
                var that = this;
                return React.createElement("div", { className: "remodal-bg" }, React.createElement("div", { className: "remodal", "data-remodal-id": "createTerminalTagmodal" }, React.createElement("button", { "data-remodal-action": "close", className: "remodal-close" }), React.createElement("p", null, "请输入标签名称"), React.createElement("div", { className: "form-group" }, React.createElement("input", { className: "form-control", type: "text", name: "newTagName", id: "TagName" })), React.createElement("br", null), React.createElement("button", { "data-remodal-action": "cancel", className: "remodal-cancel" }, "删除"), React.createElement("button", { className: "remodal-confirm", onClick: function onClick() {
                        that.createTag();
                    } }, "确定")));
            }
        });
        var TagHeader = React.createClass({ displayName: "TagHeader",
            render: function render() {
                var _this3 = this;

                return React.createElement("ul", { className: "operateMenu" }, React.createElement("li", null, React.createElement("a", { "data-remodal-target": "createTerminalTagmodal" }, "添加")), React.createElement("li", null, React.createElement("a", { onClick: function onClick() {
                        _this3.props.tagHeaderProps.deleteTerminalTag();
                    } }, "删除")), React.createElement("li", null, React.createElement("a", { "data-remodal-target": "updateTerminalTagmodal" }, "重命名")), React.createElement("li", null, React.createElement("a", null, "刷新")), React.createElement("li", null, React.createElement("a", null, "设置")), React.createElement(CreateTerminalTagmodal, { createTag: this.props.tagHeaderProps.createTerminalTag }), React.createElement(UpdateTerminalTagmodal, { updateTag: this.props.tagHeaderProps.updateTerminalTag }));
            }
        });
        var TerminalTagList = React.createClass({ displayName: "TerminalTagList",
            render: function render() {
                var that = this;
                return React.createElement("ul", { className: "list" }, this.props.terminalTagListProps.terminalTagList.map(function (item, index) {
                    return React.createElement("li", { key: index }, item.name);
                }));
            }
        });

        var App = React.createClass({ displayName: "App",
            getInitialState: function getInitialState() {
                return {
                    currentIndex: 0, //保存当前选中的选项卡
                    terminalGroupList: [], //终端分组,
                    selectedTermianlGroup: -1, //当前选择的分组的id,没有选择时候为负数
                    terminalTagList: [], //终端标签列表
                    selectedTerminalTagId: -1 //当前选中的标签ID
                };
            },
            componentDidMount: function componentDidMount() {
                var _this4 = this;

                //注册函数(之所以注册函数实现ajax实现状态的更新，主要是为了避免更新其他的状态无谓的发送ajax)
                var updateGroupState = function updateGroupState(data) {
                    _this4.setState({
                        terminalGroupList: data
                    });
                };
                var updateTagState = function updateTagState(data) {
                    _this4.setState({
                        terminalTagList: data
                    });
                };
                subscribe(updateTagState.bind(this), terminalTagListPub);
                subscribe(updateGroupState.bind(this), terminalGroupListPub);
            },
            //选项卡切换函数
            tabsControlChanged: function tabsControlChanged(index) {
                return this.setState({ currentIndex: index });
            },
            //终端分组
            createTerminalGroup: function createTerminalGroup(groupName) {
                requestAjax("addTerminalGroup?name=" + groupName + "&parentGroupId=" + this.state.selectedTermianlGroup, 'json', function (result) {
                    terminalGroupListPub.deliver(result.data);
                });
            },
            //删除分组
            deleteTerminalGroup: function deleteTerminalGroup() {
                requestAjax('deleteGroup?groupId=' + this.state.selectedTermianlGroup, 'json', function (result) {
                    terminalGroupListPub.deliver(result.data);
                });
            },
            //分组的重命名
            updateTerminalGroup: function updateTerminalGroup(newGroupName) {
                requestAjax("updateGroup?newGroupName=" + newGroupName + "&groupId=" + this.state.selectedTermianlGroup, 'json', function (result) {
                    terminalGroupListPub.deliver(result.data);
                });
            },
            //获取选中的父分组
            getSelectedParentGroup: function getSelectedParentGroup(groupId) {
                return this.setState({ selectedTermianlGroup: groupId });
            },
            //终端标签
            getSelectedTagId: function getSelectedTagId(id) {
                return this.setState({ selectedTerminalTagId: id });
            },
            deleteTerminalTag: function deleteTerminalTag() {
                requestAjax('deleteTag?tagId=' + this.state.selectedTerminalTagId, 'json', function (result) {
                    terminalTagListPub.deliver(result.data);
                });
            },
            updateTerminalTag: function updateTerminalTag(newTagName) {
                requestAjax("updateTag?newTagName=" + newTagName + "&tagId=" + this.state.selectedTerminalTagId, 'json', function (result) {
                    terminalTagListPub.deliver(result.data);
                });
            },
            createTerminalTag: function createTerminalTag(tagName) {
                requestAjax("createTag?tagName=" + tagName, 'json', function (result) {
                    terminalTagListPub.deliver(result.data);
                });
            },
            render: function render() {
                var tabsControlProps = {
                    currentIndex: this.state.currentIndex,
                    tabsControlChanged: this.tabsControlChanged
                };
                var terminalGroupListProps = {
                    terminalGroupList: this.state.terminalGroupList,
                    getSelectedParentGroup: this.getSelectedParentGroup
                };
                var groupHeaderProps = {
                    selectedTermianlGroup: this.state.selectedTermianlGroup,
                    createTerminalGroup: this.createTerminalGroup,
                    deleteTerminalGroup: this.deleteTerminalGroup,
                    updateTerminalGroup: this.updateTerminalGroup
                };
                var tagHeaderProps = {
                    terminalTagList: this.state.terminalTagList,
                    createTerminalTag: this.createTerminalTag,
                    updateTerminalTag: this.updateTerminalTag,
                    deleteTerminalTag: this.deleteTerminalTag
                };
                var terminalTagListProps = {
                    terminalTagList: this.state.terminalTagList
                };
                return React.createElement("div", { className: "container" }, React.createElement(TabsControl, { baseWidth: 400, tabsControlProps: tabsControlProps }, React.createElement(Tab, { name: "终端分组" }, React.createElement(GroupHeader, { groupHeaderProps: groupHeaderProps }), React.createElement(TerminalGroupList, { terminalGroupListProps: terminalGroupListProps })), React.createElement(Tab, { name: "终端标签" }, React.createElement(TagHeader, { tagHeaderProps: tagHeaderProps }), React.createElement(TerminalTagList, { terminalTagListProps: terminalTagListProps }))));
            }
        });
        ReactDOM.render(React.createElement(App, null), document.getElementById('terminalManage'));

        requestAjax('getAllGroup', 'json', function (result) {
            terminalGroupListPub.deliver(result.data);
        });
        requestAjax('getAllTags', 'json', function (result) {
            terminalTagListPub.deliver(result.data);
        });

        var createTerminalGroupModal = $('[data-remodal-id=createTerminalGroupModal]').remodal();
        var updateTerminalGroupModal = $('[data-remodal-id=updateTerminalGroupModal]').remodal();
        var createTerminalTagmodal = $('[data-remodal-id=createTerminalTagmodal]').remodal();
        var updateTerminalTagmodal = $('[data-remodal-id=updateTerminalTagmodal]').remodal();
    }, {}] }, {}, [1]);