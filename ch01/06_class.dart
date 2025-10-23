/*
    날짜 : 2025/10/23
    이름 : 이수연
    내용 : 1장 - Dart 객체지향 프로그래밍
*/
class Person {
  String? name;
  int? age;

  void introduce() {
    print('name: ${name}, age : ${age}');
  }
}

// 캡슐화. 필수 문법들 // _언더바가 은닉하는 타입?
class User {
  // 멤버 속성
  // 속성 앞에 _ 표기로 private 선언
  String _name;
  String _birth;
  int? _age;

  // 클래스 속성
  // static 정적, 고정 시킨다. 각 인스터스들 객체를 공유할 때에 static 을 이용한다.
  static int total = 0;

  // 지연 초기화 속성 (late), 속성을 생성자에서 초기화하지 않고, 객체를 생성 후 특정 메서드에서 초기화
  late String _email;

  // 기본 초기화 - 생성자로 초기화
  User(this._name, this._birth);

  // 명명된 생성자(Named Constructor), 초기화 목록 생성자
  // - 이름이 있는 생성자로, 내가 마음데로 짓는 것.
  User.withAge(String name, String birth, int age) : this._name = name, this._birth = birth, this._age = age {
    // 객체 생성 후 필요한 로직 처리
    total++;
    print('User.withAge 호출...');
  }

  User.guest(this._name) : this._birth = 'Unknown', this._age = 0;

  // factory 생성자 (객체를 캐싱하는 생성자)
  // 캐싱 : 보관한다
  static final Map<String, User> _cache = {}; // User 객체 캐싱 저장소

  factory User.createUser(String name, String birth) {
    if(_cache.containsKey(name)) { // name이 있다면
      return _cache[name]!; // 캐시에서 객체 반환 (뒤에 !를 붙여서 강제로 null이 아니라고 하기)
    }else {
      var newUser = User(name, birth);
      _cache[name] = newUser; // 캐시 저장
      return newUser;

    }
  }

  // Getter/Setter
  // - 은닉된 정보를 가져다 쓸 때에 Getter/Setter 사용
  String get name => _name;
  String get birth => _birth;
  int? get age => _age;

  set name(String name) {
    _name = name;
  }

  set birth(String birth) {
    _birth = birth;
  }

  set age(int age) {
    _age = age;
  }

  @override
  String toString() {
    return 'User{_name: $_name, _birth: $_birth, _age: $_age}';
  }

  // 메서드
  void hello() {
    print('name : $_name, birth : $_birth, age : $_age, email : $_email');
  }

  // late 속성을 초기화 하는 메서드
  void initEmail(String value) {
    if(value.contains('@')) {
      _email = value;
    }else{
      print('이메일 형식이 아닙니다.');
    }
  }



}

void main() {

  // 객체 생성
  Person person1 = Person();
  person1.name = '김유신';
  person1.age = 23;
  person1.introduce();

  // 객체 생성(Cascade 연산자 초기화)
  Person person2 = Person()
  ..name = '김춘추'
  ..age = 21
  ..introduce();

  // User 객체 생성
  var user1 = User('홍길동', '1990-09-02');
  user1.initEmail('hong@gamil.com'); // late 속성을 초기화
  user1.hello();

  // 속성 참조(Getter 사용)
  print('이름 : ${user1.name}'); //  _name 직접 접근 안됨, name Getter 호출
  print('이름 : ${user1.age}'); //  _age 직접 접근 안됨, age Getter 호출

  // Setter 사용, toString 출력 - 부분적으로 수정하는 것.
  user1.age = 30;
  print(user1);

  var user2 = User.withAge('김유신', '1990-02-03', 23);
  user2.initEmail('kim@naver.com');
  user2.hello();

  var user3 = User.guest('김춘추');
  user3.initEmail('chun@naver.com');
  user3.hello();

  var user4 = User.withAge('장보고', '1990-02-03', 23);
  user2.initEmail('jang@naver.com');
  user2.hello();


  // 클래스 속성
  print('전체인원 : ${User.total}');


}