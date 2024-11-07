# MLOps_HW1
Биндинг для подсчета среднеквадратичного отклонения двух векторов

## Последовательность запусков
### Шаг 1

Создаем в командной строке docker image

```bash
docker build --no-cache -t my_mse .
```

### Шаг 2

Запускаем контейнер

```bash
docker run --rm -it my_mse
```

### Шаг 3

Устанавливаем пакет

```bash
make MeanSquaredError
python3 -m build
pip3 install dist/*.whl
```

### Шаг 4

Сравниваем реализацию с библиотечной функцией

```bash
python3 perf.py
```


