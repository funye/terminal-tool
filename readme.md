## terminal tool

Linux / MacOS 系统用来连接ssh的命令行工具

### 环境配置 
这个shell脚本需要安装 [shell jq](https://www.ibm.com/developerworks/cn/linux/1612_chengg_jq/index.html?ca=drs-&utm_source=tuicool&utm_medium=referral)

### 使用说明

1. 修改config.json的配置为自己的服务器配置
   ```json
   {
        "name": "server-test", // 服务器名称，自定义
        "type": "sshkey", // ssh的方式，password或者sshkey,分别代表使用【密码连接】和使用【sshkey】连接
        "keyFile": "group_dev.pem", // sshkey 秘钥文件
        "host": "192.168.0.200", // 服务主机的IP 或者域名
        "port": "22", // ssh端口
        "user": "group_dev", // ssh登录用户名
        "password": "0Ox5DQhYz5Ej8gSf", // ssh密码或者 sshkey的加密密码
        "remark": "有用测试环境跳板机"// 服务器具体描述 
    }
    以上参数，没有的时候填 "" 即可
    ```

2. 执行进入start.sh所在目录，执行 start.sh 打开列表，选中服务器编号即可
3. 如果想要更加快速，可以在 ~/.basg_profile 中添加波别名。例如： `alias sshls='cd /Users/funye/terminal-tool && ./start.sh'` 这样在命令行直接键入 sshls 回车就可开始ssh连接。

### 实现原理

**spawn** 命令实现模拟的人机交互

**shell jq** 解析服务器的配(config.json) 



