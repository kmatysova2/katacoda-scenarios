git clone https://github.com/kmatysova2/katacoda-scenarios.git

cd katacoda-scenarios/data_quality

python

import pandas as pd
import re
import datetime

customer_data = pd.read_csv('/data/customer_table.csv')
order_data = pd.read_csv('/data/order_table.csv')