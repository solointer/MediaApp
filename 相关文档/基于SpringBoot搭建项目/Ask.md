### 导入项目之后pom.xml文件解析出错

  + 错误详情

        Failure to transfer org.apache.maven:maven-profile:jar:2.2.1 from https://repo.maven.apache.org/maven2 was
        cached in the local repository, resolution will not be reattempted until the update interval of central has elapsed or
        updates are forced. Original error: Could not transfer artifact org.apache.maven:maven-profile:jar:2.2.1 from/to
        central (https://repo.maven.apache.org/maven2): repo.maven.apache.org

  + 解决办法

        1、找到错误指定的maven库,例如org.apache.maven:maven-profile,一般这个库的存放目录在c:user\yourUsers\.m2\repository\org\apache\,找
        2、到对应的maven-profile的2.2.1版本依赖,然后删除.lastUpdated结尾的文件
        3、右击项目update project

### 运行项目报错

  + 错误详情

            Access denied for user 'root'@'localhost' (using password:YES)

  + 解决办法(http://blog.csdn.net/skywalker_leo/article/details/47274441)

    经查找资料发现是root帐户默认不开放远程访问权限，所以需要修改一下相关权限。

        解决方案：
        1、打开MySQL目录下的my.ini文件，在文件的最后添加一行“skip-grant-tables”，保存并关闭文件。（WIN7默认安装，my.ini在C:\ProgramData\MySQL\MySQL Server 5.6）
        2、重启MySQL服务。
        3、通过命令行进入MySQL的BIN目录，输入“mysql -u root -p”(不输入密码)，回车即可进入数据库。（WIN7默认安装，BIN目录为：C:\Program Files\MySQL\MySQL Server 5.6\bin）
        4、执行“use mysql;”，使用mysql数据库。
        5、执行“update user set password=PASSWORD("123456") where user='root';”（修改root的密码）
        6、打开MySQL目录下的my.ini文件，删除最后一行的“skip-grant-tables”，保存并关闭文件。
        7、重启MySQL服务。
        8、在命令行中输入“mysql -u root -p 123456”，即可成功连接数据库。
        完成以上步骤，MyEclipse也可成功连接MySQL了。
