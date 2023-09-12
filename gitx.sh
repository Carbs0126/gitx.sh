#!/bin/bash 
recycle_count=100
contain_push=$(echo $@ | grep "push")
contain_pull=$(echo $@ | grep "pull")
contain_clone=$(echo $@ | grep "clone")

if [ "$contain_push" != "" ] || [ "$contain_pull" != "" ] || [ "$contain_clone" != "" ]; then
    recycle_count=100
else 
    recycle_count=1
fi

for ((i=0;i<$recycle_count;i++)) 
do     
    git $@
    if [ $? -eq 0 ]; then
        echo ">>> git $@ 执行成功"
        break
    else
        failure_count=$((i + 1))
        echo ">>> git $@ 第${failure_count}次执行失败"
    fi
done 
