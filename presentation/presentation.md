---
## Front matter
lang: ru-RU
title: Презентация по научной работе
#subtitle: Простейший шаблон
author:
  - Саргсян А. Г.
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 15 мая 2023

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Введение

## Цели и задачи работы

- Провести предварительную настройку оборудования для дальнейшей работы
- Ознакомиться со средой для моделировании сетей NS-2
- Изучить алгоритм для управления переполнением очередей маршрутизаторов Random early detection и её модификации
- Смоделировать сети с разными модификациями RED и вывести графики изменения длины очереди и средней длины очереди на первом
- Сравнить результаты моделирования при разных модификациях алгоритма, разных числовых значений и типов TCP агентов

## NS-2
NS-2 (Network Simulator-2) - это программное обеспечение для моделирования сетей, которое позволяет исследовать различные аспекты сетевых технологий и протоколов. Основными преимуществами NS-2 можно считать:

- Реалистичное моделирование сетевых протоколов и приложений
- Возможность тестирования сетевых конфигураций и алгоритмов
- Гибкая настройка параметров сети
- Бесплатный и открытый исходный код

## RED

RED — алгоритм активного управления очередью для управления переполнением очередей маршрутизаторов, с возможность предотвращения перегрузок. 

Вероятность $p_{b}$ маркировки на отбрасывание пакетов вычисляется следующим образом:

$$
p_{b} = \begin{cases}
	0, &  \ 0 < \hat{q} \leq q_{min}
	\\
	1, &  \ \hat{q} > q_{max}	
	\\
	\frac{\hat{q} - q_{min}}{q_{max} - q_{min}} p_{max}, & \ q_{min} < \hat{q} \leqslant q_{max} 
\end{cases}
$$					

## RED

![классический RED](image/RED.png){#fig:001 width=70%}

## GRED

GRED (Gentle random early detection - мягкое/аккуратное произвольное раннее обнаружение) — Алгоритм активного управления очередью, является расширением RED.
Gentle RED расширяет RED тем, что добавляет дополнительное максимальное пороговое значние, которое равно $2q_{max}$, тем самым "сглаживая" кривую.

Вычисляется следующим образом:

$$
p_{b} =\begin{cases}
	0, &  \  0 < \hat{q} \leq q_{min} 
	\\
	\frac{\hat{q} - q_{min}}{q_{max} - q_{min}} p_{max}, & \ q_{min} \leqslant \hat{q} < q_{max} 
	\\
	\frac{\hat{q} - q_{min}}{q_{max}}(1-p_{max}) - p_{max}, & \ q_{max} \leqslant \hat{q} < 2q_{max} 
	\\
	1, &  \ \hat{q} \geqslant  q_{max} 
\end{cases}
$$

## GRED

![Gentle RED](image/GentleRED.png){#fig:002 width=70%}


# Результаты

## Разные типы TCP агентов  

![Средняя очередь сети при разных TCP](image/av_queues_TCP.eps){#fig:003 width=70%}

## Разные пороговые значения

![Средняя очередь сети при разных пороговых значений](image/av_queues_thresh_size.eps){#fig:004 width=70%}

## Разные модификации алгоритма RED

![Средняя очередь сети при модификациях RED](image/av_queues_RED.eps){#fig:005 width=70%}

# Список литературы

## Список литературы

1. The ns Manual Kevin Fall, Kannan Varadhan, 2011 год
2. Sally Floyd and Van Jacobson Random Early Detection Gateways for Congestion Avoidance, 1993 год
3. J. Roberts Modeling random early detection in a differentiated services network, 2002 год
4. А. В. Королькова, Д. С. Кулябов, А. И. Черноиванов К вопросу о классификации RED, 2009 год


