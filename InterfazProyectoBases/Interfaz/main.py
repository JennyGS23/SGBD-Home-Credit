# app.py
from dash import Dash
from controlador import Controlador
from modelo import Modelo
from vista import Vista
import dash

# app = Dash(__name__)
# modelo = Modelo()
# vista = Vista(app)
# controlador = Controlador(app, modelo, vista)

# if __name__ == '__main__':
#     #app.run_server(debug=True)
#     vista = Vista(dash.Dash(__name__, suppress_callback_exceptions=True))
#     vista.app.run_server(debug=True)


app = dash.Dash(__name__, suppress_callback_exceptions=True)
modelo = Modelo()
vista = Vista(app)
controlador = Controlador(app, modelo, vista)

if __name__ == '__main__':
    app.run_server(debug=True)