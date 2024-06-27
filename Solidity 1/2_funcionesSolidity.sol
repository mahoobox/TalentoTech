// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract MisFunciones {
    // Una función es un bloque de código organizado y reutilizable para realizar una acción.
    // Permiten que el código sea modular y reutilizable.
    // Bloques de codigo que permiten hacer tareas automatizables.


    // Una funcion puede llamar a a otra en el mismo contrato.
    // Una función puede llamar a otra en un contrato diferente

    function MiPrimerFuncion() public {
        // el código de mi función
    }

    // Una variable de estado
    uint public contador; // variable pública que almacena el valor del contador

    function InicializarContador() public {
        // public: la función puede ser llamada desde fuera del contrato
        contador += 1;
        //contador = contador + 1;
    }

    function DecrementarContador() public {
        // public: la función puede ser llamada desde fuera del contrato
        require(contador > 0, "El contador ya llego a cero");
        contador -= 1;
    }

    function ObtenerContador () public view returns (uint) {
        // public: la funcion puede ser llamada desde fuera del contrato
        // view: indica que la función no modifica el estado del contrato
        // returns (uint): Especifica el tipo de dato que va retornar la función.
        return contador;
    }

    function EstablecerContador (uint nuevoValor) public {
        // public: la funcion puede ser llamada desde fuera del contrato
        require(nuevoValor >= 0,"el dato debe ser mayor a cero");
        contador = nuevoValor;

    }

}