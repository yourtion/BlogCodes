#!/bin/bash

awk -v CHANNEL=channel.csv -f join.awk  data.csv
