$(document).ready(function() {
// 아이디 입력 필드의 포커스 아웃 이벤트에 대한 핸들러 함수
    $('#userId').blur(function() {
        var userId = $(this).val(); // 입력된 아이디 값 가져오기

        // AJAX를 이용해 서버에 아이디 중복 여부를 확인하는 요청 보내기
        $.get('/user-id/' + userId + '/exists', function(data) {
            // 서버로부터의 응답을 처리하는 로직
            if (data) {
                // 아이디가 이미 존재하는 경우
                $('#idNotAvailable').show(); // 이미 사용중인 아이디 안내 메시지 출력
                $('#idAvailable').hide(); // 사용 가능 안내 메시지 숨김
            } else {
                // 아이디가 존재하지 않는 경우
                $('#idAvailable').show(); // 사용 가능 안내 메시지 출력
                $('#idNotAvailable').hide(); // 이미 사용중인 아이디 안내 메시지 숨김
            }
        });
    });
    
// 패스워드 중복 확인
var passwordCheckMessage = $('#passwordCheckMessage').text();           

// 비밀번호 중복 확인
$('#password2').blur(function() {
    var password = $('#password1').val();
    var check_password = $('#password2').val();
    
    // 비밀번호 확인 여부 확인
    if (password != check_password) {
        $('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다.').css('color', 'red');
    } else {
        $('#passwordCheckMessage').html('비밀번호가 일치합니다.').css('color', 'blue');
    }
});


function validatePassword() {
            var password = document.getElementById("password1").value;
            var confirmPassword = document.getElementById("password2").value;

            if (password != confirmPassword) {
                alert("Passwords do not match");
                return false;
            }
            return true;
        }

});

//자동 하이픈 기능 추가
const autoHyphen = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}