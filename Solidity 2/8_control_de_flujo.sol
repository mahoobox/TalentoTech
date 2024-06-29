// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// Estructuras de control de flujo
// Permiten ejecutar bloques de código condicionalmente o repetidamente (de acuerdo a la lógica especificada)

// if / else
// Se utiliza para ejecutar codigo condicionalmente basado en una epresion booleana.

contract ifElse{
    // Vamos a utilizarlo para realizar verificaciones de números
    function verificarValor(uint _valor) public pure returns (string memory) {
        //
        if (_valor > 10) {
            return "Valor mayor que 10";
        } else {
            return "Valor igual a 10 o menos";
        }
    }

    // Vamos a utilizarlo para realizar verificaciones de números
    function verificarValores(uint _valor) public pure returns (string memory) {
        //
        if (_valor > 50) {
            return "Valor mayor que 50";
        } else if (_valor > 30) {
            return "Valor mayor que 30";
        }
         else {
            return "Valor igual a 30 o menos";
        }
    }
}

// For loop
// Los bucles for se utilizan para iterar sobre una colección de elementos un numero fijo de veces


contract forLoop {
    // función para sumar los elementos de un array
    function sumar(uint[] memory _numeros) public pure returns (uint) {
        //
        uint total = 0; // Inicializa la variable que por ahora tiene un valor de cero 0
        // Un ciclo que se repite recorriendo los valores del array.
        for (uint i = 0; i < _numeros.length; i++) {
            total += _numeros[i];
        }
        return total; // el total almacenado luego de las iteraciones del array.
    }
}

// While Loop y Do-While Loop
// Los bucles while y do-while se utlizan para iterar mientras una condición sea verdadera.

contract WhileLoop {

    function sumarWhile (uint[] memory _numeros) public pure returns (uint) {
        //
        uint total = 0;
        uint i = 0;
        while (i < _numeros.length)  {
            total += _numeros[i];
            i++;
        }
        return total;
    }

    function sumarDoWhile (uint[] memory _numeros) public pure returns (uint) {
        uint total = 0;
        uint i = 0;
        if (_numeros.length > 0) {
            do {
                total += _numeros[i];
                i++;
            } while (i < _numeros.length);
            
        }
        return total;
    }

}

