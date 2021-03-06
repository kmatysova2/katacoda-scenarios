## Missing Values

This is one problem that you have probably noticed. We have missing values in some of the columns. Let's check what the columns are.<br><br>
`order_data.isna().sum()`{{execute}}<br>
No missing data in the orders, that's great news.<br><br>
`customer_data.isna().sum()`{{execute}}<br>
In the customer data, we do have missing values in the GENDER and the WEBSITE column.<br>

Missing data have been an important topic of research for a long time and there are a lot of different ways to deal with them, such as deletion or imputation ([Jäger et al., 2021](https://www.frontiersin.org/articles/10.3389/fdata.2021.693674/full)). It is also important to consider whether data are missing because of an external reason (customer does not want to report gender) or beacause the data simply does not exist (not every customer has a website).<br>

In our case, we will create a new category for both columns called "unknown" to simplify further analyses of the data.<br>
`customer_data.loc[customer_data.GENDER.isnull(), "GENDER"] = "unknown"`{{execute}}

`customer_data.loc[customer_data.WEBSITE.isnull(), "WEBSITE"] = "unknown"`{{execute}}

Let's check our progress:
`customer_data[["NAME", "GENDER", "WEBSITE"]]`{{execute}}