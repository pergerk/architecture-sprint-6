## Анализ
В проекте архитектуры везде используется REST Api кроме как во внешних вызовах к Системам страховых компаний

Из технического решения следует что:
    Сервис core-app осуществляет запрос к ins-product-aggregator - раз в 15 минут
    Сервис core-app осуществляет запрос к ins-comp-settlement — раз в сутки (ночью)
    Сервис ins-comp-settlement осуществляет запрос в core-app - раз в сутки

Проблемы:
    Рассинхронизация данных на 15 минут - между core-app и ins-comp-settlement
    Рассинхронизация данных на 1 сутки
    При неправильном ответе от Системы страховых компаний (неизвестное поведение)



## Решение
Изменить взаимодействие между core-app и ins-product-aggregator на eventStream
Изменить взаимодействие между core-app и ins-comp-settlement на eventStream
Изменить взаимодействие между ins-product-aggregator и ins-comp-settlement на eventStream

Использовать TransactionalOutbox стоит в случаях:
    core-app <----> ins-comp-settlement <----> Системы страховых компаний
    core-app <----> ins-product-aggregator <----> Системы страховых компаний
                            \-----> ins-comp-settlement

TransactionalOutbox позволит соблюдать консистенцию данных внутри системы.
      Так же позволит в интеграциях с внешними системами тоже сохранить консистентность данных и испротзовтаь разные Retry стратегии
