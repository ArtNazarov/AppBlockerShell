#!/bin/bash

# Путь к списку заблокированных приложений
text_file="blocked_apps_list.txt"

# Скрипт для применения настроек
apply_script="apply_settings.sh"

# Отобразить окно
result=$(zenity --width=400 --height=500 \
  --title="Настройки" \
  --text="Выберите опции:" \
  --list \
  --column="Выбор" \
  --column="Действие" \
  --radiolist \
  2 "Правка списка" \
  3 "Применение настроек" \
  1 "Отмена")

echo $result

# Выбор пользователя
case $result in
  "Правка списка")
    # Открываем файл для правки настроек
    file_content=$(zenity --text-info \
      --title="Введите имена программ построчно" \
      --filename="$text_file" \
      --editable)
    echo $file_content
    # Сохраним в файл разбивая по пробелам построчно
    echo "$file_content" | tr ' ' '\n' > $text_file
    ;;
  "Применение настроек")
    # Выполнить скрипт
    bash "$apply_script"
    ;;
esac
