title: GO数据类型概念
desc: GO数据类型概念
date: 2022-03-23 10:33:42
tags: [golang,go]
categories: golang
---
<!-- more -->



### 数据类型概念

- `值类型`和`引用类型`

> 两者的主要区别：拷贝操作和函数传参。
> 值类型的变量存储的是一个内存地址，引用类型的变量实际上是一个内存指针

~~~go
// 值类型：int、float、bool和string这些类型都属于值类型,
// 使用这些类型的变量直接指向存在内存中的值，，值类型的变量的值存储在栈中。当使用等号=将一个变量的值赋给另一个变量时，如 j = i ,实际上是在内存中将 i 的值进行了拷贝。可以通过 &i 获取变量 i 的内存地址。  值拷贝

// 引用类型：特指slice、map、channel这三种预定义类型
// 引用类型拥有更复杂的存储结构:(1)分配内存 (2)初始化一系列属性等一个引用类型的变量r1存储的是r1的值所在的内存地址（数字），或内存地址中第一个字所在的位置，这个内存地址被称之为指针，这个指针实际上也被存在另外的某一个字中。

// 1. 定义了一个数组a，它是值类型，复制给b是copy，当b发生变化后a并不会发生任何变化
func main() {
    a := [...]int{1, 2, 3, 4, 5}
    b := a
    b[2] = 100
    fmt.Println(a, b)
}
// [1 2 3 4 5] [1 2 100 4 5]

// 2. 使用切片再试一下  (结果是一样的，因为切片a存的不是一个地址，而是一个指针，那么 a 和 b的指针一样了，通过b进行变量的操作，那么实际上影响的还是那个内存地址)
func main() {
    // 大家看到下面是不是迷惑了
    // 为什么这个和上面的写法看着都一样呀
    // 这就涉及到切片操作了
    // 通过字面量创建切片，这种方法和创建数组类似，只是不需要指定[]运算符里的值。初始的长度和容量会基于初始化时提供的元素的个数确定
    a := []int{1, 2, 3, 4, 5}
    b := a
    b[2] = 8
    fmt.Println(a, b)
}
// [1 2 8 4 5] [1 2 8 4 5]





~~~

### 2. 数组 arrays

- 首先声明一个数组对象

~~~go
// 因为没有设置一个值，所以默认为0 ， 下面是 声明一个数组变量a， 元素的数据类型是 int， 一共有五个元素
var a [5]int
~~~


- 赋值数组内的元素

~~~go
//声明一个int数组，大小为5个, 每个元素默认为0 
var a [5]int


// 通过索引index的方式设置数组对象中元素的值 
// 语法 variableName[index] = value
// 需要注意的一点，就是数据类型，要和初始化时制定的数据类型一样才可以
a[4] = 200
a[3] = 100

fmt.Println("set: ", a)
// result  set: [0 0 0 100 200]
~~~

- 动态声明数组

~~~go

// 我们大概有以下集中声明数组的方法

// 1. 已知数组长度

// 这种方法，只是初始化，但是不带初始化值，也就是里面每个元素都为0
vat array [5]int

// 即能初始化变量，又带了初始化值
var array = [5]int{1, 2, 3, 4, 5}

// 可以不用写具体的长度，使用`...`代替
var array = [...]int{1, 2, 3, 4, 5}

// 简写
array := [...]int{1, 2, 3, 4, 5}

// 2. 当数组的长度是一个动态的值n的是时候，用上述的方法去初始化数组肯定会报错的，那这时候，我们应该去使用 `make` 函数

array := make([]int, n)
~~~



### 3. 切片 slice

> 一个切片有三部分组成，地址指针、 长度、 容量

~~~go
// 1. 长度是什么？
// 答： 是指可以访问的元素的个数
// eg： [1 2 3 4] 这个切片打印出来是这样的,那么这个切片的长度为4， 可以使用len函数去获取到这个值

// 2. 容量是什么？
// 首先普及一个概念，容量不是指这个切片当前的长度，而是指这个切片可以增长到的长度
// 你可以这样理解，都玩过MySQL吧，建表的时候，字符串类型一般用varchar和char
// 那这两个字段类型有什么区别呢？ 
// 你百度以下就知道了，我写下去，，又是一大堆字，懒得写，你就可以大致理解为，切片就类似于 varchar， 声明了一个200长度的字符串类型，唉，我就不放满，就放10个，就是玩，我也可以。 但是char就不行了，10个长度，你不放10个，，肯定报错！
~~~

- 通过 make() 函数创建切片

~~~go
// 创建一个切片，长度和容量都为10个元素
slice := make([]int, 10)

// 创建一个切片，制定长度为5， 容量为10
slice := make([]int, 5, 10)
~~~

- 通过字面量创建切片

> 另一种常用的创建切片的方法是使用切片字面量，这种方法和创建数组类似，只是不需要指定[]运算符里的值。初始的长度和容量会基于初始化时提供的元素的个数确定：

~~~go
// 创建一个长度和容量都为3的字符串切片
myStr := []string{"a", "b", "c"}

// 创建一个整型切片，长度和容量都为5
myInt := []int{1, 2, 3, 4, 5}

// 创建一个 长度为2 ， 容量为5 的整型切片
myInt2 := myInt[0:2]
fmt.Print("myInt2 len & cap ", len(myInt2), cap(myInt2))
// myInt2 len & cap 2 5 
~~~

- nil 和空切片
> 程序可能需要声明一个值为 nil 的切片（也称nil切片）。只要在声明时不做任何初始化，就会创建一个 nil 切片

~~~go

// 创建nil 整型切片
var myNum []int

// 创建空的 整型切片

// 使用字面量写法
myNum := []int{}

// 使用make 写法
myNum := make([]int, 0)



~~~


### 4. map 

- 声明map类型的变量
> 语法： make(map[key-type]value-type)


~~~go

// 1. 使用make 进行map数据类型变量的初始化 （引用类型变量需要初始化内存分配地址）

m := make(map[String]int)

fmt.Println("m", m)
// map [ ]

~~~


- 进行map变量的内容赋值
> 语法：经典的name[key] = value 
~~~go

m := make(map[string]int)

~~~