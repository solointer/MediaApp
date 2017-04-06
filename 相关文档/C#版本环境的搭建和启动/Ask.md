#### 项目运行的错误

  + 错误详情

        The web.config file for this project is missing the required AjaxRequestModule.

  + 解决办法

         在web.config配置中<system.web>下添加如下配置

          <httpModules>
  		       <add name="AjaxRequestModule" type="Coolite.Ext.Web.AjaxRequestModule, Coolite.Ext.Web" />
  	    </httpModules>
