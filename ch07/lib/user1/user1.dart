/*
  날짜 : 2025/10/29
  이름 : 이수연
  내용 : 05.Flutter REST API 실습 -user1 Model class (DTO 같은 것)
*/

class User1 {

  String userid;
  String name;
  String birth;
  int age;

  User1({required this.userid, required this.name, required this.birth, required this.age});

  factory User1.fromJson(Map<String, dynamic> jsonDate) {
    return User1(
        userid: jsonDate['userid'],
        name: jsonDate['name'],
        birth: jsonDate['birth'],
        age: jsonDate['age']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "userid": userid,
      "name": name,
      "birth": birth,
      "age": age,
    };
  }

  @override
  String toString() {
    return 'User1{userid: $userid, name: $name, birth: $birth, age: $age}';
  }

}