# Proyecto DCCinema Grupo 34
#### Entrega: 1
#### Url Heroku: https://iic3745-testing-proyect.herokuapp.com/


### Logros
Se logró hacer todo lo pedido, lo que se alude a: configuración de ruboco y eliminiación de ofensas, automatización de ejecución de: rubocop y tests para cada evento de pull request.

### Consideraciones generales para la correcion
Las ofensas de ruboco se eliminaron mediante la definición de algunas reglas, como lineas máxima de un método y en caso de superar el máximo (estipulado como 20 en este caso) como uno de los métodos dentro de un archivo de migración, se omite temporalmente esta regla . También para eliminar otras ofensas, se modificó el archivo en.yml con el fin de dejar
todas la respuestas a los outputs de controladores y métodos de modelos, que luego fueron obtenida mediante la acción de la libraría I18n


#### Entrega: 2

### Logros
Se logró realizar todo lo solicitado, lo que alude a: CRUD para ventas, test de casos, 100% coverage. (sumando lo necesario de la entrega anterior)

### Entrega: 3

### Logros
La Tabla de decisiones se encuentra en la carpeta de decision_table, se modificaron algunos tests unitarios y de integración con el fin testar los nuevos atributos y cambios realizados