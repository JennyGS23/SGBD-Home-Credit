# vista.py
from dash import Dash, dcc, html
import dash

from dash import Dash, dcc, html

class Vista:
    def __init__(self, app):
        self.app = app
        # Agregar propiedades para los IDs de los dashboards
       # self.dashboard_ids = ['dashboard1', 'dashboard2', 'dashboard3', 'dashboard4', 'dashboard5']

        self.app.layout = html.Div([
            html.H1("Dashboard con Filtros"),

            dcc.Tabs([
                dcc.Tab(label='Filtrar por Género', children=[
                    html.Label("Filtrar por género:"),
                    dcc.Checklist(
                        id='filtro-genero',
                        options=[
                            {'label': 'Masculino', 'value': 'M'},
                            {'label': 'Femenino', 'value': 'F'}
                        ],
                        value=[]
                    ),
                     dcc.Graph(id='dashboard1')  # Usar el primer ID de los dashboards
                ]),

                dcc.Tab(label='Filtrar por Estado', children=[
                    html.Label("Filtrar por Estado:"),
                    dcc.Checklist(
                        id='filtro-estado',
                        options=[
                            {'label': 'Sí', 'value': 'Sí'}
                            
                        ],
                        value=[]
                    ),
                    dcc.Graph(id='dashboard2')  
                ]),

                dcc.Tab(label='Filtrar por Género (Otro)', children=[
                    html.Label("Filtrar por Género:"),
                    dcc.Checklist(
                        id='filtro-genero3',
                        options=[
                            {'label': 'Masculino', 'value': 'M'},
                            {'label': 'Femenino', 'value': 'F'}
                        ],
                        value=[]
                    ),
                    dcc.Graph(id='dashboard3')  
                ]),

                dcc.Tab(label='Filtrar por Estado Laboral', children=[
                    html.Label("Filtrar por Estado Laboral:"),
                    dcc.Checklist(
                        id='filtro-EstadoLaboral',
                        options=[
                            {'label': 'Working', 'value': 'Working'},
                            {'label': 'Pensioner', 'value': 'Pensioner'}
                        ],
                        value=[]
                    ),
                    dcc.Graph(id='dashboard4')  
                ]),

                dcc.Tab(label='Mostrar Gráfico', children=[
                    html.Label("Mostrar gráfico"),
                    dcc.Checklist(
                        id='filtro_graficar5',
                        options=[
                            {'label': 'Sí', 'value': 'si'},
                        ],
                        value=[]
                    ),
                    dcc.Graph(id='dashboard5')  
                ]),
            ]),
        ])

