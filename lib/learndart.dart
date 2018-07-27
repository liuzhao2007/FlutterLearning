printInteger(int number) {
  print('The number is $number');

  var a = 10;
  var b = 20;
  int c; // default is null
  print("finally $a+$b = got ${a + b}");
  print("c is $c");

  var got = addThird(a, b);
  print("addThird got $got");

  sayHello(name: "liuzhao");
}

// 声明返回值
int addFirst(int a, int b) {
  return a + b;
}

// 不声明返回值也可以
addSecond(int a, int b) {
  return a + b;
}
// 练习缩写
addThird(a, b) => a + b;


/**
 * 命名参数,注意命名参数调用的方式就不一样了；也可以不传递参数直接调用这个方法
 * 如果一定需要这个参数，则加上 @required
 */
sayHello({String name}) {
  print("My name is $name");
}

/**
 * 位置参数：①使用[]括起来，代表可传可不传;
 * ②位置参数只能在函数的参数列表的最后面
 */
sayHelloTwo(var age, [String name]) {
  print("My name is $name");
}


// 参数默认值，命名参数
int add({int a, int b = 5}) {
  return a + b;
}

// 参数默认值，位置参数
plus(int a, [int b = 10]) {
  return a + b;
}

// 函数作为参数传递给另一个函数，例如array.forEach(printNum);
printNum(var a) {
  print("printNum $a");
}

// 函数赋值给某个变量，例子在main方法中

// 匿名函数
anonymousFunction(Function function) {
  function("anonymousFunction");
}

println() {
  print("");
}

// 运算符 与Java 不一样的运算符操作
/**
 * is 判断一个变量是不是某个类型的变量
 * is! 判断一个变量不是某个类型的变量
 * ~/ 取整运算符，/ 除法运算符
 * ??= 如果前面的变量为 null 则赋值，否则不赋值
 * .. 级联操作 类似于建造者模式
 */


main() {
  var num = 50;
  printInteger(num);

  var array = [1, 2, 3];
  array.forEach(printNum);

  // 函数赋值给变量示例
  var f1 = printNum;
  Function f2 = printNum;
  var f3 = (var a) => print("printNum $a");
  f1(1);
  f2(2);
  f3(3);

  // 匿名函数
  anonymousFunction((var param) {
    print(param);
  });

  // 运算符
  var str = "我是运算符";
  print(str is String);
  print(str is! int);

  int j = 1;
  int k = 2;
  print(j / k);
  print(j ~/ k);

  String testHas = "has";
  String testNull = null;
  testHas ??= "really has";
  testNull ??= "really has";
  print(testHas + "——————" + testNull + "\n");

  // 类似建造者模式的调用
  new Person()
    ..eat()
    ..run()
    ..study("studying");

  // 流程控制

  List<String> stringList = ["liuzhao", "work", "hard"];
  for (var str in stringList) {
    print(str);
  }

  println();
  stringList.forEach((str) => print(str));

  println();

  // 类
  //  var student = new Student("liuzhao", 18, 'male');
  var student = new Student.create("liuzhao", 18, 'male'); // 非传统构造方法
  student.sayHello();
}

class Human {
  Human.fromString(var str){
    print(str);
  }
}

/**
 * 注意：Human没有默认的构造方法，那么Man就需要调用父类的fromString 来做初始化
 * 写法如下，而不是将super写在函数前面；
 */
class Man extends Human {
  Man.fromString(var str) :super.fromString(str){
    print(str + "From Man");
  }
}


class Student {
  var name;
  int age;
  String gender;

  Student(this.name, this.age, this.gender); // 已经等同于 Java的构造方法

  // 意思是 Dart的构造方法不那么重要？
  Student.create(this.name, this.age, this.gender);

  void sayHello() {
    print("name is " + name + "age is $age " + "gender is" + gender);
  }

}


// 辅助 链式调用的Demo
class Person {
  void eat() {
    print("eating");
  }

  run() {
    print("runing");
  }

  study(var string) {
    print(string + "\n");
  }
}
