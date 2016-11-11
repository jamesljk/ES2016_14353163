## DEADLOCK

### Description

死锁是指两个或两个以上的进程在执行过程中，由于竞争资源或者由于彼此通信而造成的一种阻塞的现象，若无外力作用，它们都将无法推进下去。此时称系统处于死锁状态或系统产生了死锁，这些永远在互相等待的进程称为死锁进程。

### conditions for deadlock

- 1.互斥条件：一个资源每次只能被一个进程使用
- 2.请求与保持条件：一个进程因请求资源而阻塞时，对已获得的资源保持不放
- 3.不剥夺条件：进程已获得的资源，在末使用完之前，不能强行剥夺
- 4.循环等待条件：若干进程之间形成一种头尾相接的循环等待资源关系

### JAVA Example:

	class A {
		synchronized void methodA(B b) {
			b.last();
		}
	
		synchronized void last() {
			System.out.println("Inside A.last()");
		}
	}

	class B {
		synchronized void methodB(A a) {
			a.last();
		}
		
		synchronized void last() {
			System.out.println("Inside B.last()");
		}
	}
	
	class Deadlock implements Runnable {
		A a = new A();
		B b = new B();
		
		Deadlock() {
			Thread t = new Thread(this);
			int count = 20000;
			
			t.start();
			while(count-->0);
			a.methodA(b);
		}
		
		public void run() {
			b.methodB(a);
		}
		public static void main(String args[]) {
			new Deadlock();
		}
	}

Use the JAVA example above to run the codes below：
	
	cd /d %~dp0
	@echo off
	:start
	set /a var+=1
	echo %var%
	java Deadlock
	if %var% leq 1000 GOTO start
	pause

分析：

synchronized：同步代码。当一个线程访问object的一个synchronized(this)同步代码块时，其他线程对object中所有其它synchronized(this)同步代码块的访问将被阻塞。

在多次运行程序后，会使得a.methodA(b)和b.methodB(a)同时运行：a试图访问b中的last函数，但b.last被阻塞（b.methodB占有了资源），要等待b.methodB释放资源；同样b试图访问a中的last函数，但a.last被阻塞（a.methodA占有了资源）,要等待a.methodA释放资源。
其结果就是彼此都占有资源且不释放资源，产生死锁。

运行截图：

![Result of Deadlock Test](https://raw.githubusercontent.com/jamesljk/ES2016_14353163/master/Deadlock_img_01.JPG)

### Experience

本次实验课之前，其实黄凯老师就在longlong ago的理论课上讲了这次实验的内容==，他还当堂跑了一遍代码，所以这次实验对我来说就。。。（然而学一饭堂救不了中国人）。在分析老师（ta的ppt上也是）的代码时，还是得上网查一下同步的概念==。总的来说，这次实验让我们了解了死锁的出现条件和出现状况，加深了对死锁的理解。