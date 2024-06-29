// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// STRUCT

contract ListaDeTareas {
    // Vamos a crear uan estructura llamada tarea
    // Definiendo una estructura de datos llamada Tarea
    struct Tarea {
        string texto;
        bool completada;
    }

    // Declarando un array de structs de tipo Tarea llamado tareas
    // Array dinámico de Tareas
    Tarea[] public tareas;

    // Función para crear una nueva tarea
    function crear(string memory _texto) public {
        // Añadir una nueva tarea al array de tareas con el texto ingresado.
        // memory: significa que el almacenamiento es temporal durante la ejecución de la función.
        tareas.push(Tarea(_texto, false));
    }

    function obtener(uint _indice) public view returns (string memory, bool) {
        // Recuperar la tarea del array de acuerdo a su índice
        // Almacenar una referencia a al Tarea en la variable tarea
        // La variable 'tarea' se almacena en storage (almacenamiento persistente)
        Tarea storage tarea = tareas[_indice];
        // Devuelve el texto y el estado de la tarea
        // Retorno memory indica que los datos devueltos son temporales.
        return (tarea.texto, tarea.completada);
    }

}