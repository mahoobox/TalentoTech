// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// PROPÓSITO: CREAR UN CONTRATO SIMPLE PARA UN CASO DE TRAZABILIDAD DE PRODUCTOS
contract TrazabilidadSimple {

    struct Estado {
        string ubicacion;
        uint marcaTiempo;
    }

    struct Producto {
        string nombre;
        Estado[] historialEstados;
    }

    mapping (uint => Producto) public productos;
    uint public contadorProductos;
    // FUNCIONES
    // Función registrar producto
    function registrarProducto(string memory _nombre) public {
        contadorProductos++;
        productos[contadorProductos].nombre = _nombre;
    }
    // Función actualizar estado del producto
    function actualizarEstado(uint _idProducto, string memory _ubicacion) public  {
        require(_idProducto > 0 && _idProducto <= contadorProductos, "El producto no existe");
        productos[_idProducto].historialEstados.push(Estado({
            ubicacion: _ubicacion,
            marcaTiempo:block.timestamp
        }));
    }
    // Funcion obtener historial del producto
    function obtenerHistorial(uint _idProducto) public view returns(Estado[] memory) {
        require(_idProducto > 0 && _idProducto <= contadorProductos, "El producto no existe");
        return productos[_idProducto].historialEstados;
    }
    // Funcion obtener lista de productos
    function obtenerListaProductos() public view returns(string[] memory) {
        string[] memory listaProductos = new string[](contadorProductos);

        for (uint i = 1; i <= contadorProductos; i++) {
            listaProductos[i - 1] = productos[i].nombre;
        }

        return listaProductos;
    }
}