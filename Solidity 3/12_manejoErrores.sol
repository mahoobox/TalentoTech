// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// REQUIRE * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
// El uso requiere validar condiciones y manejar errores
// En estes caso lo usamos para verificar que solo el propietario pueda cambiar al propietario del contrato

contract PropietarioContratoRequire {
    address public propietario;

    constructor(address _propietario) {
        require(_propietario != address(0), "Direccion no valida"); // Valida que la dirección no sea cero
        propietario = _propietario; // Asignamos la direccion proporcionada como propietario
    }

    function cambiarPropietario(address _nuevoPropietario) public  {
        require(msg.sender == propietario, "No autorizado");
        require(_nuevoPropietario != address(0), "Direccion no valida");
        propietario = _nuevoPropietario;
    }
}


// ASSERT * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
// Verificaciones
contract PropietarioContratoAssert {
    address public propietario;

    constructor(address _propietario) {
        require(_propietario != address(0), "Direccion no valida"); // Valida que la dirección no sea cero
        propietario = _propietario; // Asignamos la direccion proporcionada como propietario
        assert(propietario != address(0)); // Verificar que el propietario haya sido establecido correctamente.
    }

    function cambiarPropietario(address _nuevoPropietario) public  {
        require(msg.sender == propietario, "No autorizado");
        require(_nuevoPropietario != address(0), "Direccion no valida");
        propietario = _nuevoPropietario;
    }
}



// REVERT * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
// Proporciona mensajes de error mas detallados

contract PropietarioContratoRevert {
    address public propietario;

    constructor(address _propietario) {
        require(_propietario != address(0), "Direccion no valida"); // Valida que la dirección no sea cero
        propietario = _propietario; // Asignamos la direccion proporcionada como propietario
        assert(propietario != address(0)); // Verificar que el propietario haya sido establecido correctamente.
    }

    function cambiarPropietario(address _nuevoPropietario) public  {
        if (msg.sender != propietario) {
            revert("No autorizado"); // Proporcionar mensajes de error más detallados
        }
        if (_nuevoPropietario == address(0)) {
            revert("Direccion no valida"); // Proporcionar mensajes de error más detallados
        }
        propietario = _nuevoPropietario;
    }
}