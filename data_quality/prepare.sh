python

import pandas as pd
import re
import datetime

customer_data = pd.read_csv('/data/customer_table.csv')
order_data = pd.read_csv('/data/order_table.csv')