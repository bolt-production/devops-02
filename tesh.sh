#!/bin/sh

test_success() {
    output=$(echo "$1" "$2" "$3" | $APP)
	test "$output" = "$4"
}

test_success_combinations() {
    test_success "$1" "$2" "$3" "$4"
	test_success "$1" "$3" "$2" "$4"
	test_success "$2" "$1" "$3" "$4"
	test_success "$2" "$3" "$1" "$4"
	test_success "$3" "$1" "$2" "$4"
	test_success "$3" "$2" "$1" "$4"
}

test_fail() {
    if output=$(echo "$1" "$2" "$3" | $APP 2>/dev/null); then 
	    echo "Test $1 $2 $3 must fail"
		exit 1
	else
        test -z "$output"
    fi		
}

test_fail_combinations() {
    test_fail "$1" "$2" "$3"
	test_fail "$1" "$3" "$2"
	test_fail "$2" "$1" "$3"
	test_fail "$2" "$3" "$1"
	test_fail "$3" "$1" "$2"
	test_fail "$3" "$2" "$1"
}

APP="$1"

set -e

test_fail_combinations 0 0 0
test_success_combinations 1 1 1 "равносторонний треугольник"
test_success_combinations 70 70 70 "равносторонний треугольник"

test_fail_combinations 1 1 20
test_fail_combinations 20 0 20

test_success_combinations 2 3 4 "обычный треугольник"
test_success_combinations 3 4 5 "прямоугольный треугольник"

echo "все тесты успешнно прошли"
