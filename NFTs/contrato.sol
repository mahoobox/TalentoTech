// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ColeccionNFT is ERC721URIStorage, Ownable {
    uint private _contadorToken;
    mapping(address => uint[]) private _tokensDeUsuario;

    constructor(string memory nombreColeccion, string memory simboloColeccion)
        ERC721(nombreColeccion, simboloColeccion)
        Ownable(msg.sender)
    {
        _contadorToken = 0;
    }

    function crearNFT (address destinatario, string memory uri) public onlyOwner returns(uint) {
        uint nuevoTokenId = _contadorToken;
        _mint(destinatario, nuevoTokenId);
        _setTokenURI(nuevoTokenId, uri);
        _tokensDeUsuario[destinatario].push(nuevoTokenId);
        _contadorToken++;
        return nuevoTokenId;
    }

    function getNTFsusuario(address usuario) public view returns(uint[] memory) {
        return _tokensDeUsuario[usuario];
    }

}

