#!/bin/python3

import datetime
import math

from astral import moon


def get_phase(time: datetime.datetime):
    MOON_PHASES = [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
    ]
    code_today = int(math.floor(moon.phase(date=time) - 0.5))
    return MOON_PHASES[code_today]


if __name__ == "__main__":
    print(get_phase(datetime.datetime.now()))
