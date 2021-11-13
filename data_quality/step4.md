## Conflicting Data

This might be a bit harder to spot, but look closely at the column PLZ in customer_data. <br>
`customer_data["PLZ"]`{{execute}}

There are two PLZ values that do not look right, there is one value 12121 and the other 99999.<br>
`customer_data[customer_data.PLZ.isin(["12121", "99999"])]`{{execute}}

Luckily, we can look up in another dataset we have what the correct PLZ would be.<br>
`plz_data = pd.read_csv('data/plz_table.csv')`{{execute}}

We can use that data to fill in the incorrect values.<br>
`customer_data.loc[customer_data.CITY == "Aufseß", "PLZ"] = plz_data.loc[plz_data.CITY == 'Aufseß', 'PLZ'].values[0]`{{execute}}
`customer_data.loc[customer_data.CITY == "Huglfing", "PLZ"] = plz_data.loc[plz_data.CITY == 'Huglfing', 'PLZ'].values[0]`{{execute}}

Let's check our progress:<br>
`customer_data.iloc[:,:6]`{{execute}}