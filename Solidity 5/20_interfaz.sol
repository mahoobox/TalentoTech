// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// INTERFACES
// Definen una colección de funciones que un contrato debe implementar. 
// Esto es útil para definir contratos estándar que otros contratos pueden implementar.

// Casos de uso de Interfaces:
// Creación de Tokens ERC20 y ERC21: Define estándares para tokens fungibes y tokens no fungibles
    // lo que permite que diferentes contratos y aplicaciones interactúen con tokens de manera uniforme

// Interacción con contratos externos: Permite defirnir funciones para interactuar con contratos externos
    // mejorando la claridad y facilitando la interacción.

// Contratos DeFI
// Podemos estandarizar interacciones entre contratos de préstamos, intercambio de tokens, agregadores de liquidez.... etc etc.

// Oráculos y Datos Externos: Aseguramos el obtener datos externos consistentes.

// Contratos de Gobernanza: Facilita la definicións de módulos de gobernanza intercambiables para votar y ejecutar decisiones.

interface ICalculadora {
    function sumar (uint256 a, uint256 b) external pure returns (uint256);
    function restar (uint256 a, uint256 b) external pure returns (uint256);
}

contract Calculadora is ICalculadora {
    function sumar(uint256 a, uint256 b) public pure override   returns (uint256) {
        return a + b;
    }

    function restar (uint256 a, uint256 b) public pure override  returns(uint256) {
        return a -b;
    }
}