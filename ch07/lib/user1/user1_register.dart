/*
  날짜 : 2025/10/29
  이름 : 이수연
  내용 : 05.Flutter REST API 실습 -user1
*/
import 'package:ch07/user1/user1.dart';
import 'package:ch07/user1/user1_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User1Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _User1RegisterState();
}

class _User1RegisterState extends State<User1Register> {

  final _formKey = GlobalKey<FormState>();
  final _useridController = TextEditingController();
  final _nameController = TextEditingController();
  final _birthController = TextEditingController();
  final _ageController = TextEditingController();

  final service = User1Service();

  String message = '';

  // 전송 폼 메서드
  Future<void> _submitForm() async {

    if(!_formKey.currentState!.validate()) return;

    // user1 Model 클래스 생성 후 작성 가능.
    User1 inputUser = User1(
        userid: _useridController.text,
        name: _nameController.text,
        birth: _birthController.text,
        age: int.tryParse(_ageController.text) ?? 0
    );

    try {
      User1 savedUser = await service.postUser(inputUser);
      // print('savedUser : ${savedUser} 등록');

      await _showDialog('등록 성공', '사용자가 성공적으로 등록되었습니다.');

      // 목록 이동하면서 true 반환 (true가 새로고침에 필요)
      Navigator.pop(context, true);

    }catch(err){
      setState(() {
        message = '등록 실패, 에러 발생 했습니다. $err}';
      });
    }
  }

  // 성공 안내 팝업 창
  Future<void> _showDialog(String title, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // 뒤(목록)로가기
            child: const Text('OK'), // 버튼
          ),
        ],
      )
    );
  }


  Future<void> selectBirth() async {
    DateTime now = DateTime.now();
    final DateTime? selectedDate = await showDatePicker( // 달력 설정
        context: context,
        initialDate: DateTime(1994, 4, 29),
        firstDate: DateTime(1900),
        lastDate: now
    );

    if(selectedDate != null){
      setState(() {

        //String fmtDate = DateFormat('yyyy-MM-dd').format(selectedDate);
        _birthController.text = selectedDate.toString();

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User1 등록'),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _useridController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '아이디 입력'
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이름 입력'
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _birthController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '생년월일 입력'
                ),
                readOnly: true, // 수정 못하게, 읽을 수 있게만 하기.
                onTap: selectBirth, // 달력 띄우기
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '나이 입력'
                ),
              ),
              const SizedBox(height: 10,),


              // 취소 버튼, 등록 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context); // 뒤로가기
                  }, child: const Text('취소')),
                  const SizedBox(width: 10,),
                  ElevatedButton(onPressed: _submitForm, child: const Text('등록')),
                ],
              ),
              Text(message)
            ],
          )
        ),
      ),
    );
  }
}