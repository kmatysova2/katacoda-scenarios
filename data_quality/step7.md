## Unification of Data - Splitting

First, we want to split the names into first name and last name to make analysis easier.<br>
```
customer_data[['FIRST_NAME', 'LAST_NAME']] = customer_data['NAME'].str.split(' ', 1, expand=True)
customer_data = customer_data.drop('NAME', axis=1)
```{{execute}}

Let's look at the result:<br>
`customer_data.iloc[:,5:]`{{execute}}

Also, in the order dataset, it does not make sense to have the product name and the size in one column, especially since the metrics differ. Let's look at that.<br>
`order_data['ITEM']`{{execute}}

Ideally, we split the ITEM column into three different columns. One column that has the item description, one that has the amount and one that has the metric of the amount.<br>
We need a custom function for that. This function uses [regular expressions](https://en.wikipedia.org/wiki/Regular_expression) to separate the three components.<br>
Again, don't forget to press Enter in the terminal to define it.<br>
```
def split_item(item_string):
    word_list = item_string.split(" ")
    if re.search("[0-9.]+", word_list[-1]):
        item = " ".join(word_list[0:-1])
        size = float(re.search("[0-9.]+", word_list[-1]).group())
        metric = re.search("[a-zA-Z]+", word_list[-1]).group()
    else:
        item = " ".join(word_list)
        size = None
        metric = None
    return [item, size, metric]
```{{execute}}

Now we can apply the function:<br>
`order_data[['ITEM', 'SIZE', 'METRIC']] = order_data.apply(lambda row: split_item(row['ITEM']), axis=1, result_type='expand')`{{execute}}

Let's check out the final result:<br>
`order_data`{{execute}}

Note: We do have some missing values now that we didn't have before. However, just because we couldn't easily extract them doesn't mean they weren't there. We have made them much more manageable now and can examine which items don't have a size and if that is correct for example.