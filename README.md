# gitx.sh
在网络环境差的情况下，使用git执行与网络有关的命令时（pull push clone），常常会以失败告终，此时我们的做法就是```多试几遍```<br>
这个脚本用来替代```多试几遍```

### 使用
```
  gitx push
  gitx pull xxx
  gitx clone xxxxxxx
  ...
```
推荐使用这三个命令时，使用```gitx```脚本

### 效果
<img width="858" alt="image" src="https://github.com/Carbs0126/gitx.sh/assets/14228871/7a51debf-5b91-4c79-b320-7993892af02d">


### 原理：
脚本检测输入参数是否有 pull push clone，如果有，则进入for循环，并检测命令执行（比如 ```git push```）的结果，如果结果是执行失败，则继续重复执行，直到超过的循环阈值或者成功为止
