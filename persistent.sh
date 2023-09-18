#!/bin/bash 
persistent_count=10

if [ $# -eq 0 ] ; then
    echo ">>> 请在命令后输入要执行的程序"
    exit 1
fi

for ((i=0;i<$persistent_count;i++)) 
do     
    $@
    if [ $? -eq 0 ]; then
        echo ">>> $@ 命令执行成功"
        break
    else
        failure_count=$((i + 1))
        
        if [ $failure_count -eq $persistent_count ]; then
            echo ">>> $@ 命令第${failure_count}次执行失败，达到最大尝试次数，程序退出"
        else
            echo ">>> $@ 命令第${failure_count}次执行失败，继续尝试..."
        fi
    fi
done 
