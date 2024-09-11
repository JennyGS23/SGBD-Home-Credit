# controlador.py
from dash.dependencies import Input, Output
from modelo import Modelo
from vista import Vista

class Controlador:
    def __init__(self, app, modelo, vista):
        self.app = app
        self.modelo = modelo
        self.vista = vista

        self.vincular_callbacks()
        

    def actualizar_dashboard(self, genero_seleccionado, estado_seleccionado, genero_seleccionado3, estadoLaboral_seleccionado, filtro_graficar5):
        if genero_seleccionado:
            df_filtrado = self.modelo.obtener_datos_filtrados_1(genero_seleccionado)
            figura = {
                'data': [
                    {'x': df_filtrado['ID_CUSTOMER'], 'y': df_filtrado['MAX_MONTHS_BALANCE'], 'type': 'bar', 'name': 'Months Balance'}
                ],
                'layout': {
                    'title': 'Dashboard de balance mensual máximo si el tipo de crédito es "Credit card"',
                    'xaxis': {'title': 'ID'},
                    'yaxis': {'title': 'Máximo mensual'}
                }
            }
            return figura

        elif estado_seleccionado:
            df_filtrado = self.modelo.obtener_datos_filtrados_2(estado_seleccionado)
            figura = {
                'data': [
                    {
                        'labels': df_filtrado['CREDIT_ACTIVE'].value_counts().index.tolist(),
                        'values': df_filtrado['CREDIT_ACTIVE'].value_counts().tolist(),
                        'type': 'pie',
                        'name': 'Estado del Crédito'
                    }
                ],
                'layout': {
                    'title': 'Distribución de clientes por estado del crédito',
                }
            }
            return figura


        elif genero_seleccionado3:
            df_filtrado = self.modelo.obtener_datos_filtrados_3(genero_seleccionado3)
            
            # Contar la cantidad de True y False en la columna FLAG_CONT_MOBILE
            conteo_flag = df_filtrado['FLAG_CONT_MOBILE'].value_counts()

            figura = {
                'data': [
                    {
                        'labels': ['Sin Cont. Móvil', 'Con Cont. Móvil'],
                        'values': [conteo_flag[False], conteo_flag[True]],
                        'type': 'pie',
                        'name': 'Flag Cont Mobile',
                    },
                ],
                'layout': {
                    'title': 'Mostrar si los usuarios cuentan con Móbil, clasificado por genero.',
                }
            }
            return figura

        elif estadoLaboral_seleccionado:
            df_filtrado = self.modelo.obtener_datos_filtrados_4(estadoLaboral_seleccionado)
            
            # Contar la cantidad de cada tipo de CODE_REJECT_REASON
            conteo_reject_reason = df_filtrado['CODE_REJECT_REASON'].value_counts()

            figura = {
                'data': [
                    {
                        'labels': conteo_reject_reason.index.tolist(),
                        'values': conteo_reject_reason.values.tolist(),
                        'type': 'pie',
                        'name': 'Code Reject Reason',
                    },
                ],
                'layout': {
                    'title': 'Mostrar los clientes que estan Pensionados o Trabajando, tienen 3 hijos o mas, que hicieron el previous_application'
                }
            }
            return figura

        elif filtro_graficar5:
            df_filtrado = self.modelo.obtener_datos_filtrados_5(filtro_graficar5)

            # Contar la cantidad de ocurrencias de cada día de la semana
            conteo_semana = df_filtrado['WEEKDAY_APPR_PROCESS_START'].value_counts()

            figura = {
                'data': [
                    {
                        'labels': ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'],
                        'values': [conteo_semana.get(1, 0), conteo_semana.get(2, 0), conteo_semana.get(3, 0),
                                conteo_semana.get(4, 0), conteo_semana.get(5, 0), conteo_semana.get(6, 0), conteo_semana.get(7, 0)],
                        'type': 'pie',
                        'name': 'Días de la Semana',
                    },
                ],
                'layout': {
                    'title': 'Distribución de solicitudes con tasa de interés primaria entre 0.3 y 0.99 por días de la semana',
                }
            }
            return figura

        else:
            # Retorna una figura vacía o algún valor predeterminado cuando no hay elementos seleccionados
            return {'data': [], 'layout': {}}

    def vincular_callbacks(self):
        @self.app.callback(
            Output('dashboard1', 'figure'),
            [Input('filtro-genero', 'value')]
        )
        def callback_dashboard1(genero_seleccionado):
            return self.actualizar_dashboard(genero_seleccionado, None, None, None, None)

        @self.app.callback(
            Output('dashboard2', 'figure'),
            [Input('filtro-estado', 'value')]
        )   
        def callback_dashboard2(estado_seleccionado):
            return self.actualizar_dashboard(None, estado_seleccionado, None, None, None)
            

        @self.app.callback(
            Output('dashboard3', 'figure'),
            [Input('filtro-genero3', 'value')]
        )
        def callback_dashboard3(genero_seleccionado3):
            return self.actualizar_dashboard(None, None, genero_seleccionado3, None, None)

        @self.app.callback(
            Output('dashboard4', 'figure'),
            [Input('filtro-EstadoLaboral', 'value')]
        )
        def callback_dashboard4(estadoLaboral_seleccionado):
            return self.actualizar_dashboard(None, None, None, estadoLaboral_seleccionado, None)

        @self.app.callback(
            Output('dashboard5', 'figure'),
            [Input('filtro_graficar5', 'value')]
        )
        def callback_dashboard5(filtro_graficar5):
            return self.actualizar_dashboard(None, None, None, None, filtro_graficar5)