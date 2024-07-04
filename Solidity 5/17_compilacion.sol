// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// PROCESO DE COMPILACIÓN 
// Se transforma el codigo fuente de solidity en bytecode
    // bytecode es el lenguaje  que utiliza la Ethereum Virtual Machine

// Pasos de compilación:
// 1. Escribir el código fuente en solidity
// 2. Compilación del código: El compilador de solidity (solc) convierte el código fuente en bytecode y ABI.
    // bytecode: código ejecutable que se despliega en la blockchain -> Va hacia la EVM
    // ABI: es una interfaz que define como interactuar con el contrato desde fuera de la blockchain (incluye detalles de las funciones y parámetros)
// 3. Despliegue del bytecode: el bytecode compilado se envia a la blockchain para desplegar el contarto.
    // Este proceso consume gas.
// 4. Interacción con el contrato: Una vez desplegado, se utiliza el ABI para interactuar con el contrato a través de transacciones y llamadas a funciones.

contract AlmacenamientoSimple {
    uint256 private dato;

    function establecer(uint256 _dato) public {
        dato = _dato;
    }

    function obtener () public view returns (uint256) {
        return dato;
    }
}

/*
Bytecode:
6080604052348015600e575f80fd5b506101438061001c5f395ff3fe608060405234801561000f575f80fd5b5060043610610034575f3560e01c8063baa40e0114610038578063f966418714610056575b5f80fd5b610040610072565b60405161004d919061009b565b60405180910390f35b610070600480360381019061006b91906100e2565b61007a565b005b5f8054905090565b805f8190555050565b5f819050919050565b61009581610083565b82525050565b5f6020820190506100ae5f83018461008c565b92915050565b5f80fd5b6100c181610083565b81146100cb575f80fd5b50565b5f813590506100dc816100b8565b92915050565b5f602082840312156100f7576100f66100b4565b5b5f610104848285016100ce565b9150509291505056fea2646970667358221220f1a90d3e1a816ec702579a9f7b207f84f2a03229ebc87ad1f5475a3dfdc9581e64736f6c634300081a0033

ABI:
[
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_dato",
				"type": "uint256"
			}
		],
		"name": "establecer",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "obtener",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]
*/