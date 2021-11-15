## Duplicates

Maybe you have noticed that in the column NAME, there are values occurring more than once.<br>

First of all, we have Ursula Stein twice.<br>
`customer_data[customer_data['NAME'].str.contains("Stein")]`{{execute}}

The problem is that the CUSTOMER_ID is different for the two occurrences and we might have orders for both of these customer IDs. In that case, we would have to make changes in both tables. Let's check:<br>
`order_data[order_data['CUSTOMER_ID'].isin([5,8])]`{{execute}}

Since we only have order data for customer ID number 5 and the entries are otherwise identical, we can delete the entry with ID number 8.<br>
`customer_data = customer_data.drop(customer_data.index[customer_data['CUSTOMER_ID'] == 8]).reset_index(drop=True)`{{execute}}

We also have the customer Sorin Sandu twice.<br>
`customer_data[customer_data['NAME'].str.contains("Sandu")]`{{execute}}

Here we don't have to worry about the orders, because the customer ID is identical, so we can just delete one occurrence.<br>
`customer_data = customer_data.drop(customer_data.index[customer_data['CUSTOMER_ID'] == 9][0]).reset_index(drop=True)`{{execute}}

Let's check our progress:<br>
`customer_data.iloc[:,:5]`{{execute}}