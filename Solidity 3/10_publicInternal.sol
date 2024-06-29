// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// PUBLIC - INTERNAL
// Al asignar variables y funciones
// Public: Permite que el elemento pueda ser accedido desde fuera del contrato.
// Internal: Hace que el elemento solo pueda ser accedido desde dentro del mismo contrato.

contract PublicInternal {
    uint internal valorLimite;
    string internal nombreToken;

    constructor (uint _valorLimite, string memory _nombreToken) {
        valorLimite = _valorLimite;
        nombreToken = _nombreToken;
    }

    function consultarValorLimite () public view returns (uint) {
        return valorLimite;
    }

    function consultarNombreToken () public view returns (string memory) {
        return nombreToken;
    }

    function esMayorQueValorLimite (uint _valor) public view returns (bool) {
        return _valor > valorLimite;
    }


}