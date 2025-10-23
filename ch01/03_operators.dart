/*
    날짜 : 2025/10/23
    이름 : 이수연
    내용 : 1장 - Dart 연산자
*/

void main() {

  //////////////////////////////////////
  // 기본 연산자
  //////////////////////////////////////
  int a = 10;
  int b = 3;

  // 산술 연산자
  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a ~/ b);
  print(a % b);

  // 대입 연산자
  int x = 5;
  print(x);

  x += 3;
  print(x);

  x *= 2;
  print(x);


  // 증감 연산자
  x++;
  print(x);

  x--;
  print(x);

  // 비교 연산자
  print(a == b);
  print(a != b);
  print(a > b);
  print(a < b);
  print(a >= 10);


  // 논리 연산자
  print(a > 1 && b > 1);    // false
  print(a < 10 || b < 11);  // true
  print(!(a > b));          // false

  // 삼항 연산자
  String result = a > b ? 'a가 크다' : 'b가 크다';
  print(result); // b가 크다

  // 타입 검사 연산자
  dynamic value = 'hello'; // 좀 더 안전하게 하기 위해서.

  print('value is int : ${value is int}');
  print('value is String : ${value is String}');
  print('value is! String : ${value is String}');



  //////////////////////////////////////
  // Null 관련 연산자 ★★★★★
  ////////////////////////////////////// Dart에 Nullable 이 있..

  // ★ Null 병합 연산자
  int? value1;
  int result1 = value1 ?? 100; // value1이 null이면 100을 대입.
  print('result1 : ${result1}');

  value1 = 50;
  int result2 = value1 ?? 200; // 최신 Dart 컴파일러는 자동으로 타입 체크를 통해 ?? 병합 연산자 생략
  print('result2 : ${result2}');

  int? num1;
  int? num2;
  int? num3;

  int result3 = num1 ?? num2 ?? num3 ?? 1000;
  print('result3 ${result3}');

  num2 = 2;
  int result4 = num1 ?? num2 ?? num3 ?? 1000;
  print('result4 : ${result4}');

  // Null 대입 연산자
  num3 ??= 3; // num3가 null이면 3 대입
  print('num3 : ${num3}');

  // Null 접근 연산자
  String? nullableString;
  print(nullableString?.toUpperCase());  // null 아닐 경우 toUppercase() 호출

     // nullableString이 null인 상태이기 때문에, 포인트널 상태이다. 그래서 앞에 ?을 붙여서, 'null이 아닐 경우'의 의미를 넣어준다.

  nullableString = 'hello dart';
  print(nullableString?.toUpperCase()); // null 아닐 경우 toUppercase() 호출


  // Null 강제 연산자
  int? maybeNumber = 3;
  int mustNotNullNumber = maybeNumber!; // Nullable 변수를 Non-Nullable 변수에 직접 대인은 안됨, 그래서 null이 아님을 명확히 보장하기 위해 ! 사용
       //확실하게 null이 아니기? 때문에 !를 붙여주는 것이디ㅏ. // 최신 dart에서부터 가능한 것.
  print(mustNotNullNumber);


}