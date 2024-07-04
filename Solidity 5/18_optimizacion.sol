// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

// OPTIMIZACIÓN DE CÓDIGO
// Es crucial para reducir el consumo de gas y para mejorar la eficiencia del contrato.
// Algunas técnicas:
    // Usos tipos de datos eficientes (cambiar a tipos de datos mas pequeños)
    // Minimizar operaciones en bucles: (evitar bucles largos o complejos)
    // Evitar almacenamiento innecesario:  (Ejemplo utilizar calldata o memory en lugar de storage siempre que sea posible)
    // Reutilizar código.
    // View y Pure por su naturaleza de no modificar la blockchain consumen menos gas.

// Esta funcion va a obtener el valor máximo ingresado en el array [12,5,20,45,200,100,5,6]
contract EjemploGasMax {
    function encontrarMaximo (uint256[] memory valores) public pure returns (uint256) {
        uint256 maximo = valores[0];

        for (uint256 i = 1; i < valores.length; i++) {
            if (valores[i] > maximo) {
                maximo = valores[i];
            }
        }
        return maximo;
    }


    function encontrarMaximoOptimizado (uint256[] memory valores) public pure returns (uint256) {
        uint256 maximo = valores[0];
        uint256 longitud = valores.length; // con esto optimizamos para que no se repita el conteo de elementos del array dentro del ciclo

        for (uint256 i = 1; i < longitud; i++) {
            if (valores[i] > maximo) {
                maximo = valores[i];
            }
        }
        return maximo;
    }

    // funcion que los suma
    function sumarElementos (uint256[] memory valores) public pure returns (uint256) {
        uint256 suma = 0;

        for (uint256 i = 0; i < valores.length; i++) {
            suma += valores[i];
        }
        return suma;
    }

    function sumarElementosOptimizada (uint256[] memory valores) public pure returns (uint256) {
        uint256 suma = 0;
        uint256 longitud = valores.length;

        for (uint256 i = 0; i < longitud; i++) {
            suma += valores[i];
        }
        return suma;
    }

}



