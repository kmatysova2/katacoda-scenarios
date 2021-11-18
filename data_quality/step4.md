## Conflicting Data

This might be a bit harder to spot, but look closely at the column PLZ in customer_data. <br>
`customer_data["PLZ"]`{{execute}}

There are two PLZ values that do not look right, there is one value 12121 and the other 99999.<br>

Luckily, we can look up what the correct PLZ would be in another dataset.<br>
`plz_data = pd.read_csv('data/plz_table.csv')`{{execute}}

In the dataset, there is a collection of cities and their corresponding PLZ. We can use the column CITY to impute the incorrect values.<br>
```customer_data.loc[customer_data.CITY == "Aufseß", "PLZ"] = plz_data.loc[plz_data.CITY == 'Aufseß', 'PLZ'].values[0]
customer_data.loc[customer_data.CITY == "Huglfing", "PLZ"] = plz_data.loc[plz_data.CITY == 'Huglfing', 'PLZ'].values[0]```{{execute}}

Let's check our progress:<br>
`customer_data.iloc[:,1:7]`{{execute}}