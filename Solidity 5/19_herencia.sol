// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// HERENCIA
// Permite que un contrato derive en otro, reutilizando su fucionalidad y extendiendola.
// Similar a la herencia en lenguajes de programación orientados a objetos.

// Definir un contrato base que para este ejemplo vamos a llamar Padre
contract Padre {
    uint256 internal numero;

    function establecerNumero (uint256 _numero) public {
        numero = _numero;
    }

    function obtenerNumero () public view returns(uint256) {
        return numero;
    }
}

// Este es el contarto que hereda de del otro contrato anterior llamado padre.
contract Hijo is Padre {
    function duplicarNumero() public {
        numero = numero * 2;
    }
}
