/* Запит 1: Сума всіх замовлень кожного магазину*/
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

/* Запит 2: Кількість всіх замовлень кожного магазину*/
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

/* 
 * Запит 3: Кількість заданого продукту на кожному складі 
 * при умові що ця кількість більша ста кілограмів
 * (при відсутності продукту назва складу не вказується)
 */
select 
	storages.stor_id, 
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



		