// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// EVENTOS
// Una manera de registrar información en la cadena de bloques para ser escuchada por 
// aplicaciones externas
// Permiten que el contrato emita información durante la ejecucion de una transacción
// Facilita la comunicación entre el contrato inteligente y el mundo exterior.

contract Transferir {

    event Transferencia (address indexed desde, address indexed hacia, uint256 cantidad);
    // 'indexed' permite filtrar los registros de acuerdo a este parámetro en los logs de la blockchain
    // esto facilita la búsqueda de eventos específicos relacionados con una dirección.

    // Función para transfereir ether desde el contrato a otra dirección
    function transferir (address payable destinatario, uint256 cantidad) public payable {
       require(address(this).balance >= cantidad, "Saldo insuficiente");

       destinatario.transfer(cantidad);

       emit Transferencia(address(this), destinatario, cantidad );
    }


    function obtenerSaldo (address direccion) public view returns (uint256) {
        // retorno el saldo de la dirección ingresada
        // el método .balance retorna el saldo de la dirección a la que se adjunta
        return direccion.balance;
    }

    function obtenerSaldoBilleteraPropia () public view returns (uint256) {
        return msg.sender.balance;
    }

        // función para recibir ether en el contrato
    // Esta función especial que permite al contrato recibir ether
    receive() external payable {

    }

    // PFFFFF. TODO ERA UN ERROR AL USAR REMIX.

    
}