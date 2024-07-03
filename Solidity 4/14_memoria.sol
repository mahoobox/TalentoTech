// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// MEMORY - Memoria * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
// Temporalidad: los datos solo se necesitan durante la ejecución de la función}
// Costo: Operar con memory es mas barato en gas comparado con storage
// Inmutabilidad del parámetro: No se necesita almacenar el valor permanentemente ni modificar
    // nada fuera del contexto de la funcion.

contract SumarMemoria {
    //
    function sumarElementos(uint[] memory numeros) public pure returns (uint) {
        //
        uint suma = 0;

        for (uint i =0; i < numeros.length; i++) {
            suma += numeros[i];
        }

        return suma;
 
    }
}


// STORAGE - Almacenamiento * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
// Almacenar información persistente en el contrato
// Solo se puede utilizar para datos complejos como arrays, structs y mappings.
// No se puede utilizar para datos simples como uin
contract EjemploStorage {

    struct Persona {
        string nombre;
        uint edad;
    }

    // Ya es storage
    Persona[] public personas;
    // [12,26,26,26,26,26]

    function agregarPersona (string memory nombre, uint edad) public  {
        
        personas.push(Persona(nombre, edad));
    }

    function actualizarEdad (uint indice, uint nuevaEdad) public {

        // se usa storage aqui porque estamos accediendo y modificando los datos en la blockchain
        Persona storage persona = personas[indice];
        persona.edad = nuevaEdad;
    }

    function consultarPersonas() public view returns (Persona [] memory) {
        return personas;
    }
}



// CALLDATA - Datos de llamada * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// Solo lectura: Se usa cuando los datos no necesitan ser modificados.

// No usarlo cuando necesita modificar los datos

contract EjemploCalldata {
    //
    function concatenarStrings(string calldata a, string calldata b) public pure returns (string memory) {
        //
        //a = "nuevo valor"; // esto causará un error de compilacion
        return string (abi.encodePacked(a,b));
    }
}