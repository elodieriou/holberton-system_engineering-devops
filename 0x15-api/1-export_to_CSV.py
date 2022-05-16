#!/usr/bin/python3
"""This module defines a script that using an REST API, for a given employee ID
and returns information about his/her TODO list progress"""

if __name__ == "__main__":
    import csv
    import requests
    from sys import argv

    # formatting url
    url = "https://jsonplaceholder.typicode.com"
    user_id = int(argv[1])
    user_url = "{url}/users/{id}".format(url=url, id=user_id)
    todos_url = "{user_url}/todos".format(user_url=user_url)

    # get request
    req_user = requests.get(user_url).json()
    req_todos = requests.get(todos_url).json()

    # get information thanks the request
    user_name = req_user.get('username')

    # export to csv format
    filename = "{}.csv".format(user_id)
    with open(filename, 'w', encoding='utf-8', newline='') as f:
        csv_writer = csv.writer(f, delimiter=',', quoting=csv.QUOTE_ALL)

        for value in req_todos:
            data = [user_id, user_name]
            data.append(value.get('completed'))
            data.append(value.get('title'))

            csv_writer.writerow(data)
