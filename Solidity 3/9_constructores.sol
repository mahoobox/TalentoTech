// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// CONSTRUCTORES
// Es una función especial para inicializar variables de estado en un contrato.
// Se llaman cuando se crea el contrato por primera vez.
// Se usa para establecer valores iniciales

// Características:
// Opcionales: Los constructores son opcionales en Solidity
// Ejecución única: Se ejecuta una sola vez cuando se crea el contrato.

// contrato para establecer como propietario del contrato al que lo crea
contract PropietarioContrato {
    address public propietario; 

    constructor() {
        propietario = msg.sender; // asignamos la dirección del creador del contrato como propietario
    }

    function obtenerPropietario () public view returns (address) {
        return propietario;
    }
}

// Contarto para establecer una direccion de billetera cualquiera como propietario de este contrato
contract PropietarioContratoOtro {
    address public propietario;

    // Hizo obligatorio que se ingrese una dirección de una wallet para poder asignarla como
    // propietaria y así poder desplegar el contrato.
    constructor (address _propietario) {
        propietario = _propietario;
    }

    function obtenerPropietario () public  view returns (address) {
        return propietario;
    }
}

// 
contract SaldoInicial {
    uint public saldo;

    // Establecemos un valor de saldo inicial
    constructor (uint _saldoInicial) {
        saldo = _saldoInicial; // Asignamos el valor que se ingreso al crear el contrato a la variable
    }

    function consultarSaldo()  public view returns (uint)  {
        return saldo;
    }
}

contract ValorLimite {
    uint public valorLimite;
    string public nombreToken;

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