// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// Mappings
// Similares a un diccionario de python o a un mapa en JavaScript
// Permite almacenar datos que se pueden recuperar utilizando una relación clave-valor.
// Utiles para realizar búsquedas rápidas
// Los mappings no tienen logitud
// No se puede iterar a través de un mapping

contract miMapping {
    // Declaramos el mapping
    // Agregamos una address como key (clave) y booleano como value(valor)
    mapping (address => bool) public miMapa;

    // Creamos una función que asigna un valor booleano a una dirección específica
    function configurar(address _direccion, bool _valor) public {
        // La dirección y el valor se van a almacenar en nuestro mapa 
        miMapa[_direccion] = _valor;
    }

    // Creamos una función para retornar el valor asignado a esa dirección
    function obtener(address _direccion) public view returns (bool)  {
        return miMapa[_direccion];
        //
    }

    // Creamos una función para eliminar un valor del mapa
    function remover(address _direccion) public  {
        //
        delete miMapa[_direccion];
    }

}