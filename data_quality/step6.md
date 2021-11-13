## Unification of Data - Combination

For now, we have date and time collected as type string. This would require additional transformation if we wanted to work with the data, for example order them by date and time.<br>

Here are the two columns:<br>
`order_data[['DATE', 'TIME']]`{{execute}}

A better data type is datetime, which can display both date and time simultaneously in a consistent format.<br>

Let's write another small function to transform the two columns into one. Again, click on the function and then press enter in the terminal to execute it.<br>

```
def timestamp_transform(date, time):
    date_string = str(date) + " " + str(time)
    timestamp = datetime.datetime.strptime(date_string, "%d.%m.%Y %H:%M")
    return timestamp

```{{execute}}

And now we can apply it:<br>
`order_data['TIMESTAMP'] = order_data.apply(lambda row: timestamp_transform(row['DATE'], row['TIME']),axis=1, result_type='expand')`{{execute}}
And also delete the previous columns:<br>
`order_data = order_data.drop('DATE', axis=1).drop('TIME', axis=1)`{{execute}}
Let's see the result:
`order_data`{{execute}}