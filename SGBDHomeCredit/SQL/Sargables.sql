--8.Realice 5 consultas SARGABLES que funcionen como filtros en el sitio web donde se utilicen 3 tablas o más. 10pts 


USE ProyectoBases;

--1. Mostrar los clientes femeninos y su balance mensual maximo si el tipo de credito es "Credit card" 
--Tablas usadas APPLICATION_TRAIN, BUREAU_BALANCE, BUREAU y CUSTOMER_APPLICATION_TRAIN
SELECT DISTINCT a_ca.ID AS ID_CUSTOMER, a_ca.CODE_GENDER, MAX(ABS(b_bb.MONTHS_BALANCE)) AS MAX_MONTHS_BALANCE, b_b.CREDIT_TYPE
	FROM application_train.CUSTOMER_APPLICATION_TRAIN AS a_ca
		JOIN application_train.APPLICATION_TRAIN AS a_at 
			ON a_ca.ID = a_at.ID_CURTOMER_APPLICATION
			JOIN bureau.BUREAU AS b_b 
				ON b_b.SK_ID_CURR = a_at.SK_ID_CURR
				JOIN bureau.BUREAU_BALANCE AS b_bb 
					ON b_b.SK_ID_BUREAU = b_bb.SK_ID_BUREAU
	WHERE
		a_ca.CODE_GENDER LIKE 'F' AND
		b_b.CREDIT_TYPE LIKE 'Credit card'
	GROUP BY a_ca.ID, a_ca.CODE_GENDER, b_b.CREDIT_TYPE
	ORDER BY ID_CUSTOMER;




--2. Mostrar los clientes que tienen un credito activo  y el valor del credito maximo es diferente de cero
--Tablas usadas CUSTOMER_APPLICATION_TRAIN, APPLICATION_TRAIN y CREDIT_AMOUNTS_BUREAU
SELECT a_ca.ID AS ID_CUSTOMER, b_cab.AMT_CREDIT_MAX_OVERDUE, b_b.CREDIT_ACTIVE
	FROM application_train.CUSTOMER_APPLICATION_TRAIN AS a_ca
		JOIN application_train.APPLICATION_TRAIN AS a_at
			ON a_ca.ID = a_at.ID_CURTOMER_APPLICATION
			JOIN bureau.BUREAU AS b_b 
				ON b_b.SK_ID_CURR = a_at.SK_ID_CURR
				JOIN bureau.CREDIT_AMOUNTS_BUREAU AS b_cab
					ON b_b.ID_CREDIT_AMOUNTS = b_cab.ID
	WHERE b_b.CREDIT_ACTIVE LIKE 'Active' AND b_cab.AMT_CREDIT_MAX_OVERDUE != 0
	ORDER BY ID_CUSTOMER;
	


--3. Mostrar los metodos de contacto de los clientes de application_train que son masculino.
--Tablas usadas APPLICATION_TRAIN, CONTACT_CUSTOMER_APPLICATION_TRAIN, CUSTOMER_APPLICATION_TRAIN
SELECT a_ca.ID AS ID_CURTOMER_APPLICATION, a_ca.CODE_GENDER, a_cc.FLAG_CONT_MOBILE,a_cc.FLAG_EMAIL,a_cc.FLAG_EMP_PHONE,a_cc.FLAG_MOBIL,a_cc.FLAG_PHONE
	FROM application_train.CONTACT_CUSTOMER_APPLICATION_TRAIN AS a_cc
		JOIN application_train.CUSTOMER_APPLICATION_TRAIN AS a_ca		
			ON a_cc.ID = a_ca.ID_PERSONAL_CONTACT
			JOIN application_train.APPLICATION_TRAIN AS a_at				
				ON a_ca.ID = a_at.ID_CURTOMER_APPLICATION
	WHERE a_ca.CODE_GENDER LIKE  'M'
	ORDER BY ID_CURTOMER_APPLICATION;


--4 Mostrar los clientes que estan Pensionados y tienen 3 hijos o mas, que hicieron el previous_application y sus datos de proceso
--Tablas usadas APPLICATION_TRAIN, CUSTOMER_APPLICATION_TRAIN Y PREVIOUS_APPLICATION
SELECT a_ca.ID AS ID_CUSTOMER, p_pa.CODE_REJECT_REASON,p_pa.HOUR_APPR_PROCESS_START,p_pa.DAYS_DECISION,p_pa.WEEKDAY_APPR_PROCESS_START
	FROM application_train.CUSTOMER_APPLICATION_TRAIN AS a_ca
		JOIN application_train.APPLICATION_TRAIN AS a_at
			ON a_ca.ID = a_at.ID_CURTOMER_APPLICATION
		JOIN previous.PREVIOUS_APPLICATION AS p_pa
			ON a_at.SK_ID_CURR = p_pa.SK_ID_CURR
WHERE a_ca.NAME_INCOME_TYPE LIKE 'Pensioner' AND a_ca.CNT_CHILDREN >= 3
ORDER BY ID_CUSTOMER;



--5 Mostrar los application_train donde las tasas de intereses primaria de la aplicacion es menor a 0,3
--Tablas usadas APPLICATION_TRAIN, PREVIOUS_APPLICATION Y INTEREST_RATES_PREVIOUS_APPLICATION
SELECT a_at.SK_ID_CURR AS ID_APPLICATION_TRAIN, p_ir.RATE_INTEREST_PRIMARY
	FROM application_train.APPLICATION_TRAIN AS a_at 
		JOIN previous.PREVIOUS_APPLICATION AS p_pa
			ON a_at.SK_ID_CURR = p_pa.SK_ID_CURR
			JOIN previous.INTEREST_RATES_PREVIOUS_APPLICATION AS p_ir
				ON p_pa.ID_INTEREST_RATES = p_ir.ID
WHERE p_ir.RATE_INTEREST_PRIMARY <= 0.3
ORDER BY ID_APPLICATION_TRAIN;