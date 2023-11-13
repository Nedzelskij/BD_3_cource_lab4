import psycopg2

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

    print('\nЗапит 1: Кількість замовлень здійснених кожним магазином.')
    cur.execute(query_1)

    for row in cur:
        print(row)

    print('\nЗапит 2: Загальна сума грошей замовлень кожного магазину.')
    cur.execute(query_2)

    for row in cur:
        print(row)

    print('\nЗапит 3: Кількість картоплі на кожному складі при умові що ця кількість більша ста.')
    cur.execute(query_3)

    for row in cur:
        print(row)