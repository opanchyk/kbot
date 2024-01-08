# OlePan_bot

Telegram бот написаний на Go для демонстраційних цілей.

## Посилання на бота  

[@OlePan_bot](https://t.me/OlePan_bot)

## Опис

Цей бот написаний на Go з використанням бібліотеки [Cobra](https://github.com/spf13/cobra) для створення команд та [Telebot](https://github.com/tucnak/telebot) для роботи з Telegram Bot API.

Приклади команд:

- `/start` - запуск бота
- `/start hello` - привітання від бота

## Встановлення

```bash
go get github.com/spf13/cobra
go get gopkg.in/telebot.v3

go build -ldflags "-X="github.com/OlePan/kbot/cmd.appVersion=v1.0.2

read -s TELE_TOKEN
export TELE_TOKEN

 ./kbot start 