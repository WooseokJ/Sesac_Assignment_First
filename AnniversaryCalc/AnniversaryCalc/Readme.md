# 기념일 계산기 



https://user-images.githubusercontent.com/55547933/178940320-7bb46d8d-be0f-4ffb-af2c-42581696e85e.mp4



<img width="400" alt="스크린샷 2022-07-14 오후 5 38 29" src="https://user-images.githubusercontent.com/55547933/178940344-4b5d0bb8-ecbd-42f3-aab5-3a740db371d1.png">


# 학습내용
- [x] autolayout 을 통해 하단의 이미지뷰 위치 및 Datepicker 상단뷰 설정<br>
- [x] Calendar 구조체를 통해 100일,200일,300일,400일 후의 날짜계산 <br>
- [x] iOS 특정버전에서 분기처리 -> 14.0 미만일경우 캘린더가 wheels 방식 , (ps 위 영상은 14.0이상)
<img width="1099" alt="스크린샷 2022-07-14 오후 6 32 57" src="https://user-images.githubusercontent.com/55547933/178951771-626825d5-e4f6-464b-8a1c-76cdc7182571.png"><br>
- [x] outlet collection으로 연결할경우 D+300보다 D+400을 먼저 연결하면 연결 순서대로 위치하므로 반복문 문제발생-> outlet collection으로 연결시 순서대로 연결하는게 중요<br>
<img width="200" alt="스크린샷 2022-07-14 오후 5 46 22" src="https://user-images.githubusercontent.com/55547933/178942081-7e6e409d-b50b-4755-82d2-4df055ea97ed.png"><br>
- [x] var가아닌 let으로 선언해야됨. -> 이유: for문안에서 day값은 매번실행될떄 값이 변하지않으므로 코드안정성 및 컴파일러할떄 값이 변경되지 않으므로 더 빠른작업이 가능하기에 xcode에서 let을 권장. 만약 day의 값이 바뀌는 경우가 생긴다면 let이 아닌 var를 사용해야됨.<br>
<img width="751" alt="스크린샷 2022-07-14 오후 5 33 45" src="https://user-images.githubusercontent.com/55547933/178941497-7696c583-1bfe-499f-b1ce-f58771f033c6.png">
