#!/bin/bash
read a b c

 
if [ $a -le 0 -o $b -le 0 -o $c -le 0 ]; then
      echo "числа должны быть больше нуля" >&2;exit 1 
fi

let ab=$a+$b
let bc=$b+$c
let ac=$a+$c

if ! [ $ab -gt $c -a $bc -gt $a -a $ac -gt $b ]; then
	echo "$a $b $c не являются сторонами треугольника" >&2;
	exit 1
fi

let aa=$a*$a
let bb=$b*$b
let cc=$c*$c

let aabb=$aa+$bb
let bbcc=$bb+$cc
let aacc=$aa+$cc

if [ $aabb -eq $cc -o $bbcc -eq $aa -o $aacc -eq $bb ]; then
	echo "прямоугольный треугольник";
	exit 0
fi

if [ "$a" -eq "$b" ]; then
        if [ "$b" -eq "$c" ]; then
                echo "равносторонний треугольник";exit 0
        else
                echo "равнобедренный треугольник";exit 0
        fi
else
        if [ "$b" -eq "$c" ]; then
                echo "равнобедренный треугольник";exit 0
        fi
fi

 

echo "обычный треугольник"
