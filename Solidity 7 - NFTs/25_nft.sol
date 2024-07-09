// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface ERC721 {
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function balanceOf(address owner) external view returns (uint256 balance);
    function ownerOf(uint256 tokenId) external view returns (address owner);
    function safeTransferFrom(address from, address to, uint256 tokenId) external;
    function transferFrom(address from, address to, uint256 tokenId) external;
    function approve(address to, uint256 tokenId) external;
    function getApproved(uint256 tokenId) external view returns (address operator);
    function setApprovalForAll(address operator, bool _approved) external;
    function isApprovedForAll(address owner, address operator) external view returns (bool);
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;
}

contract ColeccionNFT is ERC721 {
    string private _nombre; //Nombre de la colección de NFTs
    string private _simbolo; // Símbolod e la colección de NFTs
    uint256 private _contadorToken; // Contador para el ID de los tokens
    mapping(uint256 => address) private _propietarios; // Mappings para almacenar propietarios, saldos, aprobaciones
    mapping(address => uint256) private _saldos;
    mapping(uint256 => address) private _aprobados;
    mapping(address => mapping(address => bool)) private _operadoresAprobados;
    mapping(uint256 => string) private _tokenURIs;

    // Constructor del contrato
    constructor(string memory nombreColeccion, string memory simboloColeccion) {
        _nombre = nombreColeccion;
        _simbolo = simboloColeccion;
        _contadorToken = 0;
    }

    // Función que retorna el nombre de la colección
    function nombre() public view returns (string memory) {
        return _nombre;
    }

    // Función para retornar el símbolo de la colección
    function simbolo() public view returns (string memory) {
        return _simbolo;
    }

    // Función para retornar el saldo de tokens de un propietario
    function balanceOf(address propietario) public view override returns (uint256) {
        return _saldos[propietario];
    }

    // Función para retornar el propietario de un token específico
    function ownerOf(uint256 tokenId) public view override returns (address) {
        address propietario = _propietarios[tokenId];
        require(propietario != address(0), "El token no existe");
        return propietario;
    }

    // Retornar la URI de un token específico
    function tokenURI(uint256 tokenId) public view returns (string memory) {
        require(_existe(tokenId), "El token no existe");
        return _tokenURIs[tokenId];
    }

    // Función para aprobar una dirección para gestionar un token específico
    function approve(address to, uint256 tokenId) public override {
        address owner = ownerOf(tokenId);
        require(to != owner, "Aprobacion al propietario actual");
        require(msg.sender == owner || isApprovedForAll(owner, msg.sender), "No autorizado para aprobar");

        _aprobados[tokenId] = to;
        emit Approval(owner, to, tokenId);
    }

    // Función para retornar la dirección aprobada de un token específico
    function getApproved(uint256 tokenId) public view override returns (address) {
        require(_existe(tokenId), "El token no existe");
        return _aprobados[tokenId];
    }

    // Aprueba o revoca a un operador para gestionar todos los tokens del remitente
    function setApprovalForAll(address operator, bool approved) public override {
        require(operator != msg.sender, "Aprobacion para el operador igual al propietario");

        _operadoresAprobados[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    // Verifica si un operador está aprobado para gestionar todos los tokens de un propietario
    function isApprovedForAll(address owner, address operator) public view override returns (bool) {
        return _operadoresAprobados[owner][operator];
    }

    // Transfiere un token de una dirección a otra
    function transferFrom(address from, address to, uint256 tokenId) public override {
        require(_esAprobadoOPropietario(msg.sender, tokenId), "No autorizado para transferir");

        _transferir(from, to, tokenId);
    }

    // Trasnferir de forma segura un token de una dirección  aotra
    function safeTransferFrom(address from, address to, uint256 tokenId) public override {
        safeTransferFrom(from, to, tokenId, "");
    }

    // Trasnferir de forma segura un token de una dirección a otra con datos adicionales
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public override {
        require(_esAprobadoOPropietario(msg.sender, tokenId), "No autorizado para transferir");
        _safeTransfer(from, to, tokenId, _data);
    }

    // Crear un nuevo NFT
    function crearNFT(address destinatario, string memory uri) public returns (uint256) {
        uint256 nuevoTokenId = _contadorToken;
        _mint(destinatario, nuevoTokenId);
        _setTokenURI(nuevoTokenId, uri);
        _contadorToken += 1;
        return nuevoTokenId;
    }

    // Verifica si un token existe
    function _existe(uint256 tokenId) internal view returns (bool) {
        return _propietarios[tokenId] != address(0);
    }

    // Verifica si un operador está aprobado o es el propietario de un token
    function _esAprobadoOPropietario(address spender, uint256 tokenId) internal view returns (bool) {
        require(_existe(tokenId), "El token no existe");
        address owner = ownerOf(tokenId);
        return (spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner, spender));
    }

    // Realiza una transferencia segura y verifica al receptor
    function _safeTransfer(address from, address to, uint256 tokenId, bytes memory _data) internal {
        _transferir(from, to, tokenId);
        require(_checkOnERC721Received(from, to, tokenId, _data), "Transferencia a un receptor no ERC721Receiver implementado");
    }

    // Crea un nuevo token y lo asisgna a una dirección
    function _mint(address destinatario, uint256 tokenId) internal {
        require(destinatario != address(0), "Direccion invalida");
        require(!_existe(tokenId), "El token ya existe");

        _propietarios[tokenId] = destinatario;
        _saldos[destinatario] += 1;

        emit Transfer(address(0), destinatario, tokenId);
    }

    // realiza la transferencia de un token desde una dirección a otra
    function _transferir(address from, address to, uint256 tokenId) internal {
        require(ownerOf(tokenId) == from, "No eres el propietario del token");
        require(to != address(0), "Direccion invalida");

        _aprobados[tokenId] = address(0);

        _saldos[from] -= 1;
        _saldos[to] += 1;
        _propietarios[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

    // Asigna la URI del token a un token específico
    function _setTokenURI(uint256 tokenId, string memory uri) internal {
        require(_existe(tokenId), "El token no existe");
        _tokenURIs[tokenId] = uri;
    }

    // Verifica si el receptor es un contrato que puede recibir tokens ERC721
    function _checkOnERC721Received(address from, address to, uint256 tokenId, bytes memory _data) private returns (bool) {
        if (_esContrato(to)) {
            try IERC721Receiver(to).onERC721Received(msg.sender, from, tokenId, _data) returns (bytes4 retval) {
                return retval == IERC721Receiver.onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert("Transferencia a un receptor no ERC721Receiver implementado");
                } else {
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }

    // Verifica si una dirección es un contrato
    function _esContrato(address cuenta) private view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(cuenta)
        }
        return size > 0;
    }
}

interface IERC721Receiver {
    function onERC721Received(address operator, address from, uint256 tokenId, bytes calldata data) external returns (bytes4);
}
