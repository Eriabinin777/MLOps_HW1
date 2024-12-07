# MLOps_HW2
Bмплементация цикла обучения на pytorch lightning, использование hydra как точку входа, подключение DVC для хранения файлов

## Последовательность действий
### Шаг 1

Пишем необходимы код для лайтнинга  PyTorchLightning, используя MNIST

### Шаг 2

Для удобства задания параметров обучения мы воспользуемся hydra. Для этого создим дирикторию conf с нужными конфигами, а также добавить декоратор hydra в файл train.py

### Шаг 3

Начинаем работу с DVC. Мы должны начать инициализацию, после добавить трекинг данных и настроить хранилище

```bash
dvc init
git add .dvc .gitignore

dvc add data/MNIST/raw
git add data/MNIST/raw.dvc

dvc remote add -d myremote <remote_url>
dvc push
```

### Шаг 4

Пушим логи обучения

```bash
dvc add logs
git add logs.dvc
git commit -m "Add training logs"
dvc push
```




