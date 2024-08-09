// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./9.0_identidad_admin.sol";

// Este otro contrato va permitir que los usuarios autorizados registren datos.
contract RegistroDatos {
    GestorUsuarios private gestorUsuarios;
    mapping(address => string[]) private registrosUsuario;

    constructor (address _direccionGestorUsuarios) {
        gestorUsuarios = GestorUsuarios(_direccionGestorUsuarios);
    }

    // FUNCION: Para registrar los datos
    function registrarDato (string memory _dato) public {
        require(gestorUsuarios.estaUsuarioRegistrado(msg.sender), "Debes estar registrado para registrar datos");
        registrosUsuario[msg.sender].push(_dato);
    }

    // FUNCION: Para obtener los registros 
    function obtenerRegistros() public view returns(string[] memory) {
        return registrosUsuario[msg.sender];
    }
}