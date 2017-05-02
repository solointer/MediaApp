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

        var Header = React.createClass({ displayName: "Header",
            render: function render() {
                return React.createElement("ul", { className: "operateMenu" }, React.createElement("li", null, " ", React.createElement("img", { src: "/img/terminal/terminal_add.png" }), React.createElement("a", { "data-remodal-target": "modal" }, "添加")), React.createElement("li", null, React.createElement("img", { src: "/img/terminal/terminal_add.png" }), React.createElement("a", null, "删除")), React.createElement("li", null, React.createElement("img", { src: "/img/terminal/terminal_add.png" }), React.createElement("a", null, "重命名")));
            }
        });

        var Remodal = React.createClass({ displayName: "Remodal",
            render: function render() {
                return React.createElement("div", { class: "remodal-bg" }, React.createElement("div", { className: "remodal", "data-remodal-id": "modal" }, React.createElement("button", { "data-remodal-action": "close", className: "remodal-close" }), React.createElement("form", { action: this.props.remodalDate.url }, React.createElement("h1", null, "Remodal"), React.createElement("p", null, this.props.remodalDate.text), React.createElement("button", { "data-remodal-action": "cancel", className: "remodal-cancel" }, "删除"), React.createElement("button", { "data-remodal-action": "confirm", className: "remodal-confirm" }, "确认"))));
            }
        });
        var List = React.createClass({ displayName: "List",
            render: function render() {
                return React.createElement("ul", null,
                /*this.props.groupData.map(function (item,index){*/
                /*return <li>{item}</li>*/
                /*});*/

                this.props.groupData.map(function (item, index) {
                    return React.createElement("li", { key: index }, item);
                }));
            }
        });
        var App = React.createClass({ displayName: "App",

            getInitialState: function getInitialState() {
                return {
                    currentIndex: 0,
                    groupData: [],
                    tagData: []

                };
            },
            componentWillMount: function componentWillMount() {
                // $.ajax({
                //     url:"getGroup.java",
                //     success:function (data) {
                //         this.setState(data)
                //     }
                // }
                // )
                var data = ["1", "2", "3"];
                this.setState({
                    groupData: data
                });
                var data2 = [4, 5, 6];
                this.setState({
                    tagData: data2
                });
            },
            componentDidMount: function componentDidMount() {
                var _this = this;

                //注册函数
                var updateGroupState = function updateGroupState(data) {
                    _this.setState({
                        data: data.lists
                    });
                };
                subscribe(updateGroupState.bind(this), taskListPub);
            },
            tagChange: function tagChange(index) {
                return this.setState({ currentIndex: index });
            },
            render: function render() {
                var remodalDate = {
                    text: this.state.currentIndex ? "请输入分组的名称" : "清输入标签的名称",
                    url: this.state.currentIndex ? "group.java" : "tag.java"

                };
                return React.createElement("div", { className: "container" }, React.createElement(TabsControl, { baseWidth: 400, tagChange: this.tagChange, currentIndex: this.state.currentIndex }, React.createElement(Tab, { name: "终端分组" }, React.createElement(Header, null),
                /*<div className="terminal_group">我是终端分组</div>*/
                React.createElement(List, { groupData: this.state.groupData })), React.createElement(Tab, { name: "终端标签" }, React.createElement(Header, null),
                /*<div className="terminal_tag">我是终端标签</div>*/
                React.createElement(List, { groupData: this.state.tagData }))), React.createElement(Remodal, { remodalDate: remodalDate }));
            }
        });

        ReactDOM.render(React.createElement(App, null), document.getElementById('app'));
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
    }, {}] }, {}, [1]);