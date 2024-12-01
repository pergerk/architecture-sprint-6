В плане scaletest
легче использовать готовый конфиг helm как для ci/cd так и для таких вещей как тестирование
в системе используется docker-desktop c веключенным kubernetes extension скрипты для него


сгенерить из шаблонов можно так
helm upgrade --install scaletest --namespace default --debug --dry-run  --values  ./scaletest/values.yaml ./scaletest > scaletest.yml
и удалив ненужные манифесты получим требуемый в задании файл
scaletest.yml
Незнаю можно ли так
