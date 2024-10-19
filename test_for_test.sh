expected_output="./test.sh"
if [[ "$1" == "$expected_output" ]]; then #всё окей
    echo "First test passed!"
        bash "$1" "$2" "$3"
        res=$(bash "$1" "$2" "$3") #чтобы начал работать основной скрипт test.sh
        if [[ ! -d "$2" ]]; then #проверяет, есть ли переданная папка
            echo "Second test failed!"
            echo "That folder does not exist"
        else
            echo "Second test passed!"
        fi
        if [[ -z "$3" ]]; then #проверяет, есть ли переменная
            echo "Third test failed!"
            echo "No argument provided"
        else
            echo "Third test passed!"
        fi
        if [[ $res =~ ^[0-9]+ ]]; then #выводит ли процент заполнения папки
            echo "Fourth test passed!"
        else
            echo "Fourth test faled!"
            echo "Folder full percentage is not displayed"
            echo "Something is wrong with the test.sh"
        fi
elif [[ -z "$1" ]]; then #дурачок не ввёл ничего
    echo "First test failed!"
    echo "Please enter the command"
elif [[ "$1" == "/test.sh" ]]; then #забыл точечку
    echo "First test failed!"
    echo "Expected: $expected_output"
    echo "Please add a dot at the beginning"
else #вообще накосячил
    echo "First test failed!"
    echo "Expected: $expected_output"
    echo "Got: $1"
fi
#вы сказали, что эти тесты на ввод можно считать за два разных. Поэтому первый тест считается за два