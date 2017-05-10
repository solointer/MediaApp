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
        var terminalListPub = new Deliver();
        var terminalUpdateChecked = new Deliver();
        var TerminalListHeader = React.createClass({ displayName: "TerminalListHeader",
            render: function render() {
                var that = this;
                return React.createElement("ul", { className: "operateMenu" }, React.createElement("li", null, React.createElement("a", null, "刷新")), React.createElement("li", null, React.createElement("a", { id: "excel_btn" }, "导出")), React.createElement("li", null, React.createElement("a", null, "详细信息")));
            }
        });

        var Table = React.createClass({ displayName: "Table",
            componentDidMount: function componentDidMount() {
                // $('#excel_btn').click(function(){
                //     $('#terminalListExport').tableExport({type:'excel',escape:'false', tableName:'终端列表'});
                // });
            },
            render: function render() {
                var lists = this.props.terminalList.map(function (list, index) {
                    return React.createElement(TableCell, { key: index + 1, data: list });
                });
                return React.createElement("table", { className: "table table-bordered table-hover", id: "#terminalListExport" }, React.createElement("thead", null, React.createElement("tr", null, React.createElement("td", null), React.createElement("th", null, "名称"), React.createElement("th", null, "MAC地址"), React.createElement("th", null, "审核状态"), React.createElement("th", null, "分组"), React.createElement("th", null, "安装位置"), React.createElement("th", null, "型号"), React.createElement("th", null, "屏幕类型"), React.createElement("th", null, "输出接口"), React.createElement("th", null, "到期时间"))), React.createElement("tbody", null, lists));
            }
        });

        var TableCell = React.createClass({ displayName: "TableCell",
            handleChange: function handleChange(id) {
                terminalUpdateChecked.deliver(id);
            },
            render: function render() {
                var _this = this;

                var that = this;
                var audit = this.props.data.audit_state > 0 ? "已通过" : "待审批";
                var time = convertTime(this.props.data.expired_date);
                var id = this.props.data.id;
                return React.createElement("tr", null, React.createElement("td", null, React.createElement("input", { type: "checkbox", onClick: function onClick() {
                        that.handleChange(_this.props.data.id);
                    }, ref: "terCheckBox", "data-id": id })), React.createElement("td", null, this.props.data.name), React.createElement("td", null, this.props.data.mac), React.createElement("td", null, audit), React.createElement("td", null, this.props.data.groupName), React.createElement("td", null, this.props.data.location), React.createElement("td", null, this.props.data.attrid), React.createElement("td", null, this.props.data.output_res_h + '*' + this.props.data.output_res_v), React.createElement("td", null, this.props.data.output_mode), React.createElement("td", null, time));
            }
        });

        var App = React.createClass({ displayName: "App",
            getInitialState: function getInitialState() {
                return {
                    terminalList: [],
                    checkedTer: []
                };
            },
            componentWillMount: function componentWillMount() {
                console.log(this.state.checkedTer);
            },
            componentDidMount: function componentDidMount() {
                var _this2 = this;

                //注册函数
                var updateTerminalListState = function updateTerminalListState(data) {
                    _this2.setState({
                        terminalList: data
                    });
                };
                var updateCheckedTerminal = function updateCheckedTerminal(id) {
                    console.log(id);
                    if (_this2.state.checkedTer.indexOf(id) >= 0) {
                        _this2.setState({
                            checkedTer: _this2.state.checkedTer.remove(id) });
                    } else {
                        _this2.setState({
                            checkedTer: _this2.state.checkedTer.push(id) });
                    }
                };
                subscribe(updateTerminalListState.bind(this), terminalListPub);
                subscribe(updateCheckedTerminal.bind(this), terminalUpdateChecked);
            },
            render: function render() {

                return React.createElement("div", null, React.createElement(TerminalListHeader, null), React.createElement(Table, { terminalList: this.state.terminalList }));
            }
        });

        ReactDOM.render(React.createElement(App, null), document.getElementById('terminalTableDisplay'));

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
                });
            });

            //初始化终端列表

            requestAjax('getAllTerminalList', 'json', function (obj) {
                terminalListPub.deliver(obj.data);
            });
        });
        window.onload = function () {
            $('#excel_btn').click(function () {
                $('table').tableExport({ type: 'excel', escape: 'false', tableName: '终端列表' });
            });
        };
    }, {}] }, {}, [1]);