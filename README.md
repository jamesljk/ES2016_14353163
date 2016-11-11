## This is my README.md
# DOL

## 1.Description

> The distributed operation layer ([DOL](http://www.tik.ee.ethz.ch/~shapes/dol.html)) is a software development framework to program parallel applications. The DOL allows to specify applications based on the Kahn process network model of computation and features a simulation engine based on SystemC. Moreover, the DOL provides an XML-based specification format to describe the implementation of a parallel application on a multi-processor systems, including binding and mapping.

## 2.Steps to  install DOL

[make](http://blog.chinaunix.net/uid-9314244-id-2004686.html)

- 在Linux和Ubuntu环境中，make工具主要被用来进行工程编译和程序链接
- Makefile文件：告诉make以何种方式编译源代码和链接程序
- make通过比较对应文件（规则的目标和依赖）的最后修改时间，来决定哪些文件需要更新、那些文件不需要更新。

[Ant](http://blog.163.com/qiangyongbin2000@126/blog/static/77517819201151653423687)

- Ant是一种基于Java的build工具。
- Ant用Java的类来扩展。
- Ant本身就是这样一个流程脚本引擎，用于自动化调用程序完成项目的编译，打包，测试等。

此处顺便再提一下Ant的优点：

- 跨平台性。Ant是纯java语言编写的，所示具有很好的跨平台性。
- 操作简单。Ant是由一个内置任务和可选任务组成的。Ant运行时需要一个XML文件(构建文件)。
- 容易维护和书写，结构清晰。
Ant可以集成到开发环境中。

接下来就开始安装了

1. 安装在linux环境下，建议使用虚拟机安装Ubuntu（[Ubuntu下载](http://www.ubuntu.com/download/desktop)）
我选择的虚拟机管理软件为VMware（[VMware教程](http://jingyan.baidu.com/article/0320e2c1ef9f6c1b87507bf6.html)），你也可以使用VirtualBox（[VirtualBox教程](http://jingyan.baidu.com/article/cdddd41c5eea3153ca00e160.html)）

2. 安装必要的环境
	
		$ sudo apt-get update

		$ sudo apt-get install ant

		$ sudo apt-get install openjdk-7-jdk

		$ sudo apt-get install unzip

3. 下载文件
	
		sudo wget http://www.accellera.org/images/downloads/standards/systemc/systemc-2.3.1.tgz

		sudo wget http://www.tik.ee.ethz.ch/~shapes/downloads/dol_ethz.zip

4. 解压文件
	
	* 新建dol的文件夹 
		
			$ mkdir dol
	
	* 将dolethz.zip解压到 dol文件夹中
	
			$ unzip dol_ethz.zip -d dol

	* 解压systemc

			$ tar -zxvf systemc-2.3.1.tgz

5. 编译systemc

	* 解压后进入systemc-2.3.1的目录下
	
			$ cd systemc-2.3.1

	* 新建临时文件夹objdir

			$ mkdir objdir

	* 进入该文件夹

			$ cd objdir

	* 运行configure(能根据系统的环境设置一下参数，用于编译)

			$ ../configure CXX=g++ --disable-async-updates

		运行configure之后的截图：

		![dol_img_1](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/1.JPG)

	* 编译
	
			$ sudo make install

	* 编译完后文件目录如下:
		
		![dol_img_2](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/2.jpg)
	
		能看到include, lib-linux(对于64位系统，这里是lib-linux64)

6. 编译dol

			$ ant -f build_zip.xml all
	
	* 若成功会显示build successful

	* 接着运行第一个例子

			$ ant -f runexample.xml -Dnumber=1

		成功结果如图:
		
		![dol_img_3](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/4.jpg)

        至此安装完毕

## 3.Experimental experience

 >本次实验是课程的第一次实验，让我们学会了DOL的最基本配置，配置步骤详细地列在ta给的实验文档上，所以操作起来比较简单。另外，通过这次实验我们更是了解到了如何使用markdown这种强大的文本编辑器来编辑实验报告，这种报告的界面可以很舒服美观地展示在我们的眼前。我觉得大概以后写实验报告也会用这个来弄了（开心），这里谢谢ta让我们学会了一门强大又美观的排版格式。
