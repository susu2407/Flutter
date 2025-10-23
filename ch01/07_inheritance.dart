/*
    날짜 : 2025/10/23
    이름 : 이수연
    내용 : 1장 - Dart 상속
*/

// 부모 클래스
class Animal {
  String _name;

  Animal(this._name);

  void speak() {
    print('speak ${_name}');
  }

  void move() {
    print('move $_name');
  }
}

// 자식 클래스
class Dog extends Animal {
  String _bread;

  Dog(String name, this._bread) : super(name);

  @override
  void speak() {
    print('$_name($_bread) 멍멍! ');
  }

  void walk() {
    print('$_name($_bread) 산책 중...');
  }

}

class Cat extends Animal {
  String _bread;

  Cat(String name, this._bread) : super(name);

  @override
  void speak() {
    print('$_name($_bread) 야옹! ');
  }

  void walk() {
    print('$_name($_bread) 타워 오르는 중...');
  }

}




void main() {

  // Animal 생성
  Animal animal = Animal('동물');
  animal.speak();
  animal.move();

  // Dog 생성
  Dog myDog = Dog('순돌이', '푸들');
  myDog.speak();
  myDog.walk();

  Cat myCat = Cat('나비', '고양이');
  myCat.speak();
  myCat.walk();

  // 다형성
  Animal a1 = Dog('바둑이', '진돗개');
  Animal a2 = Cat('야용이', '고양이');

  a1.speak();
  a2.speak();

  if(a1 is Dog) {
    a1.walk();
  }

  if(a2 is Cat) {
    a2.walk();
  }


}