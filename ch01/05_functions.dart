/*
    날짜 : 2025/10/23
    이름 : 이수연
    내용 : 1장 - Dart 함수
*/
void hello() {
  print('Hello Dart!');
}

int add(int a, int b) {
  return a + b;
}

var greet = (String name){
  return 'Greeting ${name}';
};

int plus(int a, int b) => a + b;
int minus(a, b) => a - b;

int calc(int x, int y, int Function(int, int) operation) {
  return operation(x, y);
}

Function createHello(String name) {
  return () => "Hello, ${name}";
}

void main() {

  // 기본 함수
  hello();

  // 매개변수와 반환값이 있는 함수
  int result1 = add(1,2);
  int result2 = add(2,3);

  print('result1 : ${result1}');
  print('result2 : ${result2}');

  // 익명 함수
      // 변수에 저장해서 사용하는 것을 익명함수라고 한다. 콜백함수로 많이 사용한다.
  print(greet('김유신'));
  print(greet('김춘추'));

  // 화살표 함수(람다식)
  int rs1 = plus(2, 3);
  int rs2 = minus(2, 3);

  print('rs1 : ${rs1}');
  print('rs2 : ${rs2}');


  // 고차 함수(함수를 매개변수로 전달 받거나 반환하는 함수)
  int result = calc(10, 4, minus);
  print(' : ${result}');

  var hello = createHello("홍길동");
  print(hello());


  // 多이름이 있는 매개변수(Named Parameter, {중괄호} 매개변수 )
  // 多선텍적 위치 매개변수(Optional Positional Parameter, [대괄호] 매개변수)





}