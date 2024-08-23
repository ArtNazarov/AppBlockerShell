#!/bin/bash

# Массив заблокированных приложений
readarray -t BLOCKED_APPS < blocked_apps_list.txt

# Функция для завершения процессов
kill_processes() {
    for app in "${BLOCKED_APPS[@]}"; do
        # Получаем PID процессов с именем приложения
        pids=$(pgrep -x "$app")
        if [ -n "$pids" ]; then
            echo "ЗАПРЕЩЕНО! Завершение процессов: $app (PID: $pids)"
            kill $pids
        fi
    done
}

# Функция для блокировки по времени
checktime(){
    # Узнать текущий час
	DT=$(date +%H)
	# Преобразуем DT в десятичное число
    DT=$((10#$DT))
	# если время до 7 вечера И больше 3 часов ночи
    if (( DT <= 19 && DT >= 3 ));
    then
        # завершить процессы по списку
		kill_processes
	fi
}


# Основной цикл - бесконечно
while true; do
    # проверить согласно времени
	checktime
	# пауза на 5 секунд перед следующей проверкой
	sleep 5
done
