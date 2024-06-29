// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// ARRAYS : Arreglos
contract Arrays {
    // Estructuras de datos -> dependen de otros tipos de datos.
    // Grupos de valores del mismo tipo
    // Podemos almacenar varios datos juntos

    // Arrays Estáticos - Fijos
    // Tienen un tamaño fijo definido desde el momento de su declaracion.
    // No se puede cambiar el tamaño del array durante la ejecución del contrato.
    uint[5] public arrayEstatico;
    uint[5] edades = [10,20,30,40,50];


    // Arrays Dinámicos
    // No tienen un tamaño fijo. 
    // Pueden crecer o disminuir durante la ejecución del contrato
    // Ocurre mediante algunas operaciones
    uint[] public  arrayDinamico;
    uint[] edadesDinamicas = [10,20,30,40,50,60];

    function agregarAlDinamico (uint _numero) public returns (uint, uint) {
        arrayDinamico.push(_numero);
        return (_numero, arrayDinamico.length);
    }

    function quitarAlDinamico () public returns (uint) {
        arrayDinamico.pop();
        return (arrayDinamico.length);
    }

    function obtenerElemento (uint _posicion) public view returns (uint) {
        return (edadesDinamicas[_posicion]);
    }

}

