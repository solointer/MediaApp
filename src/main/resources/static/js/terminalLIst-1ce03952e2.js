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
        var terminalGroupListPub = new Deliver();
        var terminalTagListPub = new Deliver();
        var taskListPagenation = pagenation();
        var TerminalListHeader = React.createClass({ displayName: "TerminalListHeader",
            deleteCheckedTer: function deleteCheckedTer() {
                this.props.terminalListHeaderProps.deleteCheckedTer();
            },
            render: function render() {
                var that = this;
                var createTerminalRemodalProps = {
                    terminalGroupList: this.props.terminalListHeaderProps.terminalGroupList,
                    terminalTagList: this.props.terminalListHeaderProps.terminalTagList,
                    createTerminal: this.props.terminalListHeaderProps.createTerminal
                };
                return React.createElement("ul", { className: "operateMenu" }, React.createElement("li", null, React.createElement("a", { "data-remodal-target": "createTerminal" }, "添加")), React.createElement("li", null, React.createElement("a", { onClick: function onClick() {
                        that.deleteCheckedTer();
                    } }, "删除")), React.createElement("li", null, React.createElement("a", null, "编辑")), React.createElement("li", null, React.createElement("a", null, "审批")), React.createElement("li", null, React.createElement("a", null, "设置")), React.createElement(CreateTerminalRemodal, { createTerminalRemodalProps: createTerminalRemodalProps }));
            }
        });
        var CreateTerminalRemodal = React.createClass({ displayName: "CreateTerminalRemodal",
            createTermianl: function createTermianl() {
                var obj = getTerminalForm();
                createTerminal.close();
                this.props.createTerminalRemodalProps.createTerminal(obj);
            },
            render: function render() {
                var that = this;
                var groupLists = this.props.createTerminalRemodalProps.terminalGroupList.map(function (list, index) {
                    return React.createElement("option", { key: list.id, "data-id": list.id }, list.name);
                });
                var tagLists = this.props.createTerminalRemodalProps.terminalTagList.map(function (list, index) {
                    return React.createElement("option", { key: list.id, "data-id": list.id }, list.name);
                });
                return React.createElement("div", { className: "remodal-bg" }, React.createElement("div", { className: "remodal", "data-remodal-id": "createTerminal" }, React.createElement("button", { "data-remodal-action": "close", className: "remodal-close" }), React.createElement("ul", { id: "tab" }, React.createElement("li", { className: "current" }, "基本属性"), React.createElement("li", null, "网络属性"), React.createElement("li", null, "播放属性"), React.createElement("li", null, "高级属性")), React.createElement("div", { id: "content" }, React.createElement("ul", null, React.createElement("li", null, React.createElement("div", { className: "form-inline" }, React.createElement("div", { className: "form-group" }, React.createElement("label", null, "MAC地址"), React.createElement("input", { type: "text", className: "form-control terminal_macAddress" })), React.createElement("div", { className: "form-group" }, React.createElement("label", null, "终端名称"), React.createElement("input", { type: "text", className: "form-control terminal_name" }))), React.createElement("div", { className: "form-inline" }, React.createElement("div", { className: "form-group" }, React.createElement("label", null, "安装位置"), React.createElement("input", { type: "text", className: "form-control terminal_location" })), React.createElement("div", { className: "form-group" }, React.createElement("label", null, "安装城市"), React.createElement("input", { type: "text", className: "form-control terminal_city" }))), React.createElement("div", { className: "form-inline" }, React.createElement("div", { className: "form-group" }, React.createElement("label", null, "分组"), React.createElement("select", { className: "form-control terminal_group" }, groupLists)), React.createElement("div", { className: "form-group" }, React.createElement("label", null, "标签"), React.createElement("select", { className: "form-control terminal_tag" }, tagLists))))), React.createElement("ul", null, React.createElement("li", null, React.createElement("div", { className: "form-inline" }, React.createElement("div", { className: "form-group" }, React.createElement("label", null, "网络输入方式"), React.createElement("select", { className: "form-control" }, React.createElement("option", null, "DHCP"), React.createElement("option", null, "3"), React.createElement("option", null, "GPPPOE"), React.createElement("option", null, "静态IP")))))), React.createElement("ul", null, React.createElement("li", null, React.createElement("div", { className: "form-inline" }, React.createElement("div", { className: "form-group" }, React.createElement("label", null, "信号输出类型"), React.createElement("select", { className: "form-control" }, React.createElement("option", null, "AV"), React.createElement("option", null, "HDMI"), React.createElement("option", null, "YBppr"), React.createElement("option", null, "SVideo"), React.createElement("option", null, "VGA"))), React.createElement("div", { className: "form-group" }, React.createElement("label", null, "终端显示类型"), React.createElement("select", { className: "form-control" }, React.createElement("option", null, "横屏")))), React.createElement("div", { className: "form-inline" }, React.createElement("div", { className: "form-group" }, React.createElement("label", null, "信号输出分辨率"), React.createElement("select", { className: "form-control terminal_ratio" }, React.createElement("option", null, "1280*70"))), React.createElement("div", { className: "form-group" }, React.createElement("label", null, "终端显示比例"), React.createElement("select", { className: "form-control terminal_scale" }, React.createElement("option", null, "16：9")))))), React.createElement("ul", null, React.createElement("li", null, React.createElement("div", { className: "form-inline" }, React.createElement("div", { className: "form-group" }, React.createElement("label", null, "OSD语言"), React.createElement("select", { className: "form-control terminal_lang" }, React.createElement("option", { value: "chinese" }, "中文"), React.createElement("option", { value: "english" }, "英文"))), React.createElement("div", { className: "form-group" }, React.createElement("label", null, "下载速度"), React.createElement("input", { type: "text", className: "form-control terminal_enable" }))), React.createElement("div", { className: "form-inline" }, React.createElement("div", { className: "form-group" }, React.createElement("label", null, "心跳时间"), React.createElement("input", { type: "text", className: "form-control terminal_interval" })), React.createElement("div", { className: "form-group" }, React.createElement("label", null, "自动清理文件天数"), React.createElement("input", { type: "text", className: "form-control terminal_keepDays" })))))), React.createElement("button", { "data-remodal-action": "cancel", className: "remodal-cancel" }, "删除"), React.createElement("button", { className: "remodal-confirm", onClick: function onClick() {
                        that.createTermianl();
                    } }, "确定")));
            }
        });

        var Table = React.createClass({ displayName: "Table",
            render: function render() {
                var lists = this.props.terminalList.map(function (list, index) {
                    return React.createElement(TableCell, { key: index + 1, data: list });
                });
                return React.createElement("table", { className: "table table-bordered table-hover" }, React.createElement("thead", null, React.createElement("tr", null, React.createElement("td", null), React.createElement("th", null, "名称"), React.createElement("th", null, "MAC地址"), React.createElement("th", null, "审核状态"), React.createElement("th", null, "分组"), React.createElement("th", null, "安装位置"), React.createElement("th", null, "型号"), React.createElement("th", null, "屏幕类型"), React.createElement("th", null, "输出接口"), React.createElement("th", null, "到期时间"))), React.createElement("tbody", null, lists));
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
                    checkedTer: [],
                    terminalGroupList: [],
                    terminalTagList: []

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
                var updateGroupState = function updateGroupState(data) {
                    _this2.setState({
                        terminalGroupList: data
                    });
                };
                var updateTagState = function updateTagState(data) {
                    _this2.setState({
                        terminalTagList: data
                    });
                };
                subscribe(updateTerminalListState.bind(this), terminalListPub);
                subscribe(updateCheckedTerminal.bind(this), terminalUpdateChecked);
                //注册函数(之所以注册函数实现ajax实现状态的更新，主要是为了避免更新其他的状态无谓的发送ajax)
                subscribe(updateTagState.bind(this), terminalTagListPub);
                subscribe(updateGroupState.bind(this), terminalGroupListPub);
            },
            deleteCheckedTer: function deleteCheckedTer() {
                var terIdList = this.state.checkedTer.length > 0 ? this.state.checkedTer.join(",") : this.state.checkedTer;
                console.log(terIdList);
                requestAjax("deleteTerminal?terIdArray=" + terIdList, 'json', function (stateObj) {
                    terminalListPub.deliver(stateObj.data);
                });
            },
            createTerminal: function createTerminal(data) {
                console.log("----------------");
                console.log(data);
                requestAjax("createTerminal?" + data, 'json', function (data) {
                    if (data.result) {
                        taskListPagenation.requestPage(1);
                    }
                });
            },
            render: function render() {
                var terminalListHeaderProps = {
                    deleteCheckedTer: this.deleteCheckedTer,
                    terminalGroupList: this.state.terminalGroupList,
                    terminalTagList: this.state.terminalTagList,
                    createTerminal: this.createTerminal
                };
                return React.createElement("div", null, React.createElement(TerminalListHeader, { terminalListHeaderProps: terminalListHeaderProps }), React.createElement(Table, { terminalList: this.state.terminalList }));
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

            taskListPagenation.init({
                url: 'ajax_terminal_list',
                isCache: true,
                successCb: function successCb(pageInfo) {
                    terminalListPub.deliver(pageInfo.data);
                    pagination('project-page', pageInfo.totalPages, function (page) {
                        taskListPagenation.requestPage(page);
                    }, pageInfo.currentPage);
                }
            });
            taskListPagenation.requestPage(1);
        });

        requestAjax('getAllGroup', 'json', function (result) {
            terminalGroupListPub.deliver(result.data);
        });
        requestAjax('getAllTags', 'json', function (result) {
            terminalTagListPub.deliver(result.data);
        });
        //获取终端表单的数据
        function getTerminalForm() {
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
            var enable_rc = $(".terminal_enable").val();
            obj.enable_rc = enable_rc;
            var file_keep_days = $(".terminal_keepDays").val();
            obj.file_keep_days = file_keep_days;
            var data = "mac=" + obj.mac + "&name=" + obj.name + "&location=" + obj.location + "&city=" + obj.city + "&group_id=" + obj.group_id + "&no=" + no + "&output_res_h=" + obj.output_res_h + "&output_res_v=" + output_res_v + "&display_scale=" + display_scale + "&osd_lang=" + osd_lang + "&heartbeat_interval=" + heartbeat_interval + "&enable_rc=" + enable_rc + "&file_keep_days=" + file_keep_days;
            console.log(data);
            return data;
        }
        var createTerminal = $('[data-remodal-id=createTerminal]').remodal();
    }, {}] }, {}, [1]);