// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// GAS
// Es una unidad que mide la cantidad de trabajo computacional requerido para realizar operaciones en Ethereum (EVM)
// Cada operacion ejecutada por un contrato inteligente (desde trasacciones simples, hasta funciones lógicas, etc) consumen una cierta cantidad de gas.

// POR QUÉ ES NECESARIO EL GAS
// Prevenir el abuso que podria consumir todos los recursos de la red
// Incentivo para los mineros

// COMO FUNCIONA EL GAS
// Gas Price: La cantidad de Ether que estas dispuesto(a)(e) a gastar en una transaccion por cada unidad de gas.
// Gas Limit: La cantidad máxima de gas que estás dispuesto a gastar.

// A CONSIDERAR SOBRE EL GAS
// Operaciones básicas: Transferir ether (aprox son 21000 unidades de gas)
// Lecturas y escrituras: Leer datos de la blockchain es más barato que escribirlos. Las escrituras son más costosas.
// Operaciones complejas: Consumen mas gas. (cálculos matemáticos, llamadas a funciones)

contract Transferencia {
    function transferir (address payable destinatario, uint256 cantidad) public payable  {
        require(msg.value >= cantidad, "paila, fondos insuficiente");
        destinatario.transfer(cantidad);
    }
}