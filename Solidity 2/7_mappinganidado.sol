// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// Mapping Anidado

contract Asignacion {
    // Mapping de una dirección a otro mapping.
    // Como una relación de uno a muchos
    mapping(address => mapping(address => uint)) public asignaciones;

    // Función para devolver la asignacion/cantidad que el propietario le otorgó al gastador
    function obtener(address _propietario, address _gastador) public view returns(uint)  {
        // Devolver el valor almacenado en el mapping anidado para las claves proporcionadas
        return asignaciones[_propietario][_gastador];
    }

    function configurar(address _propietario, address _gastador, uint _cantidad) public {
        // Asignar el valor ingresado en el mapping anidado a las claves correspondientes
        asignaciones[_propietario][_gastador] = _cantidad;
    }



}