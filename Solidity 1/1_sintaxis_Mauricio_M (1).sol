// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract MiPrimerContrato {
    // Este es el contenido de mi primer contrato inteligente
}

contract MisTiposDeDatos {
    // TIPO DATO    NOMBRE      EJEMPLO     
    // Boolean      bool        True or False
    // String       string      Hola123
    // Integers     int         12345           256 bits            Si requiero # positivos / negativos
    //              uint                        0 hasta 256 bits    Si requiero # positivos
    // Address      address     0xBFdDe7D33597f91E0834424a01E5ffBeD8546BFd
    // Byte         byte        bytes16 
}

contract OperadoresParaBooleanos {
    // !    Negación
    // &&   Conjunción "&"
    // ||   Disjunción "OR"
    // ==   Igual
    // !=   Diferente

}

contract OperadoresParaEnteros {
    // <    Menor que
    // <=   Menor o igual que
    // >    Mayor que
    // >=   Mayor o igual que
    // ==   Igual a
    // !=   Diferente a
    // +    Suma
    // -    Resta
    // *    Multiplicación
    // /    División
    // %    Módulo
    // **   Exponenciación
    // ++   Incrementar entero de 1 en 1
}

contract OperadoresParaAddress {
    // <    Menor que
    // <=   Menor o igual que
    // >    Mayor que
    // >=   Mayor o igual que
    // ==   Igual a
    // !=   Diferente a
}

contract DeclarandoVariables {

    // Tipo de dato String
    string public miNombre = "Mauricio Morales";

    // Tipo de dato int
    int public miEntero = 22;

    // Tipo de dato uint
    uint public miUnit = 2;

    //
    uint256 public miuint256 = 6;
    uint8 public miUint8bits = 8;

    address public miWalletDeEjemplo =  0xd1bd27c9bE2943e8ec0ce43d6F8B8f9Ce434EEb7;

}

// Funcionamiento de los operadores de asignación

contract OperadoresSolidity {
    uint public mi_variable_suma = 5 + 15;
    uint public diferente = -10 * - 8;
    uint public mivariable_mult = 12 * 2;
    uint public mi_variable_division = 15 / 3;
    uint public variable_modulo = 68 % 60;

}

contract Variables {
    // Se utilizan para almacenar informacion

    // SOLIDITY - - - - - - - - - - - - - - - - - - - - - - - - -
    // Variables de estado
    // Son permanentes y se almacenan en la cadena de bloques
    // Se declaran fuera de una función
    uint datosAlmacenados;

    // Variables Locales
    // Se declaran dentro de una función y su alcance está dentro de esa función.
    // Se usan normalmente de manera temporal para hacer procesamientos


    // Variables Globales
    // Existen de manera global y se utilzan para recuperar información de la cadena debloques. 
    // block.numer
    // block.timestamp
}


