# -*- coding: utf-8 -*-
import os


# Функция выбора системы счисления
def get_num_sys(msg):
    while True:
        num_sys = print(msg)
        num_sys = input('>>>')
        num_sys = num_sys.upper()
        if num_sys == 'BIN':
            return 2
        elif num_sys == 'OCT':
            return 8
        elif num_sys == 'DEC':
            return 10
        elif num_sys == 'HEX':
            return 16


# Функция перевода из двоичной системы
def convert_num_sys(value, f_num_sys, t_num_sys):
    value = int(value, f_num_sys)
    if t_num_sys == 2:
        return bin(value)
    elif t_num_sys == 8:
        return oct(value)
    elif t_num_sys == 10:
        return value
    elif t_num_sys == 16:
        return hex(value)
