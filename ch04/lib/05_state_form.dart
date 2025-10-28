/*
  날짜 : 2025/10/27
  이름 : 이수연
  내용 : Widget Form 실습
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('05.폼 위젯 실습'),),
        body: FormPage(),
      ),
    );
  }
}

// FormPage : 화면, _FormPageState : 변하는 상태
class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormPageState();
}
class _FormPageState extends State<FormPage> {

  // 폼을 식별하고 상태를 관리하는 전역키 생성
  final _formkey = GlobalKey<FormState>();

  // 컨트롤러 생성
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
      // 이메일은 컨트롤러 없이 처리를 해보자.

  // 상태 변수
  String _email = '';
  bool _isCheck = false;
  String _gender = 'M';
  bool _isSwitched = false;
  String _submitResult = '';

  // 폼 취소 함수
  void _cancelForm(){
    _formkey.currentState!.reset();

    _idController.clear();
    _pwController.clear();
    _nameController.clear(); // 컨트롤러로 관리하는 것은, 컨트롤러로 해지해야 함.

    _isCheck = false;
    _isSwitched = false;

    _submitResult = '';

    // 화면 제빌드
    setState(() {});

  }


  // 폼 제출 함수 정의
  void _submitForm() {

    // 폼 유효성 검사
    if(_formkey.currentState!.validate()) {

      _formkey.currentState!.save();

      String idValue = _idController.text;
      String pwValue = _pwController.text;
      String nameValue = _nameController.text;

      // 나중에 통신을 배우면, 여기에서 통신에 대한 부분이 나올 것.
      setState(() {
        _submitResult = '입력 성공!\n'
        '아이디 : $idValue\n'
        '비밀번호 : $pwValue\n'
        '이름 : $nameValue\n'
        '이메일 : $_email\n'
        '가입동의 : $_isCheck\n'
        '성별 : $_gender\n'
        '푸시 알림 허용 : $_isSwitched';
      });
    }else{
      setState(() {
        _submitResult = '입력 실패! 입력 항목을 확인하세요.';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Form( // 굉장히 중요한 위젯!!!!!!! -> 서버로 전송하는 위젯
        key: _formkey, // ??를 설정하기 위해 반드시 key 설정을 해야 함
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
          children: [
            TextFormField(
              controller: _idController,
              decoration: const InputDecoration(
                labelText: '아이디',
                border: OutlineInputBorder()
              ),
              validator: (value){ // 유효성 검사
                if (value == null || value.isEmpty)
                  return '아이디를 입력하세요';
                if (value.length < 4)
                  return '아이디는 4자 이상이어야 합니다.';

                return null;
              },
            ),
            const SizedBox(height: 30,),

            TextFormField(
              controller: _pwController,
              obscureText: true, // 입력 텍스트 마스킹 처리
              decoration: const InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder()
              ),
              validator: (value){
                if (value == null || value.isEmpty)
                  return '비밀번호를 입력하세요';
                if (value.length < 6)
                  return '비밀번호는 6자 이상이어야 합니다.';

                return null;
              },
            ),
            const SizedBox(height: 30,),

            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: '이름',
                  border: OutlineInputBorder()
              ),
              validator: (value){
                if (value == null || value.isEmpty)
                  return '이름을 입력하세요';

                return null;
              },
            ),
            const SizedBox(height: 30,),

            TextFormField(
              decoration: const InputDecoration(
                  labelText: '이메일',
                  border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if (value == null || value.isEmpty)
                  return '이메일을 입력하세요';
                if (!value.contains('@'))
                  return '유효한 이메일이 아닙니다';

                return null;
              },
              onSaved: (value){
                _email = value!; // ???
              },
            ),

            const SizedBox(height: 30,),
            CheckboxListTile(
              title: const Text('회원 가입에 동의 합니다.'),
                value: _isCheck,
                onChanged: (value){
                  setState(() {
                    _isCheck = value ?? false; // null 이면 flase가 된다.
                  });
                },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 30,),
            const Text('성별 선택 : ', style: TextStyle(fontSize: 16),),
            RadioGroup( // 최신에서는 'RadioGroup'을 사용해야 함. 인터넷에 있는 내용은 거의다 안됨. 최근에 바뀜.
                onChanged: (value){
                  setState(() {
                    _gender = value ?? '';
                  });
                },
                groupValue: _gender,
                child: Row(
                  children: [
                    Expanded(
                        child: RadioListTile<String>(
                          value: 'M',
                          title: const Text('남자'),
                        )
                    ),
                    Expanded(
                        child: RadioListTile<String>(
                          value: 'F',
                          title: const Text('여자'),
                        )
                    ), // 상태 변수 사용해야 체크 가능함.
                  ],
                )
            ),

            const SizedBox(height: 30,),
            Row(
              children: [
                const Text('푸쉬 알림 허용'),
                const Spacer(), // 위 아래 내용을 좌우 정렬 되도록.
                Switch(
                    value: _isSwitched,
                    onChanged: (value){
                      setState(() {
                        _isSwitched = value; // Nullable이 아님. on/off 둘 중 하나뿐이므로.
                      });
                    }
                )
              ],
            ),

            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _cancelForm, // 위에 함수를 따로 정의할 것
                    child: const Text('취소')
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: _submitForm, // 위에 함수를 따로 정의할 것
                    child: const Text('제출')
                )
              ],
            ),
            const SizedBox(height: 30,),
            Text(_submitResult)
          ],
        ),
      ),
    );
  }

}