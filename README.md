# scripts

# rgx
Regex. 말 그대로 터미널에서 정규식을 쉽게 쓸 수 있도록 해주는 스크립트
```shell
usage: rgx [-h] [-s] [-e] [-u UNBUFFERED] [-r] [-E] [-f FLAGS] [-d [DELIM]]
           pattern [template]

find regex pattern from stdin and print captured groups with template

positional arguments:
  pattern               pattern. ex) '(\w+):(\d+)' or '(?P<app>\w+?)app)'
  template              output template. ex) '{0}:{1}' or '{key}={value}'.
                        default is {0} {1} {2}...

options:
  -h, --help            show this help message and exit
  -s, --sub             instead of only printing captured groups, substitutes
                        pattern with template
  -e, --emphasize       instead of only printing captured groups, prints all
                        with emphasizing captured groups
  -u UNBUFFERED, --unbuffered UNBUFFERED
                        running in unbuffered mode with <UNBUFFERED> lines
                        window. 0 for lines of pattern
  -r, --raw             print escaped <pattern> and exit
  -E, --extended-expression
                        use \e<...> extended expression. availables are
                        ipv4,ipv6,mac,uuid,email
  -f FLAGS, --flags FLAGS
                        flags for regex. ex) -fMS <- MULTILINE | DOTALL
  -d [DELIM], --delim [DELIM]
                        line delimiter. default is \n
```

![image](https://user-images.githubusercontent.com/19762154/175819228-1321f5f9-2194-41b7-9cda-16ae9d0ee733.png)

- substitute, emphasize, unbuffered 모드를 개별적으로 지원하며, 조합해서 사용도 가능
- Multiline이나 case Insensitive 등을 위한 flag나 captured group을 출력할때 template을 지정해주는 것도 지원
- 추가로 임의의 extended expression을 지원해 \e<ipv4>나 \e<mac>과 같은 식의 표현이 가능
  
# owh
Overwrite With History. 어떤 파일을 수정할때 diff를 같이 백업해주는 스크립트

```shell
Usage: owh [-c] [-t] [-r] [<file>]

    -c      copy /home/dongho/.local/share/owh or /home/dongho/.local/share/owh/<file path> to clipboard
    -h      print this help message
    -t      tree /home/dongho/.local/share/owh
    -r      revert file with latest diff
```

![image](https://user-images.githubusercontent.com/19762154/175861340-8ca540d8-cbee-4518-a0b1-5a2c4f67d997.png)

- 실수로 중요한 설정 파일을 잘못 수정하고 저장했을때 백업해둔 diff로 복원 기능을 지원

# Others
- custom_rofi: window switcher [rofi](https://github.com/davatorium/rofi)에 자주쓰는 항목들을 따로 모아두고 subcommand 기능을 추가해 커스텀한 스크립트
- demonstrate: 시연용 스크립트. 시연에 필요한 스크립트를 담은 파일 foo를 demonstrate foo한 뒤, 아무 인자 없이 demonstrate를 호출하면 이전에 등록한 foo에서 맨 위부터 한줄씩 자동으로 타이핑
- lock: 현재 화면을 blur 처리해 screen lock 해주는 스크립트
- random_name: docker 스타일의 random name을 출력하는 스크립트
- random_stream: fortune 스타일의 random text를 계속 출력하는 스크립트
- random_wallpaper: 현재 배경화면을 특정 경로에서 무작위 이미지를 골라 교체하는 스크립트
- rglt: ReGuLaTe. pipe간 in/out 속도를 조절해주는 스크립트. character/line/word 단위로 속도 조절이 가능. `rglt -h`를 참고
- send_key: 특정 window id에 임의의 키입력을 보내는 스크립트. 현재 포커스를 잃지 않고 전달이 가능
- xwf: eXecute With Format. 임의의 명령을 치환해서 실행시키는 스크립트. 환경변수 대신 인자로 치환이 가능
