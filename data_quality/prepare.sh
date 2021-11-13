python

import pandas as pd
import re
import datetime

customer_data = pd.read_csv('https://github.com/kmatysova2/katacoda-scenarios/blob/main/data_quality/data/customer_table.csv')
order_data = pd.read_csv('https://github.com/kmatysova2/katacoda-scenarios/blob/main/data_quality/data/order_table.csv')