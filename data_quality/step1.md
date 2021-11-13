## Data Observation

To prepare this scenario, the GitHub repo containing the necessary data has been cloned. Also, necessary requirements have been imported and two datasets have been loaded into the variables `customer_data` and `order_data`. At any time you can type those into the terminal to see how they change as we go along.<br>

Let's first observe the two datasets. While you look at them, ask yourself where you see some potential issues for data quality.<br>

The first dataset contains information about customers. To better view it, we will print it in two parts. Execute the following commands by clicking on them:<br>
`customer_data.iloc[:,:5]`{{execute}}
`customer_data.iloc[:,5:]`{{execute}}

The second dataset contains information about orders the customers made. CUSTOMER_ID is the foreign key that connects both datasets together.<br>
`order_data`{{execute}}