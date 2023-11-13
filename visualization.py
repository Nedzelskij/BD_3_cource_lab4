import psycopg2
import matplotlib.pyplot as plt

username = 'nedzelsky'
password = '3030'
database = 'db_lab3_nedzelsky'

query_1 = '''
select 
	sup_name, 
	count(del_date) as total_number_purchases
from 
	supermarkets 
	left join deliveries using(sup_id)
	left join vegetables using(prod_id)
group by 
	supermarkets.sup_id
order by 
	total_number_purchases;
'''

query_2 = '''
select 
	sup_name, 
	sum(del_quantity_kg * prod_price_kg) as total_amount_purchases
from 
	supermarkets 
	left join deliveries using(sup_id)
	left join vegetables using(prod_id)
group by 
	supermarkets.sup_id
order by 
	total_amount_purchases;
'''

query_3 = """
select 
	rtrim(storages.stor_id) as stor_id, 
	coalesce(sum(stor_prod_quantity_kg), 0) as store_prod_quantity_kg
from 
	storages 
	left join storage_vegetables using(stor_id)
	left join vegetables using(prod_id)
where 
	prod_name = 'potato'
group by 
	storages.stor_id
having 
	coalesce(sum(stor_prod_quantity_kg), 0) >= 100;
"""

conn = psycopg2.connect(user=username, password=password, dbname=database)
print(type(conn))

with conn:
                       
    cur = conn.cursor()

    cur.execute(query_1)
    supermarkets_1 = []
    total_number_purchases = []

    for row in cur:
        replaced_row_0 = row[0].replace(' ', '\n')
        supermarkets_1.append(replaced_row_0)
        total_number_purchases.append(row[1])

    figure, (bar_ax, pie_ax, pie2_ax) = plt.subplots(1, 3)
    bar = bar_ax.bar(supermarkets_1, total_number_purchases, label='Total')
    bar_ax.bar_label(bar, label_type='center')
    bar_ax.set_xlabel('Супермаркети')
    bar_ax.set_ylabel('Кількість замовлень')
    bar_ax.set_title('Кількість замовлень здійснених кожним магазином')


    cur.execute(query_2)
    supermarkets_2 = []
    total_amount_purchases = []

    for row in cur:
        supermarkets_2.append(row[0])
        total_amount_purchases.append(row[1])

    pie_ax.pie(total_amount_purchases, labels=supermarkets_2, autopct='%1.2f%%')
    pie_ax.set_title('Частка суми замовлень кожного супермаркету')


    cur.execute(query_3)
    storages = []
    store_prod_quantity_kg = []

    for row in cur:
        storages.append(row[0])
        store_prod_quantity_kg.append(row[1])

    pie2_ax.pie(store_prod_quantity_kg, labels=storages, autopct='%1.2f%%')
    pie2_ax.set_title('Частка наявеості картоплі на складах \nпри умові що їх там більше ста')


mng = plt.get_current_fig_manager()
mng.resize(1400, 600)

plt.show()