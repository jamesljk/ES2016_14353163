                              																							Lab11:Keil调试器的使用
##  一.实验步骤
**1.  Keil调试器下载和安装**
  
    `$ http://human-robot.sysu.edu.cn/course/Introduction%20to%20Cotex-M/MDK474.rar`
   
    解压后有这些文件:
  ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/1.png)

**2.  点击MDK474.EXE文件,一路next安装,安装完之后按照提示安装驱动**  
    ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/2.png)

**3.  点击EE319K_InstallSpring2016.exe文件,一路next安装**
    ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/3.png)

**4.  打开工程**
    
    a.解压FunctionalDebugging.zip

    b.点击Project->Open Project，选择解压好的路径下FunctionalDebugging文件夹中的.uvproj文件

    c.可以看到两个.s文件，Startup.s和main.s
  ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/4.PNG)

    其中,前者是完成基本的CPU初始化以及外围设备的初始化,后者是我们的主体程序,执行完Startup.s后,跳转到Start

**5.  熟悉Keil调试器的基本调试操作**  

    点击Debug->Start/Stop Debug Session，启动调试器,有关编译的工具栏按钮消失了，出现了一个用于运行和调试的工具栏，Debug 菜单上的大部份命令都有相应的快捷按钮。
    
   ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/5.png)

    上图从左到右依次是复位、运行、暂停、单步跟踪、单步、执行完当前子程序、运行到当前行、下一状态、打开跟踪、观察跟踪、反汇编窗口、观察窗口、代码作用范围分析、1＃串行窗口、内存窗口、性能分析、工具按钮命令

**6.  运行代码，观察Registers和Memory的值的变化**
 
    运行前Registers和Memory的值:
    
   ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/lab11_06.png)

    运行后Registers和Memory的值:
    
     
  ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/lab11_07.PNG)
     

**7.  找出Cnt变量的最终值和HappyBuf的最终值**

    首先我们查看程序
   ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/lab11_08.png)

    从上图可以看出,Cnt初始化为0并存在寄存器R0中

   ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/9.png)

   ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/10.png)
   ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/11.png)

    从上图可以看出,main.s大概实现的是先创建HappyBuf和SadBuf两个缓冲区,接着将sad和happy两个8位变量赋值为随机数,再将这两个变量转存到数组中.Cnt保存数组偏移量,它的初始值是0。每次转存的时候判断Cnt是否越界,若是,则程序停止运行；若否，则cnt+1.,它保存在寄存器R0中。HappyBuf的值则保存在寄存器R2中.

    所以由下图寄存器最终的结果图可以知道,Cnt的最终值是0xDBF3AECD,而HappyBuf的最终值为0x2000002C.

   ![](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/12.PNG)

##  二.实验心得

   
   **因为在工程实训的时候是飞行器小组的，所以这个软件在当时用过，调试也大概还记得怎么操作~\(≧▽≦)/~不过实验文档也讲得足够详细，可以说更加加深了我对keil这个软件的印象（毕竟删了重装2333）。这次实验主要让我们学会了如何分析一个完整的汇编代码，通过对汇编代码的分析和运行前后寄存器值的变化，进一步方便地分析程序运行和内存寄存器管理的过程，还是学到了不少东西!**
   




   
    
    



 




   


  [1]: https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/1.png