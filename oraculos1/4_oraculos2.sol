// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// interactuando con este oráculo
//https://sepolia.etherscan.io/address/0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43#code
// https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&page=1

// Definir una interfaz para interactuar con el contrato del oráculo
interface AggregatorV3Interface {
    // acá vamos a retornar la función del precio más reciente del oráculo
    function latestAnswer() external view returns (int256);
    function latestTimestamp() external view returns (uint256);
}

contract precioBTCUSD {
    // En esta variable almacenamos la instancia del oráculo de chainlink
    AggregatorV3Interface internal precioFeed;
    
    // constructor para configurar el contrato del oráculo
    constructor() public {
        precioFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);//asignamos la dirección del contrato en sepolia
    }

    // función para obtener el precio actaul de BTC / USD
    function obtenerPrecio() public view returns (int){
        int precio = precioFeed.latestAnswer(); // Llamamos a la funcion latestAnswer para obtener el precio
        return precio; 
    }

    function obtenerTimestamp() public view returns (uint256) {
        uint miTimestamp = precioFeed.latestTimestamp();
        return miTimestamp;
    }
}