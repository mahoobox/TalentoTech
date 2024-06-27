// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract ComparacionesSolidity {

    // Funcion para comparar si dos enteros son iguales
    function SonIguales (uint a, uint b) public pure returns (bool) {
        // public: la función puede ser llamada desde fuera del contrato
        // pure: indica que la función no modifica ni lee el estado del contrato
        // returns (bool): especifica que la función va a retornar un valor booleano
        return a == b;
    }

    // Función para comparar si un valor es mayor al otro
    function MayorQue (uint a, uint b) public pure returns (bool) {
        return a > b;
    }

    // Función para comparar si una dirección de una wallet es igual a otra
    function WalletIgual (address a, address b) public pure returns (bool) {
        return a == b;
    }
}


// CREAR FUNCIONES QUE COMPAREN 2 VALORES ASÍ:
// Si uno es menor que el otro
// Si uno es mayor o igual que el otro
// Si dos cadenas de texto son iguales