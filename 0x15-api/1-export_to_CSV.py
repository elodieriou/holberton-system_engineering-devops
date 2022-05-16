#!/usr/bin/python3
"""
Python script that exports data using the CSV format.
"""

import csv
import requests
from sys import argv

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/users/{}".format(argv[1])
    api_url = requests.get(url)
    username = api_url.json().get("username")
    uid = api_url.json().get("id")

    api_url_todo = requests.get("{}/todos".format(url))

    filename = "{}.csv".format(argv[1])

    with open(filename, "w", encoding='UTF8') as f:
        writer = csv.writer(f, quotechar="'")

        for value in api_url_todo.json():
            row = ['\"{}\"'.format(uid), '\"{}\"'.format(username)]
            row.append('\"{}\"'.format(value.get("completed")))
            row.append('\"{}\"'.format(value.get("title")))
            writer.writerow(row)
