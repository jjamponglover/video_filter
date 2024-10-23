# ◾ Video Filter
<h3> ov7670모듈을 사용하여 촬영한 영상을 실시간 필터 처리 <img alt="Static Badge" src="https://img.shields.io/badge/Verilog-08298A"> <img alt="Static Badge" src="https://img.shields.io/badge/Vivado-F2F5A9"> <img alt="Static Badge" src="https://img.shields.io/badge/C-00599C"> <img alt="Static Badge" src="https://img.shields.io/badge/STM32-2ECCFA">  </h3>
<img src = "https://github.com/user-attachments/assets/8899ab6e-868d-42c8-b3a2-9d17f91574af" width="50%" height="50%">

# ◾ Introduce
* Nucleo F411RE 보드를 이용 RC-CAR 구현
* ov7670모듈을 사용하여 영상촬영
* 카메라 모듈로 촬영한 영상을 basys3 보드를 통해 필터 적용 후 VGA 단자를 통해 모니터에 출력

# ◾ Features
* ov7670 모듈을 통하여 촬영한 영상을 VGA를 통해 출력
* 영상 데이터를 메모리에 저장 후 필터 적용
* 스위치 입력에 따라 필터 컨트롤
  * Gray Scale Filter
  * Gaussian Filter
  * Sobel Filter
# ◾ Result
<img src = "https://github.com/user-attachments/assets/ab9abec8-197f-42a5-aea1-247d60930c00" width="20%" height="20%"> <img src = "https://github.com/user-attachments/assets/fc543efe-dd6e-4af5-a1fc-5c295609636d" width="20%" height="20%"> <img src = "https://github.com/user-attachments/assets/40cb7219-14d9-4518-bb26-55786ff2c956" width="20%" height="20%">  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**기본**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Gray filter**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Gaussian Filter**   
<br>   
<img src = "https://github.com/user-attachments/assets/5aa2380d-f92d-4078-8f9b-177d08ad660f" width="20%" height="20%"> <img src = "https://github.com/user-attachments/assets/683e49a2-b767-4d8a-bff9-e8466f891f99" width="20%" height="20%"> <img src = "https://github.com/user-attachments/assets/9b464e86-3807-42c1-b598-67e6636029ed" width="20%" height="20%">   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Sobel(-)**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Sobel()**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Sobel(+)**

# ◾ Operation Video
* 동작 영상 : https://youtube.com/shorts/G9N37caUjqk?feature=share

# ◾ PPT
https://docs.google.com/presentation/d/18f-8hb3fsiFemCm_-nXAMFwp7X6uXBuc/edit?usp=sharing&ouid=115252002698098783286&rtpof=true&sd=true
