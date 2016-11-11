## Lab3：DOL实例分析&编程

### step1：修改example2，让三个square模块变成2个，tips：修改xml的iterator
分析：在xml文件的一开始，可以看到该文件声明了一个迭代变量N，值为3。因此我们要实现实验目的，只需要把xml代码中的N值改为2，即可以让square模块变为2个。

修改：

![step_1](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/Lab2_01.JPG)

重新编译、运行：

	$ ant -f runexample.xml -Dnumber=2

得到结果如下：

![step_2](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/Lab2_02.JPG)

Dot图：

![step_3](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/Lab2_03.JPG)

### step2：修改 example1，使其输出3次方数，tips：修改square.c
分析：之所以会输出2次方数，是因为square.c模块在读取数据到i后，将其进行了一个平方的操作（i = i\*i，再将其传到一起相连的channel用于consumer输出。故想要输出三次方数，只需将i = i\*i改为i = i\*i\*i。

修改：

![step_1](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/Lab2_04.jpg)

重新编译、运行：

	$ ant -f runexample.xml -Dnumber=1
运行结果如下：

![step_2](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/Lab2_05.JPG)

修改后的Dot图：

![step_3](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/Lab2_06.JPG)

### 实验感想
本次实验，对DOL实例1和2的内容进行了分析，让我们认识到了Dol里基本的代码操作和dot图的绘制。还是和上次的dol配置实验一样，本次实验比较基础并且能在ta给的ppt步骤下顺利完成，难度一般。。感谢ta的辛勤付出！让我们能节省时间进行其他课程的实验23333~\(≧▽≦)/~



