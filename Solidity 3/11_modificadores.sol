// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// MODIFICADORES DE FUNCIONES
// Son fragmentos de código que se añaden a las funciones para alterar su comportamiento.
// Utiles para reutilizar logica comun.
// Utiles para colocarle condiciones a una funcion o a un grupo de funciones

contract SinModificador {
    address propietario; // direccion del propietario del contrato
    int public miDato; // variable de estado para almacenar datos

    constructor () {
        propietario = msg.sender;
    }

    function multiplicarPorDoble (int _dato) public returns (int)  {
        require(msg.sender == propietario, "Billetera no autorizada");
        miDato = _dato * 2;
        return (miDato);
    }

    function multiplicarPorTriple (int _dato) public returns (int)  {
        require(msg.sender == propietario, "Billetera no autorizada");
        miDato = _dato * 3;
        return (miDato);
    }
}

// Contrato para gestionar el propietario del contrato
contract PropietarioContrato {
    address internal propietario;

    constructor (address _propietario) {
        propietario = _propietario;
    }

    modifier soloPropietario() {
        require(msg.sender == propietario, "No autorizado");
        _; // este placeholder representa al resto del codigo hacia delante que existe en la funcion
    }

    function obtenerPropietario() public view returns (address) {
        return propietario;
    }

    function cambiarPropietario(address _nuevoPropietario) public soloPropietario {
        // el modificador está colocando su contenido aquí.
        propietario = _nuevoPropietario;
    }

    // otra función protegida
    function funcionProtegida () public soloPropietario {
        //
    }
}