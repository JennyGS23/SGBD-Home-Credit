# modelo.py
import pandas as pd
import pyodbc


class Modelo:
    def __init__(self):
        # Establecer la conexión con la base de datos SQL Server
        server = 'DESKTOP-5GQ42K8'
        database = 'ProyectoBases'
        username = 'sa'
        password = '12345'
        driver = '{SQL Server}'
        self.conn = pyodbc.connect(
            f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}'
        )

    def obtener_datos_filtrados_1(self, genero_seleccionado):
        # Construir la consulta SQL con el filtro de género
        query = f"""SELECT DISTINCT a_ca.ID AS ID_CUSTOMER, a_ca.CODE_GENDER, MAX(ABS(b_bb.MONTHS_BALANCE)) AS MAX_MONTHS_BALANCE, b_b.CREDIT_TYPE
                        FROM application_train.CUSTOMER_APPLICATION_TRAIN AS a_ca
                            JOIN application_train.APPLICATION_TRAIN AS a_at 
                                ON a_ca.ID = a_at.ID_CURTOMER_APPLICATION
                                JOIN bureau.BUREAU AS b_b 
                                    ON b_b.SK_ID_CURR = a_at.SK_ID_CURR
                                    JOIN bureau.BUREAU_BALANCE AS b_bb 
                                        ON b_b.SK_ID_BUREAU = b_bb.SK_ID_BUREAU
                        WHERE
                            a_ca.CODE_GENDER LIKE '{genero_seleccionado[0]}' AND
                            b_b.CREDIT_TYPE LIKE 'Credit card'
                        GROUP BY a_ca.ID, a_ca.CODE_GENDER, b_b.CREDIT_TYPE
                        ORDER BY ID_CUSTOMER;"""
        
        # Ejecutar la consulta y obtener los resultados en un DataFrame
        df_filtrado = pd.read_sql(query, self.conn)
        print(df_filtrado)

        # Filtrar el DataFrame por la clasificación del género
        #df_filtrado = df_filtrado[df_filtrado['CODE_GENDER'].isin(genero_seleccionado)]
        
        return df_filtrado
    
    def obtener_datos_filtrados_2(self, estado_seleccionado):
        # Construir la consulta SQL con el filtro de género
        query = f"""SELECT a_ca.ID AS ID_CUSTOMER, b_cab.AMT_CREDIT_MAX_OVERDUE, b_b.CREDIT_ACTIVE
                    FROM application_train.CUSTOMER_APPLICATION_TRAIN AS a_ca
                        JOIN application_train.APPLICATION_TRAIN AS a_at
                            ON a_ca.ID = a_at.ID_CURTOMER_APPLICATION
                            JOIN bureau.BUREAU AS b_b 
                                ON b_b.SK_ID_CURR = a_at.SK_ID_CURR
                                JOIN bureau.CREDIT_AMOUNTS_BUREAU AS b_cab
                                    ON b_b.ID_CREDIT_AMOUNTS = b_cab.ID
                    WHERE b_b.CREDIT_ACTIVE IN ('Active', 'Closed') AND b_cab.AMT_CREDIT_MAX_OVERDUE != 0
                    ORDER BY ID_CUSTOMER;"""
        
        # Ejecutar la consulta y obtener los resultados en un DataFrame
        df_filtrado = pd.read_sql(query, self.conn)
        print(df_filtrado)

        return df_filtrado

    def obtener_datos_filtrados_3(self, genero_seleccionado3):
        # Construir la consulta SQL con el filtro de género
        query = f"""SELECT a_ca.ID AS ID_CURTOMER_APPLICATION, a_ca.CODE_GENDER, a_cc.FLAG_CONT_MOBILE
                        FROM application_train.CONTACT_CUSTOMER_APPLICATION_TRAIN AS a_cc
                            JOIN application_train.CUSTOMER_APPLICATION_TRAIN AS a_ca		
                                ON a_cc.ID = a_ca.ID_PERSONAL_CONTACT
                                JOIN application_train.APPLICATION_TRAIN AS a_at				
                                    ON a_ca.ID = a_at.ID_CURTOMER_APPLICATION
                        WHERE a_ca.CODE_GENDER LIKE  '{genero_seleccionado3[0]}'
                        ORDER BY ID_CURTOMER_APPLICATION;"""

        # Ejecutar la consulta y obtener los resultados en un DataFrame
        df_filtrado = pd.read_sql(query, self.conn)
        print(df_filtrado)

        return df_filtrado

    def obtener_datos_filtrados_4(self, estadoLaboral_seleccionado):
        # Construir la consulta SQL con el filtro de estado laboral
        query = f"""SELECT a_ca.ID AS ID_CUSTOMER, p_pa.CODE_REJECT_REASON, p_pa.HOUR_APPR_PROCESS_START, p_pa.DAYS_DECISION, p_pa.WEEKDAY_APPR_PROCESS_START
                        FROM application_train.CUSTOMER_APPLICATION_TRAIN AS a_ca
                            JOIN application_train.APPLICATION_TRAIN AS a_at
                                ON a_ca.ID = a_at.ID_CURTOMER_APPLICATION
                            JOIN previous.PREVIOUS_APPLICATION AS p_pa
                                ON a_at.SK_ID_CURR = p_pa.SK_ID_CURR
                        WHERE a_ca.NAME_INCOME_TYPE LIKE '{estadoLaboral_seleccionado[0]}' AND a_ca.CNT_CHILDREN >= 3
                        ORDER BY ID_CUSTOMER;"""

        # Ejecutar la consulta y obtener los resultados en un DataFrame
        df_filtrado = pd.read_sql(query, self.conn)
        print(df_filtrado)

        return df_filtrado

    def obtener_datos_filtrados_5(self, filtro_graficar5):
        # Construir la consulta SQL con el filtro de tasa de interés primaria
        query = f"""SELECT a_at.SK_ID_CURR AS ID_APPLICATION_TRAIN, p_ir.RATE_INTEREST_PRIMARY, p_pa.WEEKDAY_APPR_PROCESS_START
                        FROM application_train.APPLICATION_TRAIN AS a_at 
                            JOIN previous.PREVIOUS_APPLICATION AS p_pa
                                ON a_at.SK_ID_CURR = p_pa.SK_ID_CURR
                                JOIN previous.INTEREST_RATES_PREVIOUS_APPLICATION AS p_ir
                                    ON p_pa.ID_INTEREST_RATES = p_ir.ID
                    WHERE p_ir.RATE_INTEREST_PRIMARY >= 0.3 AND p_ir.RATE_INTEREST_PRIMARY <= 0.99
                    ORDER BY ID_APPLICATION_TRAIN;"""

        # Ejecutar la consulta y obtener los resultados en un DataFrame
        df_filtrado = pd.read_sql(query, self.conn)
        print(df_filtrado)

        return df_filtrado






   
    
    