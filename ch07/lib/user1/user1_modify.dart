/*
  날찌 : 2025/10/29
  이름 : 이수연
  내용 : 05.Flutter REST API 실습 - user1 수정 구현
*/

import 'package:ch07/user1/user1.dart';
import 'package:ch07/user1/user1_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class User1Modify extends StatefulWidget {

  final String userid; // 전달받은 사용자 아이

  const User1Modify({super.key, required this.userid});

  @override
  State<StatefulWidget> createState() => _User1ModifyState();
}

class _User1ModifyState extends State<User1Modify> {
  // 폼 키
  final _formKey = GlobalKey<FormState>();

  // 컨트롤러
  final TextEditingController _useridController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // 인스턴스(객체?) 생성
  final User1Service service = User1Service();

  @override
  void initState() {
    super.initState();

    log("here...1");
    _loadUser();
  }

  // 기존 사용자 데이터 불러오기
  Future<void> _loadUser() async {
    log("here...2");

    try {
      // ⭐Spring에서 ResponseEntity.status(HttpStatus.FOUND)로 되어 있어서 데이터를 못 가져옴 FOUND -> OK로 해야됨
      User1 user = await service.getUser(widget.userid);
      log("here...3 : $user");

      setState(() {
        _useridController.text = user.userid;
        _nameController.text = user.name;
        _birthController.text = user.birth;
        _ageController.text = user.age.toString();
      });
    }catch(e){
      _showDialog('조회 실패', '사용자 정보를 불러오는 중 오류가 발생했습니다. \n$e');
    }

  }

  // 폼 제출 : 수정 완료 후 저장
  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return; // !validate() : 검증실패, return : 함수 즉시 종료   // currentState : 실제 From 위젯의 상태(FormState)객체

    final User1 modifyUser = User1(
        userid: _useridController.text,
        name: _nameController.text,
        birth: _birthController.text,
        age: int.tryParse(_ageController.text) ?? 0,
    );

    try{
      // ⭐Spring에서 ResponseEntity.status(HttpStatus.ACCEPTED)로 되어 있어서 데이터를 못 가져옴 ACCEPTED -> ok로 해야됨
      User1 modifiedUser = await service.updateUser(modifyUser);

      // 성공
      await _showDialog('수정 성공', '사용자가 성공적으로 수정 되었습니다! \nUserID: ${modifiedUser.userid}');

      // async 이후 context 안전하게 사용하기 위한 처리, _User1RegisterState 객체가 위젯 트리에 없으면 함수 종료
      if (!mounted) return;

      // 성공 후 목록 이동
      Navigator.pop(context, modifiedUser);

    }catch(e){
      // 실패
      _showDialog('수정 실패', '사용자 수정 중 오류가 발생했습니다.\n$e');
    }
  }

  // 대화상자(Dialog) 보여주기 : 성공/실패 알림
  Future<void> _showDialog(String title, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(  // AlertDialog : 작은 알림창 위젯 (Alert:경고, 알림)
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: (){},
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  // 생년월일 선택
  Future<void> _selectBirth() async {
    DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: now
    );
    if(picked != null){
      setState(() {
        _birthController.text = picked.toString();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User1 수정'),),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // 아이디
            TextFormField(          // 사용자 입력 폼 ( 폼 검증/제출 기능) // TextField : 그냥 텍스트 입력만 가능
              controller: _useridController,
              readOnly: true,
              decoration: const InputDecoration(labelText: 'User Id'),
              validator:            // validator는 입력값 검증 함수
                  (value) => value!.isEmpty ? 'User Id를 입력하세요' : null,
            ),
            const SizedBox(height: 12,),

            // 이름
            TextFormField(
              controller: _nameController,
              readOnly: true,
              decoration: const InputDecoration(labelText: '이름'),
              validator: (value) => value!.isEmpty ? '이름을 입력하세요' : null,
            ),
            const SizedBox(height: 12,),

            // 생년월일
            TextFormField(
              controller: _birthController,
              readOnly: true,
              decoration: const InputDecoration(labelText: '생년월일 (날짜 선택)'),
              onTap: () => null,
              validator: (value) => value!.isEmpty ? '생년월일을 입력하세요' : null,
            ),
            const SizedBox(height: 20,),

            //나이
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,   // 숫자 키보드 표시
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,   // 숫자만 허용
              ],
              decoration: const InputDecoration(labelText: '나이 (숫자만 입력)'),
              validator: (value) => value!.isEmpty ? '나이를 입력하세요' : null,
            ),
            const SizedBox(height: 20,),

            // 취소/수정 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context); // 뒤(목록)로 가기
                    },
                    child: const Text('취소하기')
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                    onPressed: (){},
                    child: const Text('수정하기')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


}
