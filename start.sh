#!/bin/bash
#
# Author: yehuan
# Date: 2018-08-11
# Description: 创建ssh连接脚本
# 需要在命令行安装jq
#

## 展示ssh可选列表
sshList() {
    ## 获取配置列表大小
    size=`cat config.json | grep '{' | wc -w`
  
    ## 开始打印列表
    echo "ssh终端连接列表"
    echo "======================================================================="
    printf "%-10s%-24s%-22s%-65s\n" "编号" "名称" "IP" "说明"
    echo "-----------------------------------------------------------------------"

    index=0
    while(( $index<$size ))
    do
        name=`cat config.json | jq -r ".[$index].name"`
        host=`cat config.json | jq -r ".[$index].host"`
        remark=`cat config.json | jq -r ".[$index].remark"`
        printf "%-8s%-22s%-22s%-65s\n" $index $name $host $remark
        let "index++"
    done

    echo "======================================================================="
    echo "请输入编号(q 退出)>："
  
}

## 接受命令行输入，进入ssh
readCommand() {
    read option

    if test $option = "q" 
    then
        echo "结束ssh连接" 
    else
        echo "您选择了编号 $option"
        user=`cat config.json | jq -r ".[$option].user"`
        password=`cat config.json | jq -r ".[$option].password"`
        host=`cat config.json | jq -r ".[$option].host"`
        port=`cat config.json | jq -r ".[$option].port"`
        keyFile=`cat config.json | jq -r ".[$option].keyFile"`
        sshType=`cat config.json | jq -r ".[$option].type"`
        echo "type=$sshType"
        if test $sshType = "password"
        then
            echo "use password"
            ./ssh_password.sh $user $host $port $password
        else
            echo "use sshkey"
            ./ssh_sshkey.sh $user $host $port $password $keyFile
        fi        
    fi
}

## 主程序入口
main() {
    sshList
    readCommand
}

main