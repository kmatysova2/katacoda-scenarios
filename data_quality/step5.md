## Inconsistency

When we look at the price values in the order data, there is one value that does not seem quite right. Let's get the description of that table.<br>

`order_data['PRICE'].describe()`{{execute}}

We can see that the max value for price is 249. Since we only have small and relatively cheap items in our inventory, this is odd. Another way we can check if a value is an outlier is to see how many standard deviations it is away from the mean. Let's do that.<br>

`(order_data['PRICE'].describe()['max'] - order_data['PRICE'].describe()['mean']) / order_data['PRICE'].describe()['std']`{{execute}}

Usually more than 2 standard deviations is considered far away and with more than 3 standard deviations we can be pretty certain that there is an outlier.<br>

In this case, we can look up the price and see that it is 2.49, so somebody simply forgot to record the period. Let's fix that:<br>
`order_data.loc[order_data.PRICE == 249, "PRICE"] = 2.49`{{execute}}
However, if we could not do a manual look but would need to do this analysis automatically, we would treat the 249 as a missing value.<br>

Let's check if it looks better: <br>
`order_data['PRICE'].describe()`{{execute}}

Another inconsistency is in the names column of the customer data.<br>
`customer_data['NAME']`{{execute}}

We can see that some names were recorded with the last name first and a comma in between. We will assume that this is the only problem, but in real life we would have to double check how the data were collected. For example with the name "Ralf Simon" we cannot be sure which is the first and which is the last name.<br>

Let's write a small function to fix the order of the name. Click on the function and then press enter in the terminal to execute it.<br>

```
def fix_order(name):
    first_and_last = name.split(",")
    if len(first_and_last) > 1:
        return " ".join([first_and_last[1].strip(), first_and_last[0].strip()])
    else:
        return first_and_last[0];
```{{execute}}

And now let's apply the function:<br>
`customer_data['NAME'] = customer_data.apply(lambda row: fix_order(row['NAME']),axis=1)`{{execute}}

Let's check our progress:<br>
`customer_data['NAME']`{{execute}}

